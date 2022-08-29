//_handle = [this] execVM "checkCompanyStatus.sqf"; _grppatrol = _this select 0;
_group = _this select 0;
_mergeToGroup = _this select 1;

_Array = units _group;
_totalUnits = count _Array;
_radioUnit = _Array select 0;

_text = toArray(str(_group));
_text set[0,"**DELETE**"];
_text set[1,"**DELETE**"];
_text = _text - ["**DELETE**"];
_grpName = toString(_text);

while{count _Array > 4} do
{
  {
     if(!alive _x)then
     {
    	_Array = _Array - [_x];
		_radioUnit = _Array select 0;
     }
   } foreach _Array;
   sleep 1;
};

_callerTexMarker = str format["%1 WIPED OUT!",_grpName];
_callerMarker = createMarkerLocal[_callerTexMarker, position _radioUnit];
_callerMarker setMarkerSizeLocal[1,1];
_callerMarker setMarkerShapeLocal "ICON";
_callerMarker setMarkerTypeLocal "Destroy";
_callerMarker setMarkerDirLocal 45;
_callerMarker setMarkerTextLocal _callerTexMarker;


switch (_grpName) do
{
	case "Alpha":
	{
		_radioUnit sideRadio "RadioAlphaWipedOut";
		sleep 8.5;
		[west,"base"] sideRadio "RadioPapaBearAlphaWipedOutReply";  
		sleep 14;
		_callerMarker setMarkerColorLocal "ColorBlue";
	};

	case "Bravo":
	{
		_radioUnit sideRadio "RadioBravoWipedOut";
		sleep 8.5;
		[west,"base"] sideRadio "RadioPapaBearBravoWipedOutReply";  
		sleep 14;
		_callerMarker setMarkerColorLocal "ColorGreen";
	};

	default
	{
	};
};

_Array joinSilent _mergeToGroup;		
