if (!isDedicated) then {
	player_death 		=	compile preprocessFileLineNumbers "FEAR\custom\player_death.sqf";				// Custom player death screen
	local_lockUnlock	=	compile preprocessFileLineNumbers "FEAR\custom\local_lockUnlock.sqf";			// R3F prevent towing locked vehicles
	local_zombieDamage	=	compile preprocessFileLineNumbers "FEAR\custom\fn_damageHandlerZ.sqf";			// Head-shot only zombies!
	SHK_pos 		= 	compile preprocessFileLineNumbers "FEAR\shk_pos\shk_pos_init.sqf";				// Get random position
};
