// ---------------------------------------------------------------------------
//	predatorZombie_init.sqf
//	Based on original script: Sneaky Hunter AI 1.0 (SQF version) by Rydygier
// ---------------------------------------------------------------------------		

private["_cnps","_locations","_previousLocations","_fnc_getRandomLocation","_fnc_createTriggers"];

// Get an array of town locations in a 20000 radius from the centre of the map
_cnps = getArray (configFile >> "CfgWorlds" >> worldName >> "centerPosition");
_locations = nearestLocations [_cnps, ["FlatArea","Hill","RockArea","VegetationBroadleaf","VegetationFir","VegetationPalm","VegetationVineyard"], 20000];

// Initialise previous location array
_previousLocations = [];

_fnc_getRandomLocation = {
	private["_location"];

	// Select a random town from array
	_location = _locations call BIS_fnc_selectRandom;
	while {(text _location == "") || (text _location in _previousLocations)} do {
		_location = _locations call BIS_fnc_selectRandom;;
	};	
		
	// Add current town name to previous town array (set method is fastest)
	_previousLocations set [count _previousLocations,text _location];
	_location
};

// Choose a player unit as target!
_fnc_createTriggers = {
	private["_triggerIndex","_location","_locationName","_pos","_trigName","_trig_cond","_trig_act_stmnt","_trig_deact_stmnt"];
	
	_triggerIndex = _this select 0;
	
	_location = call _fnc_getRandomLocation; // Get random town
	_locationName = text _location; // Get town name
	_pos = position _location; // Get _location position
	
	// Create trigger to spawn patrol
	_trigName = format ["zpTrig%1", _triggerIndex];
	_this = createTrigger ["EmptyDetector", _pos]; 
	_this setTriggerArea [500, 500, 0, false];
	_this setTriggerActivation ["WEST", "present", false];
	
	// Assign trigger conditions
	_trig_cond = "{(isPlayer _x) && ((vehicle _x) isKindOf ""Man"")} count thisList > 0"; // Trigger if any player is in range
	_trig_act_stmnt = format ["[%1] execVM ""\z\addons\dayz_server\FEAR\predator_zombie\predatorZombie_spawn.sqf""", _pos];
	_trig_deact_stmnt = format ["deleteVehicle %1", _trigName]; // Delete trigger once activated
	
	_this setTriggerStatements [_trig_cond, _trig_act_stmnt, _trig_deact_stmnt];
};

if (isServer) then {
	private["_i","_numberOfTriggers"];

	_numberOfTriggers = 4; // total triggers to create on map
	
	for "_i" from 0 to _numberOfTriggers do {
		[_i] call _fnc_createTriggers; // Use loop index to number trigger names
		sleep 0.125;
	};

	diag_log format ["[Predator Zombie]: Triggers created at: %1", _previousLocations];
};