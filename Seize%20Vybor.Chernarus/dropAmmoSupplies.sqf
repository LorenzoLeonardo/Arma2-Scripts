_caller = _this select 0;
_grpName = _this select 1;
_planeAltitude = _this select 2;
_planeSpeed = _this select 3;
_yDistance = _this select 4;
_yDroppingRadius = _this select 5;
_ammoType = _this select 6;

//USBasicAmmunitionBox
//USLaunchersBox
//USOrdnanceBox
//USBasicWeaponsBox
//USSpecialWeaponsBox
//USVehicleBox

_caller sideChat format["Come in Papa Bear. We need ammo supplies in this area. Over?"]  ;
_callerTexMarker = str format["%1 : Requesting Ammo Supply.",_caller];
_callerMarker = createMarkerLocal [_callerTexMarker, position _caller];
_callerMarker setMarkerSizeLocal [1,1];
_callerMarker setMarkerShapeLocal "ICON";
_callerMarker setMarkerTypeLocal "hd_destroy";
_callerMarker setMarkerDirLocal 45;
_callerMarker setMarkerTextLocal _callerTexMarker;
_callerPosition = getMarkerPos _callerMarker;

switch (_grpName) do
{
	case "ALPHA SQUAD":
	{
		_callerMarker setMarkerColorLocal "ColorBlue";
	};
	case "BRAVO SQUAD":
	{
		_callerMarker setMarkerColorLocal "ColorRed";
	};

	case "CHARLIE SQUAD":
	{
		_callerMarker setMarkerColorLocal "ColorOrange";
	};

	case "DELTA SQUAD":
	{
		_callerMarker setMarkerColorLocal "ColorYellow";
	};

	case "ECHO SQUAD":
	{
		_callerMarker setMarkerColorLocal "ColorBrown";
	};

	case "FOXTROT SQUAD":
	{
		_callerMarker setMarkerColorLocal "ColorGrey";
	};

	case "TEST SQUAD":
	{
		_callerMarker setMarkerColorLocal "ColorBlack";
	};
	default
	{
	};
};

uiSleep 5;
[West, "HQ"]  sideChat format["Copy that %1, ammo support plane is dispatching. Out!", _grpName];
uiSleep 5;

//create a group of the plane
_groupC130J = createGroup west;
//create C130
_planeC130J = createVehicle ["C130J",[0,0,_planeAltitude], [], 0, "FLY"];
//create Pilot
_pilotC130J = _groupC130J createUnit ["USMC_Soldier_Pilot", [0,0,1], [], 0, "CARGO"];
//move Pilot as plane driver
_pilotC130J moveInDriver _planeC130J; //move pilot as driver of the C130

//initialize the position of the plane. With respect to the caller
_planeC130J setpos [ _callerPosition select 0, (_callerPosition select 1) - _yDistance, _planeAltitude];
_planeC130J flyInHeight _planeAltitude;

//Set velocity and direction of the plane
_planeDefaultVelocity = velocity _planeC130J;
_planeDefaultDirection = direction _planeC130J;
_planeC130J setVelocity [( sin _planeDefaultDirection * _planeSpeed),( cos _planeDefaultDirection * _planeSpeed),0];

//set plane waypoint yDistance ahead of the caller.
_planeWPPos =  [ _callerPosition select 0, (_callerPosition select 1), _planeAltitude];
_planeWP = _groupC130J addWaypoint [_planeWPPos, 0]; // Add way point to caller's position
_planeWP setWaypointSpeed "FULL";
_planeWP setWaypointType "MOVE"; 
_planeWP setWaypointFormation "DIAMOND";
_planeWP setWaypointBehaviour "AWARE";

_planeWPPos =  [ _callerPosition select 0, (_callerPosition select 1) + _yDistance, _planeAltitude];
_planeWP = _groupC130J addWaypoint [_planeWPPos, 0]; // Add way point to caller's position

