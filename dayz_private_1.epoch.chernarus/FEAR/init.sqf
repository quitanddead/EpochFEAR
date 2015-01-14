// ------------------------
// FEAR - Mission.PBO Init 
// ------------------------

// ---------------------------------------------------------------------
// Default player load-out
DefaultMagazines = ["ItemHeatPack","ItemBandage","7Rnd_45ACP_1911"];
DefaultWeapons = ["ItemFlashlight","Colt1911","ItemMap"];
DefaultBackpack = "DZ_Patrol_Pack_EP1";
DefaultBackpackWeapon = "";
// ---------------------------------------------------------------------

// Initialize the Variables
call compile preprocessFileLineNumbers "FEAR\custom\FEARVariables.sqf";
call compile preprocessFileLineNumbers "FEAR\custom\FEARCompiles.sqf";

// Server watermark: adding a logo in the bottom left corner of the screen with the server name in it
dayZ_serverName = "F.E.A.R.";	
if (!isNil "dayZ_serverName") then {
	[] spawn {
		waitUntil {(!isNull Player) and (alive Player) and (player == player)};
		waitUntil {!(isNull (findDisplay 46))};
		5 cutRsc ["wm_disp","PLAIN"];
		((uiNamespace getVariable "wm_disp") displayCtrl 1) ctrlSetText dayZ_serverName;
	};
};

If (isServer) then {
	execVM "\z\addons\dayz_server\FEAR\bases\balotaairfieldaddons.sqf";	// Balota airfield additions
	execVM "\z\addons\dayz_server\FEAR\bases\chernomilitarybase.sqf";	// Chernogorsk Military base
	execVM "\z\addons\dayz_server\FEAR\bases\northeastairfield.sqf";	// North east airfield
	execVM "\z\addons\dayz_server\FEAR\bases\berezinonavalbase.sqf";	// Berezino naval base
	execVM "\z\addons\dayz_server\FEAR\bases\northwestairfield.sqf";	// North west airfield
	execVM "\z\addons\dayz_server\FEAR\bases\zelenogorskaddons.sqf";	// Zelenogorsk additions
	execVM "\z\addons\dayz_server\FEAR\bases\billboards.sqf";		// Billboards
	execVM "\z\addons\dayz_server\FEAR\bases\tikhaya_city.sqf";		// City in SW corner
	execVM "\z\addons\dayz_server\FEAR\bases\lhd.sqf";			// Aircraft carrier in Chernogorsk
	execVM "\z\addons\dayz_server\FEAR\bases\dk_ChernoBlocks.sqf";		// Apartment Blocks to the north of Cherno
	execVM "\z\addons\dayz_server\FEAR\bases\dk_ChernoHill.sqf";		// Base east of Cherno on the small Hill
	execVM "\z\addons\dayz_server\FEAR\bases\dk_GrassCutter.sqf";
	execVM "\z\addons\dayz_server\FEAR\bases\dk_Medvedskoye.sqf";		// 3,5km long road from Pobeda Dam leads to the new Town
	execVM "\z\addons\dayz_server\FEAR\bases\dk_Skalisty.sqf";		// Skalisty Island
};

if (!isDedicated) then {
	execVM "FEAR\custom\server_welcomecredits.sqf";				// Server welcome messages
	execVM "FEAR\custom\custom_monitor.sqf";				// Custom debug monitor
	execVM "FEAR\trade_from_vehicle\setup\init.sqf";			// Trade from backpack/vehicle
	execVM "FEAR\custom\fix_rating.sqf";					// Can't get in vehicle together when the other player is wearing a hostile skill
	execVM "FEAR\custom\loginCamera.sqf";					// Intro camera scene
	execVM "FEAR\custom\earthquake_event.sqf";				// Earthquake event
	execVM "FEAR\custom\ambientSFX.sqf";	 		 		// Ambient sound FX (this needs to be after SHK_pos as it is used in that script)
	execVM "FEAR\custom\spawn_zombie_herd.sql";				// Spawn zombie herd
	execVM "FEAR\service_point\service_point.sqf";				// Service Point refuel/repair
	execVM "FEAR\DZAI_Client\dzai_initclient.sqf";				// DZAI client-side addon
	execVM "FEAR\NUKE\NUKEinit.sqf";					// NUKE!
};

execVM "FEAR\R3F_ARTY_AND_LOG\init.sqf";					// R3F Lift and Tow
execVM "FEAR\safezone\init.sqf";						// Trader safe zones
