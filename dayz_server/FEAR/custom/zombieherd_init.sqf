// ---------------------------------------
//	Spawn zombie hoard in random building
// ---------------------------------------

private["_fnc_getRandomBuildingPos","_fnc_createTriggers"];

_fnc_getRandomBuildingPos = {
	private["_buildings","_cnps","_triggerLocations","_triggerLocation"];
	
	// Array of buildings where zombies can super spawn
	_buildings = ["Land_A_GeneralStore_01","Land_A_GeneralStore_01a","Land_A_Hospital","Land_A_Office01","Land_A_Office02","Land_Ind_Workshop01_01","Land_Ind_Workshop01_02","Land_Mil_ControlTower","Land_Mil_Barracks_i","Land_SS_hangar","Land_a_stationhouse","Land_stodola_old_open","Land_stodola_open","Land_Church_03","housev_1i4","Land_Panelak2","Land_Farm_Cowshed_b"];
	
	// Get array of possible locations
	_cnps = getArray (configFile >> "CfgWorlds" >> worldName >> "centerPosition");
    _triggerLocations = nearestObjects [_cnps,_buildings,20000];
	
	// Select a random location from array
	_triggerLocation = getPos (_triggerLocations call BIS_fnc_selectRandom);
	_triggerLocation
};

_fnc_createTriggers = {
	private["_triggerIndex","_pos","_trigName","_trig_cond","_trig_act_stmnt","_trig_deact_stmnt"];
	
	_triggerIndex = _this select 0;
	
	_pos = call _fnc_getRandomBuildingPos;
	// Debug position - test in Balota supermarket
	//_pos = [4390.6685, 2533.4827, -301.08487];
	
	// Create trigger to spawn patrol
	_trigName = format ["herdTrig%1", _triggerIndex];
	_this = createTrigger ["EmptyDetector", _pos]; 
	_this setTriggerArea [5, 5, 0, false];
	_this setTriggerActivation ["WEST", "present", false];
	
	// Assign trigger conditions
	_trig_cond = "{(isPlayer _x) && ((vehicle _x) isKindOf ""Man"")} count thisList > 0"; // Trigger if any player is in range
	_trig_act_stmnt = "execVM ""\z\addons\dayz_server\FEAR\custom\triggerZombieHerd.sqf""";
	_trig_deact_stmnt = format ["deleteVehicle %1", _trigName]; // Delete trigger once activated
	
	_this setTriggerStatements [_trig_cond, _trig_act_stmnt, _trig_deact_stmnt];
	
	diag_log format ["[ZombieHerd]: Trigger created at %1", _pos];
};

if (isDedicated) then {
	private["_i","_numberOfTriggers"];
	
	_numberOfTriggers = 9; // total triggers to create on map
	
	for "_i" from 0 to _numberOfTriggers do {
		[_i] call _fnc_createTriggers;
	};
};