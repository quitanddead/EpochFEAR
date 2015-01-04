// --------------------------
//	Fuck you hospital glass!
//	By cyrq
// --------------------------
 
private ["_hospital","_point","_findHospital"];
 
_hospital = "Land_A_Hospital"; // Hospital class
_point = getMarkerpos "center"; // Centre (Novy Sobor)
_findHospital = (_point) nearObjects [_hospital,20000]; // Find all Hospitals
 
if (count _findHospital > 0) then { // Count all hospitals in Chernarus
	diag_log ("Fuck you hospital glass!: Hospitals found: " + str(count _findHospital)); // Fancy diag_log
	{_x setHit ["glass",1]} forEach _findHospital; // Set damage only to the glass for every Land_A_Hospital in Chernarus
	diag_log ("Fuck you hospital glass!: Hospital glass destroyed in " + str(count _findHospital) + " buildings"); // Fancy diag_log part 2
};