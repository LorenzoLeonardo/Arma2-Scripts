//Created By : Lorenzo Leonardo
//Example : nul=[player,300,50,1000] execvm "dropSupportTeam.sqf"; 
//nul=[calling unit = player,altitude = 300, planespeed = 50, plane yDistance From caller = 1000, startdropping radius = 100, _seizemarkerName] execvm "dropSupportTeam.sqf";
//parameters
_caller = _this select 0;
_supportGrpName = _this select 1;
_planeAltitude = _this select 2;
_planeSpeed = _this select 3;
_yDistance = _this select 4;
_yDroppingRadius = _this select 5;
_seizeMarkerName = _this select 6;
_callerPosition = getMarkerPos _seizeMarkerName;
	
//create a group of the plane
_groupC130J = createGroup west;
//create C130
_planeC130J = createVehicle ["C130J",[0,0,_planeAltitude], [], 0, "FLY"];
//create Pilot
_pilotC130J = _groupC130J createUnit ["USMC_Soldier_Pilot", [0,0,1], [], 0, "CARGO"];
//move Pilot as plane driver
_pilotC130J moveInDriver _planeC130J; //move pilot as driver of the C130
//Set Group ID For Plane Drop Support
_groupC130J setGroupID ["AIRBASE"];

_pilotC130J sideRadio "RadioAirbaseSupport";
uiSleep 7;
	
//initialize the position of the plane. With respect to the caller
_planeC130J setpos [ _callerPosition select 0, (_callerPosition select 1) - _yDistance, _planeAltitude];
_planeC130J flyInHeight _planeAltitude;

//Set velocity and direction of the plane
_planeDefaultVelocity = velocity _planeC130J;
_planeDefaultDirection = direction _planeC130J;
_planeC130J setVelocity [( sin _planeDefaultDirection * _planeSpeed),( cos _planeDefaultDirection * _planeSpeed),0];

//create a support team
_groupSupportTeam = createGroup west; 
"USMC_Soldier_TL" createUnit [[0,0,1], _groupSupportTeam, "this moveInCargo _planeC130J", 1, "LIEUTENANT"];
"USMC_Soldier_SL" createUnit [[0,0,1], _groupSupportTeam, "this moveInCargo _planeC130J", 1, "SERGEANT"];
"USMC_Soldier_AR" createUnit [[0,0,1], _groupSupportTeam, "this moveInCargo _planeC130J", 1, "SERGEANT"];
"USMC_Soldier_MG" createUnit [[0,0,1], _groupSupportTeam, "this moveInCargo _planeC130J", 1, "SERGEANT"];
"USMC_SoldierS_SniperH" createUnit [[0,0,1], _groupSupportTeam, "this moveInCargo _planeC130J", 1, "SERGEANT"];
"USMC_SoldierS_SniperH" createUnit [[0,0,1], _groupSupportTeam, "this moveInCargo _planeC130J", 1, "SERGEANT"];
"USMC_SoldierS_Spotter" createUnit [[0,0,1], _groupSupportTeam, "this moveInCargo _planeC130J", 1, "SERGEANT"];
"USMC_SoldierM_Marksman" createUnit [[0,0,1], _groupSupportTeam, "this moveInCargo _planeC130J", 1, "SERGEANT"];
"USMC_Soldier_AT" createUnit [[0,0,1], _groupSupportTeam, "this moveInCargo _planeC130J", 1, "SERGEANT"];
"USMC_Soldier_AT" createUnit [[0,0,1], _groupSupportTeam, "this moveInCargo _planeC130J", 1, "SERGEANT"];
"USMC_Soldier_MG" createUnit [[0,0,1], _groupSupportTeam, "this moveInCargo _planeC130J", 1, "CORPORAL"];
"USMC_Soldier_GL" createUnit [[0,0,1], _groupSupportTeam, "this moveInCargo _planeC130J", 1, "CORPORAL"];
"USMC_Soldier_GL" createUnit [[0,0,1], _groupSupportTeam, "this moveInCargo _planeC130J", 1, "CORPORAL"];
"USMC_Soldier_GL" createUnit [[0,0,1], _groupSupportTeam, "this moveInCargo _planeC130J", 1, "CORPORAL"];
"USMC_Soldier_GL" createUnit [[0,0,1], _groupSupportTeam, "this moveInCargo _planeC130J", 1, "CORPORAL"];
"USMC_Soldier_GL" createUnit [[0,0,1], _groupSupportTeam, "this moveInCargo _planeC130J", 1, "PRIVATE"];
"USMC_Soldier_GL" createUnit [[0,0,1], _groupSupportTeam, "this moveInCargo _planeC130J", 1, "PRIVATE"];
"USMC_Soldier_GL" createUnit [[0,0,1], _groupSupportTeam, "this moveInCargo _planeC130J", 1, "PRIVATE"];
"USMC_Soldier_AT" createUnit [[0,0,1], _groupSupportTeam, "this moveInCargo _planeC130J", 1, "PRIVATE"];
"USMC_Soldier_AT" createUnit [[0,0,1], _groupSupportTeam, "this moveInCargo _planeC130J", 1, "PRIVATE"];
"USMC_Soldier_AT" createUnit [[0,0,1], _groupSupportTeam, "this moveInCargo _planeC130J", 1, "PRIVATE"];
"USMC_Soldier_AT" createUnit [[0,0,1], _groupSupportTeam, "this moveInCargo _planeC130J", 1, "PRIVATE"];
"USMC_Soldier_Medic" createUnit [[0,0,1], _groupSupportTeam, "this moveInCargo _planeC130J", 1, "PRIVATE"];
"USMC_Soldier_Medic" createUnit [[0,0,1], _groupSupportTeam, "this moveInCargo _planeC130J", 1, "PRIVATE"];
_groupSupportTeam setGroupID [_supportGrpName];
_supportTeamArray = units _groupSupportTeam;
_total = count _supportTeamArray;

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