_planeWPPos =  [ _callerPosition select 0, (_callerPosition select 1) + (_yDistance * 2), _planeAltitude];
_planeWP = _groupC130J addWaypoint [_planeWPPos, 0]; // Add way point to caller's position

_planeWPPos =  [ _callerPosition select 0, (_callerPosition select 1) + (_yDistance * 3), _planeAltitude];
_planeWP = _groupC130J addWaypoint [_planeWPPos, 0]; // Add way point to caller's position

_distance = _callerPosition distance _planeC130J;
_distance = sqrt ((_distance * _distance)  - ( _planeAltitude * _planeAltitude) ); // check the horizontal distance of plane from the marker, start dropping at 

_pilotC130J sideChat format["%1, Ammo support plane ETA %2. Over!", _grpName, _distance/_planeSpeed];

waitUntil 
{
	_distance = _callerPosition distance _planeC130J;
	_distance = sqrt ((_distance * _distance)  - ( _planeAltitude * _planeAltitude) ); // check the horizontal distance of plane from the marker, start dropping at given yRadius

	if ( _distance <= _yDroppingRadius) 
		exitWith {true};  // has to return true to continue
};

_tbox = createVehicle [_ammoType, [0,0,0], [], 0, "NONE"];

_tbox1 = createVehicle [_ammoType, [0,0,0], [], 0, "NONE"];
_tbox2 = createVehicle [_ammoType, [0,0,0], [], 0, "NONE"];
_tbox3 = createVehicle [_ammoType, [0,0,0], [], 0, "NONE"];
_tbox4 = createVehicle [_ammoType, [0,0,0], [], 0, "NONE"];
_tbox5 = createVehicle [_ammoType, [0,0,0], [], 0, "NONE"];
_tbox6 = createVehicle [_ammoType, [0,0,0], [], 0, "NONE"];
_tbox7 = createVehicle [_ammoType, [0,0,0], [], 0, "NONE"];
_tbox8 = createVehicle [_ammoType, [0,0,0], [], 0, "NONE"];
_tbox9 = createVehicle [_ammoType, [0,0,0], [], 0, "NONE"];
_tbox10 = createVehicle [_ammoType, [0,0,0], [], 0, "NONE"];
_tbox11 = createVehicle [_ammoType, [0,0,0], [], 0, "NONE"];
_tbox12 = createVehicle [_ammoType, [0,0,0], [], 0, "NONE"];
_tbox13 = createVehicle [_ammoType, [0,0,0], [], 0, "NONE"];
_tbox14 = createVehicle [_ammoType, [0,0,0], [], 0, "NONE"];
_tbox15 = createVehicle [_ammoType, [0,0,0], [], 0, "NONE"];

_tbox16 = createVehicle [_ammoType, [0,0,0], [], 0, "NONE"];
_tbox17 = createVehicle [_ammoType, [0,0,0], [], 0, "NONE"];
_tbox18 = createVehicle [_ammoType, [0,0,0], [], 0, "NONE"];
_tbox19 = createVehicle [_ammoType, [0,0,0], [], 0, "NONE"];
_tbox20 = createVehicle [_ammoType, [0,0,0], [], 0, "NONE"];
_tbox21 = createVehicle [_ammoType, [0,0,0], [], 0, "NONE"];
_tbox22 = createVehicle [_ammoType, [0,0,0], [], 0, "NONE"];
_tbox23 = createVehicle [_ammoType, [0,0,0], [], 0, "NONE"];
_tbox24 = createVehicle [_ammoType, [0,0,0], [], 0, "NONE"];
_tbox25 = createVehicle [_ammoType, [0,0,0], [], 0, "NONE"];
_tbox26 = createVehicle [_ammoType, [0,0,0], [], 0, "NONE"];
_tbox27 = createVehicle [_ammoType, [0,0,0], [], 0, "NONE"];
_tbox28 = createVehicle [_ammoType, [0,0,0], [], 0, "NONE"];
_tbox29 = createVehicle [_ammoType, [0,0,0], [], 0, "NONE"];
_tbox30 = createVehicle [_ammoType, [0,0,0], [], 0, "NONE"];
_tbox31 = createVehicle [_ammoType, [0,0,0], [], 0, "NONE"];
_tbox32 = createVehicle [_ammoType, [0,0,0], [], 0, "NONE"];

