private["_killsZ","_killsH","_killsB","_humanity","_headShots","_fps","_pic","_stime","_hours","_minutes","_minutes2"];

fnc_debug = {
    debugMonitor = true;
    while {debugMonitor} do
    {
        _killsZ = player getVariable["zombieKills",0];
        _killsH = player getVariable["humanKills",0];
        _killsB = player getVariable["banditKills",0];
        _humanity = round(player getVariable["humanity",0]);
        _headShots = player getVariable["headShots",0];
	_fps = round(diag_fps);
		
	// Displays player name
	//_txt = '';
        //_txt = (gettext (configFile >> 'CfgVehicles' >> (typeof vehicle player) >> 'displayName'));
		
	_pic = (gettext (configFile >> 'CfgVehicles' >> (typeof vehicle player) >> 'picture'));
	if (player == vehicle player) then
	{
		_pic = (gettext (configFile >> 'CfgWeapons' >> (currentWeapon player) >> 'picture'));
	}
	else
	{
		_pic = (gettext (configFile >> 'CfgVehicles' >> (typeof vehicle player) >> 'picture'));
	};
		
	_stime = round(36000 - serverTime);
	_hours = (_stime/60/60);
	_hours = toArray (str _hours);
	_hours resize 1;
	_hours = toString _hours;
	_hours = compile _hours;
	_hours = call _hours;
	_minutes = floor(_stime/60);
	_minutes2 = _minutes - (_hours*60);
								
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
		<t size='1' font='Bitstream' align='left' color='#EEC900'>Uptime:</t><t size='1' font='Bitstream' align='right' color='#FFFFFF'>%10h %11m</t><br/>
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
		_hours,
        	_minutes2];
		
    sleep 1;
    };
};
 
[] spawn fnc_debug;
