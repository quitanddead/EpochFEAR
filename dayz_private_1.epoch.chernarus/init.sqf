/*	
	For DayZ Epoch
	Addons Credits: Jetski Yanahui by Kol9yN, Zakat, Gerasimow9, YuraPetrov, zGuba, A.Karagod, IceBreakr, Sahbazz
*/
startLoadingScreen ["","RscDisplayLoadCustom"];
cutText ["","BLACK OUT"];
enableSaving [false, false];

//REALLY IMPORTANT VALUES
dayZ_instance =	11;		//The instance
dayzHiveRequest = [];
initialized = false;
dayz_previousID = 0;

//Disable Greeting Menu 
player setVariable ["BIS_noCoreConversations", true];

//Disable radio messages to be heard and shown in the left lower corner of the screen
enableRadio false;

//May prevent "how are you civillian?" messages from NPC
enableSentences false;

//--------------------------------------------------------------------//
//------------------------DayZ Epoch Config---------------------------//
//--------------------------------------------------------------------//

//Map & Player Spawn Variables
spawnShoremode = 1; 				// Default: 1 (on shore)
spawnArea= 1500; 				// Default: 1500
dayz_paraSpawn = false;				// Default: false
dayz_fullMoonNights = true;			// Default: false
dayz_MapArea = 14000;				// Default: 10000

//Do Not Edit - Chernarus Specific
dayz_minpos = -1; 				// Do Not Edit - Chernarus Specific
dayz_maxpos = 16000;				// Do Not Edit - Chernarus Specific

//Item Spawn Variables
MaxHeliCrashes= 5; 				// Default: 5
MaxVehicleLimit = 300; 				// Default: 50
MaxDynamicDebris = 500; 			// Default: 100
MaxMineVeins = 50;				// Default: 50
MaxAmmoBoxes = 3;				// Default: 3

//Zombie Variables
dayz_maxZeds = 500;				// Total zombie limit (Default: 500)
dayz_maxLocalZombies = 30; 			// Max number of zombies spawned per player. (Default: 15)
dayz_maxGlobalZombiesInit = 40;			// Starting global max zombie count, this will increase for each player within 400m (Default: 40)
dayz_maxGlobalZombiesIncrease = 10;		// Global zombie limit increase per player within 400m (Default: 10)
dayz_zedsAttackVehicles = true;			// Zombies attacking vehicles. (Default: true)

//Animal Variables
dayz_maxAnimals = 10; 				// Default: 8
dayz_tameDogs = true;				// Default: false

//Trader Variables
dayz_sellDistance_vehicle = 10;			// Default: 10
dayz_sellDistance_boat = 30;			// Default: 30
dayz_sellDistance_air = 40;			// Default: 40

//Player Variables
DZE_R3F_WEIGHT = true;				// Default: true
DZE_FriendlySaving = true;			// Default: true
DZE_PlayerZed = false;				// Default: true
DZE_BackpackGuard = true;			// Enable/Disable backpack contents being wiped if logging out or losing connection beside another player. (Default: true)
DZE_SelfTransfuse = true;			// Default: false
DZE_selfTransfuse_Values = [6000, 15, 300];	// Default: [12000, 15, 300]; = [blood amount, infection chance, cool-down (seconds)]

//Name Tags
DZE_ForceNameTags = false;			// Default: false
DZE_ForceNameTagsOff = false;			// Default: false
DZE_ForceNameTagsInTrader = false;		// Default: false
DZE_HumanityTargetDistance = 25;		// Default: 25

//Death Messages
DZE_DeathMsgGlobal = false;			// Enable global chat messaging of player deaths. (Also requires enableRadio true) (Default: false)
DZE_DeathMsgSide = false;			// Enable side chat messaging of player deaths. (Also requires enableRadio true) (Default: false)
DZE_DeathMsgTitleText = true;			// Enable global title text messaging of player deaths. (Default: false)