_distance = _callerPosition distance _planeC130J;//hypotenuse
_distance = sqrt ((_distance * _distance)  - ( _planeAltitude * _planeAltitude) ); // horizontal distance

//Wait and Check the plane distance to the marker before starting unloading troops
waitUntil 
{
	_distance = _callerPosition distance _planeC130J;
	_distance = sqrt ((_distance * _distance)  - ( _planeAltitude * _planeAltitude) ); // check the horizontal distance of plane from the marker, start dropping at given yRadius

	if ( _distance <= _yDroppingRadius) 
	exitWith {true};  // has to return true to continue
};

_pilotC130J sideRadio "RadioAirbaseDropPackage";
  
{
	unassignvehicle _x;
	_x action ["EJECT", _planeC130J];
	uiSleep  0.5;
} foreach _supportTeamArray;

_groupSupportTeam setCombatMode "RED";
//set waypoint for the reinforcements
_supportTeamWP = _groupSupportTeam addWaypoint [_callerPosition, 0]; // Add way point to caller's position
_supportTeamWP setWaypointSpeed "FULL";
_supportTeamWP setWaypointType "MOVE"; 
_supportTeamWP setWaypointFormation "DIAMOND";
_supportTeamWP setWaypointBehaviour "AWARE";

_supportTeamWP = _groupSupportTeam addWaypoint [getMarkerPos scout1, 0]; // Add way point to caller's position
_supportTeamWP setWaypointType "MOVE";

_supportTeamWP = _groupSupportTeam addWaypoint [getMarkerPos scout2, 0]; // Add way point to caller's position
_supportTeamWP setWaypointType "MOVE";

_supportTeamWP = _groupSupportTeam addWaypoint [getMarkerPos scout3, 0]; // Add way point to caller's position
_supportTeamWP setWaypointType "MOVE";

_supportTeamWP = _groupSupportTeam addWaypoint [getMarkerPos scout4, 0]; // Add way point to caller's position
_supportTeamWP setWaypointType "MOVE";

_supportTeamWP = _groupSupportTeam addWaypoint [getMarkerPos scout5, 0]; // Add way point to caller's position
_supportTeamWP setWaypointType "MOVE";

_supportTeamWP = _groupSupportTeam addWaypoint [_callerPosition, 0]; // Add way point to caller's position
_supportTeamWP setWaypointType "CYCLE";
//10 second sleep before deleting plane and pilot
uiSleep 10; 
deleteVehicle _planeC130J;
deleteVehicle _pilotC130J;
