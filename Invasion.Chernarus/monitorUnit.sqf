_unit = _this select 0;
_varname = name _unit;

_colorFriendly = "";
_colorDead = "";

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
		_colorDead = "ColorBlue";
	};

	case "Bravo":
	{
		_colorFriendly = "ColorRed";
		_colorDead = "ColorRed";
	};
	
	case "Charlie":
	{
		_colorFriendly = "ColorGreen";
		_colorDead = "ColorGreen";
	};

	case "Delta":
	{
		_colorFriendly = "ColorYellow";
		_colorDead = "ColorYellow";
	};
	
	case "Echo":
	{
		_colorFriendly = "ColorOrange";
		_colorDead = "ColorOrange";
	};
	default
	{
	};
};

_shapeAlive = "mil_start";
_shapeDead = "Flag";

createMarkerLocal [_varname, [0,0]];
_varname setMarkerShapeLocal "ICON";
_varname setMarkerSizeLocal [0.5,0.5];
_varname setMarkerColorLocal _colorFriendly;
_varname setMarkerTypeLocal _shapeAlive;
   
while {alive _unit} do 
{
   _varname setMarkerDirLocal getDir _unit;
   _varname setMarkerPosLocal getPos _unit;
   sleep 0.1;
};

deleteMarkerLocal _varname;
//_varname setMarkerColorLocal _colorDead;
//_varname setMarkerTypeLocal _shapeDead;
//_varname setMarkerDirLocal 0;
