// ------------------
//	Earthquake Timer
// ------------------

private["_timeVar","_run"];

diag_log format ["[EarthQuake]: Starting timer"];

// Calculate time variation
_timeVar = (1800 - 300) + 300;;	// (maxTime - minTime) + minTime (3600 - 300) + 300;

// Initialise loop
_run = true;
while {_run} do {

	// Wait for a random period
	sleep round(random _timeVar);
	
	triggerQuake = true;
	publicVariable "triggerQuake";
	
	// Wait for NUKE script to complete
	waitUntil {!triggerQuake};
};