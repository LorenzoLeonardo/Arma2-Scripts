_unit = _this select 0;
_varname = name _unit;

_colorFriendly = "ColorGreen";
_colorDead = "ColorBlack";
_shapeAlive = "Arrow";
_shapeDead = "Marker";

createMarkerLocal [_varname, [0,0]];
_varname setMarkerShape "ICON";
_varname setMarkerSize [0.5,0.5];


while {alive _unit} do {
   _varname setMarkerColor _colorFriendly;
   _varname setMarkerType _shapeAlive;

   _varname setMarkerDir getDir _unit;
   _varname setMarkerPos getPos _unit;

   sleep 0.5;
};
_varname setMarkerColor _colorDead;
_varname setMarkerType _shapeDead;
