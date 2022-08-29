_planeC130J = _this select 0;
_ammoBoxType =  _this select 1; 
//"USBasicAmmunitionBox";

_dropPos = getPos _planeC130J;
_zPos = 0;
_tbox = [];

_tbox0 = createVehicle [_ammoBoxType, [0,0,0] , [], 1, "CAN_COLLIDE"];
_tbox0 hideObject true; 
_tbox0 setPos _dropPos;
_tbox set [count _tbox, _tbox0];

_paraShute = createVehicle ["ParachuteMediumWest", [_dropPos select 0,_dropPos select 1,(_dropPos select 2) - 20], [], 1, "CAN_COLLIDE"];

_tbox0 attachTo [_paraShute, [-1.2 ,-1.25,-2]];
_paraShute attachTo [_groupC130J, [0,0,-20]];


_i = 0;
for "_y" from 0 to 5 do
{
	//Start of the Center 
	_j = 0;
	for "_x" from 0 to 3 do
	{
		_xInterval = _j;
		_yInterval = _i;
		_zInterval = 0;
		_tbox1 = createVehicle [_ammoBoxType, [0, 0, _zPos], [], 1, "CAN_COLLIDE"];
		_tbox set [count _tbox, _tbox1];
		_tbox1 attachTo [_tbox0, [_xInterval,_yInterval,_zInterval]];
		
		_xInterval = _j;
		_yInterval = _i;
		_zInterval = 0.4;
		_tbox1 = createVehicle [_ammoBoxType, [0, 0, _zPos], [], 1, "CAN_COLLIDE"];
		_tbox set [count _tbox, _tbox1];
		_tbox1 attachTo [_tbox0, [_xInterval,_yInterval,_zInterval]];

		_xInterval = _j;
		_yInterval = _i;
		_zInterval = 0.8;
		_tbox1 = createVehicle [_ammoBoxType, [0, 0, _zPos], [], 1, "CAN_COLLIDE"];
		_tbox set [count _tbox, _tbox1];
		_tbox1 attachTo [_tbox0, [_xInterval,_yInterval,_zInterval]];

		_xInterval = _j;
		_yInterval = _i;
		_zInterval = 1.2;
		_tbox1 = createVehicle [_ammoBoxType, [0, 0, _zPos], [], 1, "CAN_COLLIDE"];
		_tbox set [count _tbox, _tbox1];
		_tbox1 attachTo [_tbox0, [_xInterval,_yInterval,_zInterval]];

		_xInterval = _j;
		_yInterval = _i;
		_zInterval = 1.6;
		_tbox1 = createVehicle [_ammoBoxType, [0, 0, _zPos], [], 1, "CAN_COLLIDE"];
		_tbox set [count _tbox, _tbox1];
		_tbox1 attachTo [_tbox0, [_xInterval,_yInterval,_zInterval]];
		
		_xInterval = _j;
		_yInterval = _i;
		_zInterval = 2;
		_tbox1 = createVehicle [_ammoBoxType, [0, 0, _zPos], [], 1, "CAN_COLLIDE"];
		_tbox set [count _tbox, _tbox1];
		_tbox1 attachTo [_tbox0, [_xInterval,_yInterval,_zInterval]];
		//End Of the Center
		_j = _j + 0.8;
	};

	_i = _i + 0.5;
};

waitUntil 
{
	if ( abs((getPosATL _paraShute select 2)) < 3.5)
		exitWith {true};  // has to return true to continue	
};
_tbox0 hideObject false; 
_dropPos = getPosATL _tbox0;
_zPos = 0;
detach _tbox0;

{
	_tbox = _tbox - [x];
	deleteVehicle _x;
} foreach _tbox;

_tbox0 = createVehicle [_ammoBoxType, [0,0,0], [], 1, "CAN_COLLIDE"];
_tbox0 hideObject true; 
_tbox0 setPos _dropPos;
_zPos = 0;
_tbox set [count _tbox, _tbox0];
_i = 0;
for "_y" from 0 to 5 do
{
	//Start of the Center 
	_j = 0;
	for "_x" from 0 to 3 do
	{
		_xInterval = _j;
		_yInterval = _i;
		_zInterval = 0;
		_tbox1 = createVehicle [_ammoBoxType, [0, 0, _zPos], [], 1, "CAN_COLLIDE"];
		_tbox set [count _tbox, _tbox1];
		_tbox1 attachTo [_tbox0, [_xInterval,_yInterval,_zInterval]];
		
		_xInterval = _j;
		_yInterval = _i;
		_zInterval = 0.4;
		_tbox1 = createVehicle [_ammoBoxType, [0, 0, _zPos], [], 1, "CAN_COLLIDE"];
		_tbox set [count _tbox, _tbox1];
		_tbox1 attachTo [_tbox0, [_xInterval,_yInterval,_zInterval]];

		_xInterval = _j;
		_yInterval = _i;
		_zInterval = 0.8;
		_tbox1 = createVehicle [_ammoBoxType, [0, 0, _zPos], [], 1, "CAN_COLLIDE"];
		_tbox set [count _tbox, _tbox1];
		_tbox1 attachTo [_tbox0, [_xInterval,_yInterval,_zInterval]];

		_xInterval = _j;
		_yInterval = _i;
		_zInterval = 1.2;
		_tbox1 = createVehicle [_ammoBoxType, [0, 0, _zPos], [], 1, "CAN_COLLIDE"];
		_tbox set [count _tbox, _tbox1];
		_tbox1 attachTo [_tbox0, [_xInterval,_yInterval,_zInterval]];

		_xInterval = _j;
		_yInterval = _i;
		_zInterval = 1.6;
		_tbox1 = createVehicle [_ammoBoxType, [0, 0, _zPos], [], 1, "CAN_COLLIDE"];
		_tbox set [count _tbox, _tbox1];
		_tbox1 attachTo [_tbox0, [_xInterval,_yInterval,_zInterval]];
		
		_xInterval = _j;
		_yInterval = _i;
		_zInterval = 2;
		_tbox1 = createVehicle [_ammoBoxType, [0, 0, _zPos], [], 1, "CAN_COLLIDE"];
		_tbox set [count _tbox, _tbox1];
		_tbox1 attachTo [_tbox0, [_xInterval,_yInterval,_zInterval]];
		//End Of the Center
		_j = _j + 0.8;
	};

	_i = _i + 0.5;
};
_tbox0 hideObject false; 