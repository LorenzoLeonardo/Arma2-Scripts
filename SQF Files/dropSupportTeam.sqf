//nul=[player,100,50] execvm "dropSupportTeam.sqf";
//parameters
_caller = _this select 0;
_planeAltitude = _this select 1;
_planeSpeed = _this select 2;

_callerDirection = direction _caller;
 //direction of the caler
_callerPosition = getPos _caller; // position of the caller

//create a group of the plane
_planeC130J = createVehicle ["C130J", [ _callerPosition select 0, _callerPosition select 1,100], [], 0, "FLY"];
//create a plane
_pilotC130J = _groupC130J createUnit ["USMC_Soldier_Pilot", [0,0,1], [], 0, "CARGO"];
//create a pilot
_pilotC130J moveInDriver _planeC130J; //move pilot as driver of the C130

_planeDefaultVelocity = velocity _planeC130J;
_planeDefaultDirection = direction _planeC130J;
//Set velocity and direction of the plane
_planeC130J setVelocity [(_planeDefaultVelocity select 0) + (sin _planeDefaultDirection * _planeSpeed),(_planeDefaultVelocity select  1) + (cos _planeDefaultDirection * _planeSpeed),0];
_planeC130J setdir _planeDefaultDirection;

wp1 = _groupC130J addWaypoint [_callerPosition, 0]; // Add way point to caller's position
wp1 setWaypointSpeed "NORMAL";
wp1 setWaypointType "MOVE"; 

_groupSupportTeam = createGroup [west,true]; //create a support team
"USMC_Soldier_Medic" createUnit [[0,0,1], _groupSupportTeam, "", 1, "PRIVATE"];
"USMC_Soldier_Medic" createUnit [[0,0,1], _groupSupportTeam, "", 1, "PRIVATE"];
"USMC_Soldier_Medic" createUnit [[0,0,1], _groupSupportTeam, "", 1, "PRIVATE"];
"USMC_Soldier_Medic" createUnit [[0,0,1], _groupSupportTeam, "", 1, "PRIVATE"];
"USMC_Soldier_Medic" createUnit [[0,0,1], _groupSupportTeam, "", 1, "CORPORAL"];
"USMC_Soldier_Medic" createUnit [[0,0,1], _groupSupportTeam, "", 1, "CORPORAL"];
"USMC_Soldier_Medic" createUnit [[0,0,1], _groupSupportTeam, "", 1, "CORPORAL"];
"USMC_Soldier_Medic" createUnit [[0,0,1], _groupSupportTeam, "", 1, "CORPORAL"];
"USMC_SoldierS_SniperH" createUnit [[0,0,1], _groupSupportTeam, "", 1, "SERGEANT"];
"USMC_SoldierM_Marksman" createUnit [[0,0,1], _groupSupportTeam, "", 1, "SERGEANT"];
"USMC_Soldier_AR" createUnit [[0,0,1], _groupSupportTeam, "", 1, "SERGEANT"];
"USMC_Soldier_MG" createUnit [[0,0,1], _groupSupportTeam, "", 1, "SERGEANT"];
"USMC_Soldier_GL" createUnit [[0,0,1], _groupSupportTeam, "", 1, "SERGEANT"];
"USMC_Soldier_SL" createUnit [[0,0,1], _groupSupportTeam, "", 1, "LIEUTENANT"];

{ _x moveInCargo _planeC130J } foreach unit _groupSupportTeam;

sleep 5; //10 second sleep

_Array = units _groupSupportTeam;
unassignvehicle _x;
for "_i" from 0 to total do
{
_x = _Array select (total - _i);
_x action ["EJECT", _plane1];
sleep 0.6;
};

sleep 10; //10 second sleep

deleteVehicle _planeC130J;
deleteVehicle _pilotC130J;