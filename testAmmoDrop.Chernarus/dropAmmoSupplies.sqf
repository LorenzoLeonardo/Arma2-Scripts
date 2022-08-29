_caller = _this select 0;
_grpName = _this select 1;
_planeAltitude = _this select 2;
_planeSpeed = _this select 3;
_yDistance = _this select 4;
_yDroppingRadius = _this select 5;

_callerTexMarker = str format["%1 : Requesting Ammo Supply.",_caller];
_callerMarker = createMarkerLocal [_grpName, position _caller];
_callerMarker setMarkerSizeLocal [1,1];
_callerMarker setMarkerShapeLocal "ICON";
_callerMarker setMarkerTypeLocal "hd_destroy";
_callerMarker setMarkerDirLocal 45;
_callerMarker setMarkerTextLocal _callerTexMarker;
_callerPosition = getMarkerPos _callerMarker;

switch (_grpName) do
{
	case "ALPHA":
	{
		_callerMarker setMarkerColorLocal "ColorBlue";
	};
	case "BRAVO":
	{
		_callerMarker setMarkerColorLocal "ColorRed";
	};

	case "CHARLIE":
	{
		_callerMarker setMarkerColorLocal "ColorOrange";
	};

	case "DELTA":
	{
		_callerMarker setMarkerColorLocal "ColorYellow";
	};

	case "TEST":
	{
		_callerMarker setMarkerColorLocal "ColorBlack";
	};
	default
	{
	};
};
_caller sideRadio "RadioAmmoSupplyRequestAlpha";
sleep 9.5;
[west,"Base"] sideRadio "RadioPapaBearAmmoSupplyRequestReply";
sleep 8;

//create a group of the plane
_groupC130J = createGroup west;
//create Pilot
_pilotC130J = _groupC130J createUnit ["USMC_Soldier_Pilot", [0,0,1], [], 0, "CARGO"];
_groupC130J setGroupID["NOVEMBER"];

_pilotC130J sideRadio "RadioNovemberAmmoSupplyRequestConfirm";
sleep 7.5;
//create C130
_planeC130J = createVehicle ["C130J",[0,0,_planeAltitude], [], 0, "FLY"];
//move Pilot as plane driver
_pilotC130J moveInDriver _planeC130J; //move pilot as driver of the C130

//initialize the position of the plane. With respect to the caller
_planeC130J setpos [ _callerPosition select 0, (_callerPosition select 1) - _yDistance, _planeAltitude];
_planeC130J flyInHeight _planeAltitude;

//Set velocity and direction of the plane
_planeDefaultVelocity = velocity _planeC130J;
_planeDefaultDirection = direction _planeC130J;
_planeC130J setVelocity [( sin _planeDefaultDirection * _planeSpeed),( cos _planeDefaultDirection * _planeSpeed),0];
_handle=[_planeC130J,_planeAltitude] execvm "flyinheightasl.sqf";

//set plane waypoint yDistance ahead of the caller.
_planeWPPos =  [ _callerPosition select 0, (_callerPosition select 1), _planeAltitude];
_planeWP = _groupC130J addWaypoint [_planeWPPos, 0]; // Add way point to caller's position
_planeWP setWaypointSpeed "NORMAL";
_planeWP setWaypointType "MOVE"; 
_planeWP setWaypointFormation "DIAMOND";
_planeWP setWaypointBehaviour "SAFE";

_planeWPPos =  [ _callerPosition select 0, (_callerPosition select 1) + _yDistance, _planeAltitude];
_planeWP = _groupC130J addWaypoint [_planeWPPos, 0]; // Add way point to caller's position

_planeWPPos =  [ _callerPosition select 0, (_callerPosition select 1) + (_yDistance * 2), _planeAltitude];
_planeWP = _groupC130J addWaypoint [_planeWPPos, 0]; // Add way point to caller's position

_planeWPPos =  [ _callerPosition select 0, (_callerPosition select 1) + (_yDistance * 3), _planeAltitude];
_planeWP = _groupC130J addWaypoint [_planeWPPos, 0]; // Add way point to caller's position

_distance = _callerPosition distance _planeC130J;
_distance = sqrt ((_distance * _distance)  - ( _planeAltitude * _planeAltitude) ); // check the horizontal distance of plane from the marker, start dropping at 

_caller sideRadio "RadioAlphaAmmoSupplyWaiting";

waitUntil 
{
	_distance = _callerPosition distance _planeC130J;
	_distance = sqrt ((_distance * _distance)  - ( _planeAltitude * _planeAltitude) ); // check the horizontal distance of plane from the marker, start dropping at given yRadius

	if ( _distance <= _yDroppingRadius) 
		exitWith {true};  // has to return true to continue
};

//USBasicAmmunitionBox
//USLaunchersBox
//USOrdnanceBox
//USBasicWeaponsBox
//USSpecialWeaponsBox
//USVehicleBox
_pilotC130J sideRadio "RadioAirbaseDropPackage";
_delayDropInterval = 0.2;
[_planeC130J,"USBasicAmmunitionBox"] execvm "createAmmoPack.sqf";
sleep _delayDropInterval;
[_planeC130J,"USLaunchersBox"] execvm "createAmmoSupplyWithParachute.sqf";
sleep _delayDropInterval;
[_planeC130J,"USBasicWeaponsBox"] execvm "createAmmoSupplyWithParachute.sqf";
sleep _delayDropInterval;
[_planeC130J,"USSpecialWeaponsBox"] execvm "createAmmoSupplyWithParachute.sqf";
sleep _delayDropInterval;
[_planeC130J,"USLaunchersBox"] execvm "createAmmoSupplyWithParachute.sqf";
sleep _delayDropInterval;
[_planeC130J,"USBasicWeaponsBox"] execvm "createAmmoSupplyWithParachute.sqf";
sleep _delayDropInterval;
[_planeC130J,"USSpecialWeaponsBox"] execvm "createAmmoSupplyWithParachute.sqf";
sleep _delayDropInterval;

sleep 10;
deleteVehicle _planeC130J;
deleteVehicle _pilotC130J;
deleteMarkerLocal _callerMarker;