// --------------------------------------------------------------------------------------------
//	NUKE System Functions
//	Purpose	:	Returns a random city/town as target site for the nuke blast.
// --------------------------------------------------------------------------------------------

NUKETarget = {
	private ["_cnps","_towns","_town","_townPos"];
	
	// Get town locations in 20000 radius from centre of map
    _cnps = getArray (configFile >> "CfgWorlds" >> worldName >> "centerPosition");
    _towns = nearestLocations [_cnps,["nameCity","NameCityCapital"],20000]; // Removed "NameVillage" - only towns and cities get nuked
	
	// Select a random town from array
	_town = _towns call BIS_fnc_selectRandom;
	
    // Assign town name
	townName = text _town;
	
	// Get town position
	_townPos = position _town;
	_townPos
};