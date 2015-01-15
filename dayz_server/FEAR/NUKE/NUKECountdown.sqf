// ---------------
//	Launch NUKE!
// ---------------

if (isDedicated) then {
	private["_coords","_nukePad","_varName","_message"];
	
	// NUKETarget gets random position from list of all cities, towns and villages
	_coords = call NUKETarget;
	
	diag_log format ["[NUKE]: Target: %1", townName];
	
	// ----------------------
	// Debug launch in Chernogorsk
	//_coords = [6437,2714,0];
	//townName = "Chernogorsk";
	// ----------------------

	// Assign _coords as a PublicVariable: nukeCoords
	// This is used in the NUKEMarkerLoop.sqf and Mission.PBO NUKE files
	_nukePad = createVehicle ["HeliHEmpty",_coords,[],0,"NONE"];
	_varName = "nukeCoords";
	_nukePad setVehicleVarName _varName;
	_nukePad call compile format ["%1=_This ; PublicVariable ""%1""",_varName];

	// Inform players to get the hell out of dodge!
	// 3 minute timer till impact
	_message = format["Remnants of the CDC have implemented a nuclear tactical solution to the infection. You have %1 minutes to get %2k clear of %3.",3,(nukeRadius/1000),townName];
	[nil,nil,rTitleText,_message,"PLAIN",10] call RE;

	// NUKEAddMarker is a simple script that adds a marker to the location
	[_coords] execVM "\z\addons\dayz_server\FEAR\NUKE\NUKEAddMarker.sqf";

	// Start air-raid siren
	nukeSiren = true;
	publicVariable "nukeSiren";

	// Wait 2 minutes
	sleep 120;
	// Give warning on 1 minute to go
	_message = format["You now have %1 minute to get %2k clear of %3.",1,(nukeRadius/1000),townName];
	[nil,nil,rTitleText,_message,"PLAIN",10] call RE;
	sleep 60;
	
	// Broadcast nukeDetonate to clients
	// This will enable the NUKE script
	nukeDetonate = true;
	publicVariable "nukeDetonate";
	
	[_coords] execVM "\z\addons\dayz_server\FEAR\NUKE\NUKEServerDamage.sqf";

	diag_log format["[NUKE]: Cruise missile has reached its target."];
	
	sleep 1;
	
	// Remove map markers
	deleteMarker "NUKEMarkerO";
	deleteMarker "NUKEMarkerR";
	deleteMarker "NUKEDot";
	
	nukeDetonate = false;
	publicVariable "nukeDetonate";
	
	sleep 120; // wait 2 minutes before fallout creates the radzone
	
	// Inform players about radiation zone
	_message = format["You will need to keep clear of %1 until the radiation cloud dissipates.",townName];
	[nil,nil,rTitleText,_message,"PLAIN",10] call RE;
	
	nukeRadZone = True;
	publicVariable "nukeRadZone";
	
	// Add radiation zone marker
	execVM "\z\addons\dayz_server\FEAR\NUKE\NUKEAddRadMarker.sqf";
	// Activate radiation zone
	[_coords] execVM "\z\addons\dayz_server\FEAR\NUKE\NUKERadZone.sqf";
	
	// Delete nukepad
	deleteVehicle _nukePad;
	
	// Wait length of time for RadZone (15 minutes)
	sleep 900;
	
	nukeRadZone = False;
	publicVariable "nukeRadZone";
};
