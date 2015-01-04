// ---------------------------------------------------------------------------
//	predatorZombie_spawn.sqf
//	Based on original script: Sneaky Hunter AI 1.0 (SQF version) by Rydygier
// ---------------------------------------------------------------------------

private["_pos","_hunted","_hunter","_mark","_mark2"];

_pos = _this select 0; // Trigger position

diag_log format ["[Predator Zombie]: Spawn created at: %1", _pos];

// Get all players within a 1000m radius of trigger and select one as the victim!
_fnc_selectVictim = {
	private["_pos","_playersInTrigger","_return"];
	_pos = _this select 0;
	
	_playersInTrigger = [];
	{
		if ((isPlayer _x) && (_x distance _pos < 1000)) then {
			// Add to array
			_playersInTrigger set [count _playersInTrigger, _x];
		};
	}forEach allUnits;
	
	_return = _playersInTrigger;
	_return
};

// Spawn hunter unit
_fnc_createHunter = {
	private["_pos","_hunterGrp","_hunter"];
	_pos = _this select 0;
	
	// Select random zombie skin
	_zombieTypes = ["zZombie_Base", "z_worker3", "z_worker2", "z_worker1", "z_villager1", "z_villager2", "z_villager3", "z_worker3", "z_worker2", 
					"z_worker1", "z_villager1", "z_villager2", "z_villager3", "z_worker3", "z_worker2", "z_worker1", "z_villager1", "z_villager2", "z_villager3"];
	_zombieType = _zombieTypes call BIS_fnc_selectRandom;
	
	// Assign enemy Group
	_hunterGrp = createGroup EAST;
	// Createunit from array of zombies
	_hunter = _hunterGrp createUnit [_zombieType, _pos, [], 10, "FORM"];
	// Ensure no weapons, hunter attacks with melee only
	removeAllWeapons _hunter;
	_hunter
};

// Assign hunted group from players in radius
_hunted = [_pos] call _fnc_selectVictim;
_hunter = [_pos] call _fnc_createHunter;

// [hunted unit, max trail lifetime in seconds] (older "footprints" will be removed)
{[_x, 3600] spawn RYD_H_MyTrail} forEach _hunted;

/*
[hunter unit, 
smell sensitivity,
eyes sensitivity [light factor,movement factor],
hunted unit(s),
loiter radius if no prey nor trail known if 0 - unlimited, 
force of the hunter's strike multiplier]
*/
// [_hunter, 3, [1.5,1.5], _hunted, 200, 1] (original settings)
RYD_Hunter_FSM_handle = [_hunter, 3, [1.5, 1.5], _hunted, 0, 100] execFSM "\z\addons\dayz_server\FEAR\predator_zombie\RYD_Hunter.fsm";

// Assign random position around player
_hunter setPos ([_pos, 20, 50] call RYD_H_RandomAroundMM); //[_pos, 60, 150]
// Use SHK function instead, the native one sucks!
//_hunter setPos ([position _hunted, random 300, random 360, false] call SHK_pos_getPos); // [position,distance,direction,water]

// Predator position, make public to position sound for player in MissionPBO
// This should increase the fear factor!
PredatorPlayerName = _hunted;
publicVariable "PredatorPlayerName";

sleep 0.5;

PredatorZombiePos = (getPosATL _hunter);
publicVariable "PredatorZombiePos";

sleep 0.5;

triggerPredatorZombie = true;
publicVariable "triggerPredatorZombie";

// Debug option
RYDHnt_Dbg = false;
if (RYDHnt_Dbg) then {
	_mark = [(getPosATL _hunter),_hunter,"markHunter","ColorPink","ICON","mil_dot","","",[0.8,0.8]] call RYD_H_Mark;

	{
		_mark2 = [(getPosATL _x),_x,"markHunted","ColorBlue","ICON","mil_dot","","",[0.8,0.8]] call RYD_H_Mark;
		_x setVariable ["RYD_H_MarkHunted",_mark2];
	} forEach _hunted;

	while {true} do {
		sleep 0.2;
		_mark setMarkerPos (getPosATL _hunter);
		
		{
			_mark2 = _x getVariable ["RYD_H_MarkHunted",""];
			_mark2 setMarkerPos (getPosATL _x);
			_mark2 setMarkerText (format ["%1 - %2",(_x knowsAbout _hunter),round (_x distance _hunter)])
		} forEach _hunted;
	}
};