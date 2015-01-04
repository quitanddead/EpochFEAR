private["_i","_genzombie","_playerpos","_agent","_zombieselectedpos"];

ZombieType = ["zZombie_Base", "z_worker3", "z_worker2", "z_worker1", "z_villager1", "z_villager2", "z_villager3", "z_worker3", "z_worker2", "z_worker1", "z_villager1", "z_villager2", "z_villager3", "z_worker3", "z_worker2", "z_worker1", "z_villager1", "z_villager2", "z_villager3"];

while {(!isDedicated) && (true)} do {

	zombieHerd = false;
	sleep 1;
	waitUntil {zombieHerd};
	
	_playerpos = getposATL player;
	
	_i = 1;
	for "_i" from 1 to 50 do
	{
		_genzombie = ZombieType call BIS_fnc_selectRandom;
		_agent = createAgent [_genzombie, _playerpos, [], 40, "NONE"];
		_zombieselectedpos = getPosATL _agent;
		[_zombieselectedpos,_agent] execFSM "\z\addons\dayz_code\system\zombie_agent.fsm";
	};
	
	sleep 1;
	zombieHerd = false;
	
};
