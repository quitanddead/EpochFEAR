private [ "_camera", "_camDistance" ];
_camDistance = 60;
 
waitUntil {!isNil ("PVDZE_plr_LoginRecord")};
playsound "introsound";

//intro move
showCinemaBorder true;
camUseNVG false;
 
_camera = "camera" camCreate [(position player select 0)-100*sin (round(random 359)), (position player select 1)-100*cos (round(random 359)),(position player select 2)+_camDistance];
_camera cameraEffect ["internal","back"];
 
_camera camSetFOV 2.000;
_camera camCommit 0;
waitUntil {camCommitted _camera};
 
_camera camSetTarget vehicle player;
_camera camSetRelPos [0,0,2];
_camera camCommit 10;
 
waitUntil {camCommitted _camera};
 
_camera cameraEffect ["terminate","back"];
camDestroy _camera;