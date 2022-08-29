_unit = _this select 0;
_varname = name _unit;

_colorFriendly = "ColorBlue";
_colorDead = "ColorRed";
_shapeAlive = "Start";
_shapeDead = "End";

createMarkerLocal [_varname, [0,0]];
_varname setMarkerShape "ICON";
_varname setMarkerSize [0.5,0.5];


while {alive _unit} do {
   _varname setMarkerColor _colorFriendly;
   _varname setMarkerType _shapeAlive;

   _varname setMarkerDir getDir _unit;
   _varname setMarkerPos getPos _unit;

   sleep 1;
};

_varname setMarkerColor _colorDead;
_varname setMarkerType _shapeDead;

sleep 3;
deleteVehicle _unit;
deleteMarkerLocal _varname;

"USMC_Soldier" createUnit [startLocation, groupSupportTeam, "_scriptMon = [this] execVM 'monitorUnit.sqf';", 1, "PRIVATE"];