_tbox1  attachTo [_tbox, [0.0,0.0,0.4]];
_tbox2  attachTo [_tbox, [0.0,0.4,0.0]];
_tbox3  attachTo [_tbox, [0.0,0.4,0.4]];
_tbox4  attachTo [_tbox, [0.0,0.8,0.0]];
_tbox5  attachTo [_tbox, [0.0,0.8,0.4]];
_tbox6  attachTo [_tbox, [0.0,1.2,0.0]];
_tbox7  attachTo [_tbox, [0.0,1.2,0.4]];
_tbox8  attachTo [_tbox, [0.8,0.0,0.0]];
_tbox9  attachTo [_tbox, [0.8,0.0,0.4]];
_tbox10 attachTo [_tbox, [0.8,0.4,0.0]];
_tbox11 attachTo [_tbox, [0.8,0.4,0.4]];
_tbox12 attachTo [_tbox, [0.8,0.8,0.0]];
_tbox13 attachTo [_tbox, [0.8,0.8,0.4]];
_tbox14 attachTo [_tbox, [0.8,1.2,0.0]];
_tbox15 attachTo [_tbox, [0.8,1.2,0.4]];
_tbox16 attachTo [_tbox, [0.0,0.0,0.8]];				//_tbox	[0,0,0]
_tbox17 attachTo [_tbox, [0.0,0.0,1.2]];
_tbox18 attachTo [_tbox, [0.0,0.4,0.8]];
_tbox19 attachTo [_tbox, [0.0,0.4,1.2]];
_tbox20 attachTo [_tbox, [0.0,0.8,0.8]];
_tbox21 attachTo [_tbox, [0.0,0.8,1.2]];
_tbox22 attachTo [_tbox, [0.0,1.2,0.8]];
_tbox23 attachTo [_tbox, [0.0,1.2,1,2]];
_tbox24 attachTo [_tbox, [0.8,0.0,0.8]];
_tbox25 attachTo [_tbox, [0.8,0.0,1.2]];
_tbox26 attachTo [_tbox, [0.8,0.4,0.8]];
_tbox27 attachTo [_tbox, [0.8,0.4,1.2]];
_tbox28 attachTo [_tbox, [0.8,0.8,0.8]];
_tbox29 attachTo [_tbox, [0.8,0.8,1.2]];
_tbox30 attachTo [_tbox, [0.8,1.2,0.8]];
_tbox31 attachTo [_tbox, [0.8,1.2,1.2]];
_tbox32 attachTo [_tbox, [0.0,1.2,1.2]];

_paraShute = createVehicle ["ParachuteMediumWest", [getPos _planeC130J select 0,getPos _planeC130J select 1,(getPos _planeC130J select 2)], [], 0, "NONE"];
			
_tbox attachTo [_paraShute, [-0.4,-0.6,-1.2]];
_paraShute attachTo [_groupC130J, [-0.4,-0.6,-1.2]];

_pilotC130J sideChat format["%1, Ammo support plane is now dropping the package.", _grpName];
sleep 0.5;

detach _paraShute;

waitUntil 
{
	if ( abs((position _tbox select 2)) < 0.15) 
		exitWith {true};  // has to return true to continue	
};

detach _tbox;
	
_caller sideChat format["Papa Bear, ammo package just arrived safely.", _grpName];

deleteVehicle _planeC130J;
deleteVehicle _pilotC130J;
deleteMarkerLocal _callerMarker;