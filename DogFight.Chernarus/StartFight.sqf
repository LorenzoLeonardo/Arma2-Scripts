startLocation = getMarkerPos (_this select 0);
hint "Initialize";
_wayPoint1 = getMarkerPos (_this select 1);
_wayPoint2 = getMarkerPos (_this select 2);
_wayPoint3 = getMarkerPos (_this select 3);
_wayPoint4 = getMarkerPos (_this select 4);
_wayPoint5 = getMarkerPos (_this select 5);
_wayPoint6 = getMarkerPos (_this select 6);
_wayPoint7 = getMarkerPos (_this select 7);
_wayPoint8 = getMarkerPos (_this select 8);
_wayPoint9 = getMarkerPos (_this select 9);

hint "Initialize";
player setPos startLocation;

groupSupportTeam = createGroup west; 
groupSupportTeam setGroupID["Alpha"];
"USMC_Soldier" createUnit [startLocation, groupSupportTeam, "", 1, "LIEUTENANT"];
"USMC_Soldier" createUnit [startLocation, groupSupportTeam, "", 1, "LIEUTENANT"];
"USMC_Soldier" createUnit [startLocation, groupSupportTeam, "", 1, "LIEUTENANT"];
"USMC_Soldier" createUnit [startLocation, groupSupportTeam, "", 1, "LIEUTENANT"];
"USMC_Soldier" createUnit [startLocation, groupSupportTeam, "", 1, "LIEUTENANT"];
"USMC_Soldier" createUnit [startLocation, groupSupportTeam, "", 1, "LIEUTENANT"];
"USMC_Soldier" createUnit [startLocation, groupSupportTeam, "", 1, "LIEUTENANT"];

_teamArray = units groupSupportTeam;

{
	_scriptMon = [_x] execVM "monitorUnit.sqf";
}foreach _teamArray;

[player] join groupSupportTeam;

_groupWPPos = groupSupportTeam addWaypoint [_wayPoint1, 0]; // Add way point to caller's position
_groupWPPos setWaypointSpeed "FULL";
_groupWPPos setWaypointType "MOVE"; 
_groupWPPos setWaypointFormation "LINE";
_groupWPPos setWaypointBehaviour "AWARE";

_groupWPPos = groupSupportTeam addWaypoint [_wayPoint2, 0];
_groupWPPos = groupSupportTeam addWaypoint [_wayPoint3, 0];
_groupWPPos = groupSupportTeam addWaypoint [_wayPoint4, 0];
_groupWPPos = groupSupportTeam addWaypoint [_wayPoint5, 0];
_groupWPPos = groupSupportTeam addWaypoint [_wayPoint6, 0];
_groupWPPos = groupSupportTeam addWaypoint [_wayPoint7, 0];
_groupWPPos = groupSupportTeam addWaypoint [_wayPoint8, 0];
_groupWPPos = groupSupportTeam addWaypoint [_wayPoint9, 0];
_groupWPPos setWaypointType "CYCLE"; 
