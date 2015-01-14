private["_pic","_humanity","_killsZ","_killsB","_killsH","_headShots","_fps","_serverRestartMinutes"];

fnc_debug = {
    debugMonitor = true;
    while {debugMonitor} do
    {
    	_pic = (gettext (configFile >> 'CfgVehicles' >> (typeof vehicle player) >> 'picture'));
	// If not in vehicle
	if (player == vehicle player) then
	{	// Get current weapon
		_pic = (gettext (configFile >> 'CfgWeapons' >> (currentWeapon player) >> 'picture'));
	}
	else
	{	// Get current vehicle
		_pic = (gettext (configFile >> 'CfgVehicles' >> (typeof vehicle player) >> 'picture'));
	};
	_humanity = round(player getVariable["humanity",0]);
	_killsZ = player getVariable["zombieKills",0];
	_killsB = player getVariable["banditKills",0];
	_killsH = player getVariable["humanKills",0];
	_headShots = player getVariable["headShots",0];
	_fps = round(diag_fps);
	_serverRestartMinutes = round(360-(serverTime) / 60); // 360 minutes = 6 hours server restart
	
	hintSilent parseText format ["
		<img size='4.75' image='%1'/><br/>
		<t size='1' font='Bitstream' align='left' color='#EE0000'>Blood:</t><t size='1' font='Bitstream' align='right' color='#FFFFFF'>%2</t><br/>
		<t size='1' font='Bitstream' align='left' color='#157DEC'>Humanity:</t><t size='1' font='Bitstream' align='right' color='#FFFFFF'>%3</t><br/>
		<t size='1' font='Bitstream' align='left' color='#EEC900'>Days:</t><t size='1' font='Bitstream' align='right' color='#FFFFFF'>%4</t><br/>
		<t size='1' font='Bitstream' align='left' color='#EEC900'>Zombies:</t><t size='1' font='Bitstream' align='right' color='#FFFFFF'>%5</t><br/>
		<t size='1' font='Bitstream' align='left' color='#EEC900'>Bandits:</t><t size='1' font='Bitstream' align='right' color='#FFFFFF'>%6</t><br/>
	        <t size='1' font='Bitstream' align='left' color='#EEC900'>Murders:</t><t size='1' font='Bitstream' align='right' color='#FFFFFF'>%7</t><br/>
	        <t size='1' font='Bitstream' align='left' color='#EEC900'>Headshots:</t><t size='1' font='Bitstream' align='right' color='#FFFFFF'>%8</t><br/>
	        <t size='1' font='Bitstream' align='left' color='#EEC900'>FPS:</t><t size='1' font='Bitstream' align='right' color='#FFFFFF'>%9</t><br/>
		<t size='1' font='Bitstream' align='left' color='#EEC900'>Restart:</t><t size='1' font='Bitstream' align='right' color='#FFFFFF'>%10m</t><br/>
		",
		_pic,
		r_player_blood,
		_humanity,
		dayz_Survived,
		_killsZ,
		_killsB,
		_killsH,
		_headShots,
		_fps,
		_serverRestartMinutes];
		
	sleep 1;
	};
};

[] spawn fnc_debug;