//Vehicles Variables
DZE_AllowForceSave = false;			// Default: false
DZE_AllowCargoCheck = false;			// Default: false
DZE_HeliLift = true;				// Default: true
DZE_HaloJump = true;				// Default: true
DZE_AntiWallLimit = 3;				// Default: 3
DynamicVehicleDamageLow = 0; 			// Sets the lowest possible damage a fresh spawned vehicle will have. (Default: 0) 
DynamicVehicleDamageHigh = 75; 			// Sets the highest possible damage a fresh spawned vehicle will have. (Default: 100)
DynamicVehicleFuelLow = 25;			// Sets the lowest possible fuel level a fresh spawned vehicle will have. (Default: 0) 
DynamicVehicleFuelHigh = 100;			// Sets the highest possible fuel level a fresh spawned vehicle will have. (Default: 100) 
DZE_vehicleAmmo = 0;				// Enable/Disable machine gun ammo for vehicles with turrets being set to 0 ammo on server restarts. (Default = 0, 1 to disable, 0 to enable)

//Build Variables
DZE_GodModeBase = true;				// Default: false
DZE_BuildingLimit = 1000;			// Default: 150
DZE_requireplot = 1;				// Default: 1
DZE_PlotPole = [50,65];				// Default: [30,45] = [x,y]
DZE_BuildOnRoads = false; 			// Default: false

// A Plot for Life
DZE_APlotforLife = true;			// Turn on A plot for Life (check ownership against SteamID).
DZE_PlotOwnership = true;			// Turn on Take Plot Ownership (take ownership of all items on a plot except locked items). This can be used to realign old bases to the A Plot of Life ownership system or for raiding and taking over bases.
DZE_modularBuild = true;			// Turn on Snap Build Pro and the modular player build framework.

//--------------------------------------------------------------------//
//--------------------------------------------------------------------//
//--------------------------------------------------------------------//

//Server Events
// Can be used to execVM a script on a specific Year,Month,Day,Hour,Minute or ANY.
// This will fire the crash_spawner.sqf at the top of the hour and again on 30 mins.
EpochEvents = [
["any","any","any","any",0,"crash_spawner"],
["any","any","any","any",30,"crash_spawner"],
["any","any","any","any",15,"supply_drop"]
];

//Load In Compiled Functions
call compile preprocessFileLineNumbers "FEAR\A_Plot_for_Life\init\variables.sqf";		//Initilize the Variables (IMPORTANT: Must happen very early)
progressLoadingScreen 0.1;
call compile preprocessFileLineNumbers "FEAR\A_Plot_for_Life\init\publicEH.sqf";		//Initilize the publicVariable event handlers
progressLoadingScreen 0.2;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\setup_functions_med.sqf";	//Functions used by CLIENT for medical
progressLoadingScreen 0.4;
call compile preprocessFileLineNumbers "FEAR\A_Plot_for_Life\init\compiles.sqf";		//Compile regular functions
progressLoadingScreen 0.5;
call compile preprocessFileLineNumbers "server_traders.sqf";					//Compile trader configs
progressLoadingScreen 1.0;

// F.E.A.R. Fuck Everything and RUN!!!
[] ExecVM "FEAR\init.sqf";

"filmic" setToneMappingParams [0.153, 0.357, 0.231, 0.1573, 0.011, 3.750, 6, 4]; setToneMapping "Filmic";

if (isServer) then {
	//Compile Vehicle Configs
	call compile preprocessFileLineNumbers "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\dynamic_vehicle.sqf";

	//Add Trader Cities
	_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\mission.sqf";
	_serverMonitor = [] execVM "\z\addons\dayz_code\system\server_monitor.sqf";
};

if (!isDedicated) then {
	//Conduct Map Operations
	0 fadeSound 0;
	waitUntil {!isNil "dayz_loadScreenMsg"};
	dayz_loadScreenMsg = (localize "STR_AUTHENTICATING");
	
	//Run The Player Monitor
	_id = player addEventHandler ["Respawn", {_id = [] spawn player_death;}];
	_playerMonitor = [] execVM "\z\addons\dayz_code\system\player_monitor.sqf";	
	
	//Anti-Hack
	[] execVM "\z\addons\dayz_code\system\antihack.sqf";

	//Lights
	[false,12] execVM "\z\addons\dayz_code\compile\local_lights_init.sqf";
};

//Start Dynamic Weather
execVM "\z\addons\dayz_code\external\DynamicWeatherEffects.sqf";

#include "\z\addons\dayz_code\system\REsec.sqf"
#include "\z\addons\dayz_code\system\BIS_Effects\init.sqf"
