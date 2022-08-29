_unit = _this select 0;
_varname = name _unit;

_colorFriendly = "";
_colorDead = "";
_shapeAlive = "mil_start";
_shapeDead = "Destroy";

_text = toArray(str(group _unit));
_text set[0,"**DELETE**"];
_text set[1,"**DELETE**"];
_text = _text - ["**DELETE**"];
_grpName = toString(_text);

switch (_grpName) do
{
	case "Alpha":
	{
		_colorFriendly = "ColorBlue";
		_colorDead = "ColorRed";
	};

	case "Bravo":
	{
		_colorFriendly = "ColorGreen";
		_colorDead = "ColorRed";
	};

	default
	{
	};
};

createMarkerLocal [_varname, [0,0]];
_varname setMarkerShapeLocal "ICON";
_varname setMarkerSizeLocal [0.5,0.5];
_varname setMarkerColorLocal _colorFriendly;
_varname setMarkerTypeLocal _shapeAlive;
 
sleep 2;
while {alive _unit} do 
{
   _varname setMarkerDirLocal getDir _unit;
   _varname setMarkerPosLocal getPos _unit;
   sleep 0.1;
};
sleep 2;
_varname setMarkerSizeLocal [0.7,0.7];
_varname setMarkerColorLocal _colorDead;
_varname setMarkerTypeLocal _shapeDead;
_varname setMarkerDirLocal 45;
