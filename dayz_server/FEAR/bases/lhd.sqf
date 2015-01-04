if (isServer) then {
	if (true) then
	{
	  _this = createVehicle ["Land_sign_ulgano", [6924.2881, 2239.9829, -0.28258881], [], 0, "CAN_COLLIDE"];
	  _this setDir 52.858837;
	  _this setVehicleLock "LOCKED";
	  _this setVehicleInit "this setpos [(getpos this select 0),(getpos this select 1), 0]; nul = [this] execVM ""create_lhd.sqf""";
	  _this setPos [6924.2881, 2239.9829, -0.28258881];
	};
};