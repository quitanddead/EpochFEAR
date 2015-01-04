// -------------
//	Ambient SFX
// -------------

selectSFX = {
	private["_towns","_soundArray","_index","_sound"];
	
	// Determine players location - urban or countryside?
	// Get an array of all the towns near the player in a 500 radius.
	// if they're within this range, then assume they are in a town.
	_towns = nearestLocations [getPos player,["NameCityCapital","NameCity","NameVillage"],500];
	
	_soundArray = nil;
	// Assign array dependant on player location
	if ((count _towns) != 0) then {
		// Urban sound FX
		_soundArray = ["girlscreaming","doorcreak1","metalcrash","zombienoise1","childrenlaughing","doorcreak2","babycry1","glassbreak1"];
	} else {	
		// Countryside sound FX
		_soundArray = ["wolfhowl1","girlscreaming","snappingtwigs","leafcrunch","woodlandcrunch","zombienoise1","eeriewind"];
	};
	
	// Pick a sound from array
	_index = floor random count _soundArray;
	_sound = _soundArray select _index;
	
	_return = _sound;
	_return
};

ambientSoundFX = {
	private["_sound","_randomPos","_soundSource"];
	
	_sound = call selectSFX;
	_randomPos = [getPos player,random 360,[100,400]] call SHK_pos;
	_soundSource = "HeliHEmpty" createVehicle  _randomPos;
	
	//_message = format ["%1 %2 %3",_sound,_randomPos,_soundSource];
	//titleText [_message, "PLAIN"];
	
	_soundSource, player say3D _sound;
};

while {(!isDedicated) && (true)} do {
	private["_pause"];
	
	// Pause for a random amount of time
	_pause = 300 + random 900;
    sleep _pause;
	
	// Not in a vehicle
	if (vehicle player == player) then {[] spawn ambientSoundFX};
};