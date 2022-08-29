//_scriptParaHandle = [alpha,500,50,300,"AlphaDropZone",plane1] execVM "initializeParatroopers.sqf";
_groupCompany = _this select 0;
_planeAltitude = _this select 1;
_planeSpeed = _this select 2;
_startDropDistance = _this select 3;
_dropLocationMarker = _this select 4;
_planeC130J = _this select 5;

_planeC130J flyInHeight _planeAltitude;
_dropLocation = getMarkerPos _dropLocationMarker;
_groupCompanyArray = units _groupCompany;

{
	_x moveInCargo _planeC130J;
	_scriptMonitor = [_x] execVM "monitorUnit.sqf";
} foreach _groupCompanyArray;

//Set velocity and direction of the plane
_planeDefaultVelocity = velocity _planeC130J;
_planeDefaultDirection = direction _planeC130J;
_planeC130J setVelocity [( sin _planeDefaultDirection * _planeSpeed),( cos _planeDefaultDirection * _planeSpeed),0];
_handle=[_planeC130J,_planeAltitude] execvm "flyinheightasl.sqf";

_distance = _dropLocation distance _planeC130J;//hypotenuse
_distance = sqrt ((_distance * _distance)  - ( _planeAltitude * _planeAltitude) ); // horizontal distance

//Wait and Check the plane distance to the marker before starting unloading troops

//_scriptWeapon = [_groupCompanyArray] execVM "initializeWeapons.sqf";

waitUntil 
{
	_distance = _dropLocation distance _planeC130J;
	_distance = sqrt ((_distance * _distance)  - ( _planeAltitude * _planeAltitude) ); // check the horizontal distance of plane from the marker, start dropping at given yRadius

	if ( _distance <= _startDropDistance) 
		exitWith {true};  // has to return true to continue
};
 
_total = count _groupCompanyArray;


{
	unassignvehicle _x;
	_x action ["EJECT", _planeC130J]; 
	sleep  0.5;
} foreach _groupCompanyArray;

//for "_i" from 0 to _total do
//{
//	_x = _groupCompanyArray select (_total - _i);
//	_x action ["EJECT", _planeC130J];
//	sleep 0.5;
//};


//10 second sleep before deleting plane and pilot
sleep 20; 
terminate _handle;
deleteVehicle _planeC130J;
deleteVehicle _pilotC130J;
