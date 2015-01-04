// ------------------------------------------
//	Earthquake event
//	Uses NUKEEnvironment earthQuake function
// ------------------------------------------

while {(!isDedicated) && (true)} do {
	triggerQuake = false;
    sleep 1;
      
    waitUntil {triggerQuake};
	
	player spawn earthQuake;
	
	triggerQuake = false;
	publicVariable "triggerQuake";
};