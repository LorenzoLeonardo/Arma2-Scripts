//_handle = [this] execVM "checkCompanyStatus.sqf"; _grppatrol = _this select 0;
_group = _this select 0;

_Array = units _group;
_totalUnits = count _Array;
_radioUnit = _Array select 0;

_text = toArray(str(_group));
_text set[0,"**DELETE**"];
_text set[1,"**DELETE**"];
_text = _text - ["**DELETE**"];
_grpName = toString(_text);

while{ (count _Array > (_totalUnits/3)) && (alive player) } do
{
  {
     if(!alive _x)then
     {
    	_Array = _Array - [_x];
		_radioUnit = _Array select 0;
     }
   }foreach _Array;
   sleep 1;
};

if( alive player ) then
{
	_callerTexMarker = str format["Requesting Paradrop Support (%1)",_grpName];
	_callerMarker = createMarkerLocal[_callerTexMarker, position _radioUnit];
	_callerMarker setMarkerSizeLocal[1,1];
	_callerMarker setMarkerShapeLocal "ICON";
	_callerMarker setMarkerTypeLocal "AirTeam";
	_callerMarker setMarkerDirLocal 0;
	_callerMarker setMarkerTextLocal _callerTexMarker;
			
	switch (_grpName) do
	{
		case "Alpha":
		{
			_callerMarker setMarkerColorLocal "ColorBlue";
			_radioUnit sideRadio "RadioAlphaWipedOut";
			sleep 10;
			[west, "Base"] sideRadio "RadioPapaBearReplyWipedOut";
			sleep 10;
		};

		case "Bravo":
		{
			_callerMarker setMarkerColorLocal "ColorRed";
			_radioUnit sideRadio "RadioBravoWipedOut";
			sleep 10;
			[west, "Base"] sideRadio "RadioPapaBearReplyWipedOut";
			sleep 10;
		};

		case "Charlie":
		{
			_callerMarker setMarkerColorLocal "ColorYellow";
			_radioUnit sideRadio "RadioCharlieWipedOut";
			sleep 10;
			[west, "Base"] sideRadio "RadioPapaBearReplyWipedOut";
			sleep 10;
		};

		case "Delta":
		{
			_callerMarker setMarkerColorLocal "ColorOrange";
			_radioUnit sideRadio "RadioDeltaWipedOut";
			sleep 10;
			[west, "Base"] sideRadio "RadioPapaBearReplyWipedOut";
			sleep 10;
		};

		default
		{
		};
	};
	if( count _Array > 0) then
	{
		{
			if(!alive _x)then
			{
				_Array = _Array - [_x];
				_radioUnit = _Array select 0;
			}
		}foreach _Array;
		_handle=[_radioUnit, 500, 40, 3000, 500, _callerTexMarker] execvm "dropSupportTeam.sqf";
	};
};