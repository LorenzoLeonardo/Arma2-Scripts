//parameters
_group = _this select 0;
_plane1 = _this select 1;
_squadName = _this select 2;
_vehicleToDrop = _this select 3;
_Array = units _group;
total = count _Array;

_plane1 setVelocity [(vectorDir _plane1 select 0)*40,(vectorDir _plane1 select 1)*40,(vectorDir _plane1 select 2)*40];

_Array select 0 sideChat format ["%1 is jumping now!", _squadName, total]; 

//Open Ramp
_plane1  animate ["ramp_top",1];
_plane1  animate ["ramp_bottom",1];
uiSleep 0.1;
_plane1 setVariable ["NORRN_openRamp", true, true];

uiSleep 1.5;

_groupTankTeam = createGroup west;
_tankDriver = _groupTankTeam createUnit ["USMC_Soldier_Crew", [0,0,1], [], 1, "CARGO"];
_tankGunner = _groupTankTeam createUnit ["USMC_Soldier_Crew", [0,0,1], [], 1, "CARGO"];
_tankCommander = _groupTankTeam createUnit ["USMC_Soldier_Crew", [0,0,1], [], 1, "CARGO"];

_tankDriver setRank "CORPORAL";
_tankGunner setRank "CORPORAL";
_tankCommander setRank "SERGEANT";

_tank = createVehicle [_vehicleToDrop, [0,0,0], [], 0, "NONE"];
_tankDriver moveInDriver _tank; 
_tankCommander moveInCommander _tank;
_tankGunner moveInGunner _tank;

_paraShute = createVehicle ["ParachuteMediumWest", [getPos _plane1 select 0,getPos _plane1 select 1,(getPos _plane1 select 2)], [], 0, "NONE"];
_tank attachTo [_paraShute, [0,0,0]];
_paraShute attachTo [_plane1, [-10,-10,-10]];
detach _paraShute;
units _groupTankTeam joinSilent (_group);
uiSleep 0.5;
//Eject troops starting from the last person
unassignvehicle _x;
for "_i" from 0 to total do
{
	_x = _Array select (total - _i);
	_x action ["EJECT", _plane1];
	uiSleep 0.5;
};

//Close Ramp
_plane1 animate ["ramp_top",0];
_plane1 animate ["ramp_bottom",0];
uiSleep 0.1;
_plane1 setVariable ["NORRN_openRamp", false, true];
uiSleep 15;

deleteVehicle _plane1;
