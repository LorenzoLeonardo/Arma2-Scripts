//_handle = [this, "ALPHA SQUAD", Marker Name to attack] execVM "checkTeamDead.sqf"; _grppatrol = _this select 0;
_grppatrol = _this select 0;
_grpName = _this select 1;

_Array = units _grppatrol;
_totalUnits = count _Array;
_radioUnit = _Array select 0;


while{count _Array > (_totalUnits/2)} do
{
  {
     if(!alive _x)then
     {
    	_Array = _Array - [_x];
		_radioUnit = _Array select 0;
     }
   }foreach _Array;
   uiSleep 1;
};

saveGame;
_callerTexMarker = str format["%1 : Requesting Assistance",_radioUnit];
_callerMarker = createMarker[_callerTexMarker, position _radioUnit];
_callerMarker setMarkerSize[1,1];
_callerMarker setMarkerShape "ICON";
_callerMarker setMarkerType "hd_destroy";
_callerMarker setMarkerDir 45;
_callerMarker setMarkerText _callerTexMarker;
		
switch (_grpName) do
{
	case "ALPHA":
	{
		_callerMarker setMarkerColorLocal "ColorBlue";
		_radioUnit sideRadio "RadioAlphaWipedOut";
		[west, "Base"] sideRadio "RadioPapaBearReplyWipedOut";
		uiSleep 22;
		_handle=[_radioUnit,"ALPHA SUPPORT", 300, 40, 1500, 300, _callerTexMarker] execvm "dropSupportTeam.sqf";
	};

	case "BRAVO":
	{
		_callerMarker setMarkerColorLocal "ColorRed";
		_radioUnit sideRadio "RadioBravoWipedOut";
		[west, "Base"] sideRadio "RadioPapaBearReplyWipedOut";
		uiSleep 22;

		_handle=[_radioUnit,"BRAVO SUPPORT", 300, 40, 1500, 400, _callerTexMarker] execvm "dropSupportTeam.sqf";
	};

	case "CHARLIE":
	{
		_callerMarker setMarkerColorLocal "ColorOrange";
		_radioUnit sideRadio "RadioCharlieWipedOut";
		[west, "Base"] sideRadio "RadioPapaBearReplyWipedOut";
		uiSleep 22;
		_handle=[_radioUnit,"CHARLIE SUPPORT", 300, 40, 1500, 400, _callerTexMarker] execvm "dropSupportTeam.sqf";
	};

	case "DELTA":
	{
		_callerMarker setMarkerColorLocal "ColorYellow";
		_radioUnit sideRadio "RadioDeltaWipedOut";
		[west, "Base"] sideRadio "RadioPapaBearReplyWipedOut";
		uiSleep 22;

		_handle=[_radioUnit,"DELTA SUPPORT", 300, 40, 1500, 400, _callerTexMarker] execvm "dropSupportTeam.sqf";
	};

	default
	{
	};
};