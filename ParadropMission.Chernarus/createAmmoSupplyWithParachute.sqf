_planeC130J = _this select 0;
_ammoType = _this select 1;

_tbox = createVehicle [_ammoType, [0,0,0], [], 1, "CAN_COLLIDE"];

_paraShute = createVehicle ["ParachuteMediumWest", [getPos _planeC130J select 0,getPos _planeC130J select 1,(getPos _planeC130J select 2) - 20], [], 0, "CAN_COLLIDE"];
			
_tbox attachTo [_paraShute, [0,0,0]];
_paraShute attachTo [_groupC130J, [0,0,-20]];

sleep 0.5;
detach _paraShute;

waitUntil 
{
	if ( abs((position _tbox select 2)) < 0.08)
		exitWith {true};  // has to return true to continue	
};
_pos = position _tbox;
detach _tbox;

deleteVehicle _tbox;
_tbox = createVehicle [_ammoType, [0,0,0], [], 1, "CAN_COLLIDE"];
_tbox setpos _pos;
