// ----------------------------------------------------------------------------
//	NUKE Initialise
//	These scripts are based around the EMS 3.0 mission scripts by Vampire
// ----------------------------------------------------------------------------

if (!isDedicated) exitWith {};

// The minimum time in seconds before a cruise missile launch.
// At least this much time will pass between launches.
NUKETimerMin = 1800; // 30 minutes: 1800

// Maximum time in seconds before a cruise missile launch.
// A cruise missile will always launch before this much time has passed.
NUKETimerMax = 5400; // 1.5 hours: 5400

// Blast radius in km
nukeRadius = 1000;

// Ground zero - total annihilation
groundZero = nukeRadius / 2;

nukeDetonate = false;
publicVariable "nukeDetonate";

// Load functions
call compile preprocessFileLineNumbers "\z\addons\dayz_server\FEAR\NUKE\NUKEFunctions.sqf";

// Start the missile launch countdown!
execVM "\z\addons\dayz_server\FEAR\NUKE\NUKETimer.sqf";

// Let's get the Marker Re-setter running for JIPs (Join In Progress) to stay updated
execVM "\z\addons\dayz_server\FEAR\NUKE\NUKEMarkerLoop.sqf";

diag_log format ["[NUKE]: Initiating NUKE."];
