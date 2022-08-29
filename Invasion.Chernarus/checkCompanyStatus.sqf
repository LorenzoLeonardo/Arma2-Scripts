//_handle = [alpha] execVM "checkCompanyStatus.sqf";
_grppatrol = _this select 0;


	_Array = units _grppatrol;
	_totalUnits = count _Array;
	_radioUnit = _Array select 0;

	_text = toArray(str(_grppatrol));
	_text set[0,"**DELETE**"];
	_text set[1,"**DELETE**"];
	_text = _text - ["**DELETE**"];
	_grpName = toString(_text);


	while{count _Array > 5} do
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

	saveGame;
	_callerTexMarker = str format["%1 Requesting Assistance",_grpName];
	_callerMarker = createMarker[_callerTexMarker, position _radioUnit];
	_callerMarker setMarkerSize[1,1];
	_callerMarker setMarkerShape "ICON";
	_callerMarker setMarkerType "hd_destroy";
	_callerMarker setMarkerDir 45;
	_callerMarker setMarkerText _callerTexMarker;
			
	switch (_grpName) do
	{
		case "Alpha":
		{
			_callerMarker setMarkerColorLocal "ColorBlue";
			_radioUnit sideRadio "RadioAlphaWipedOut";
			[west, "Base"] sideRadio "RadioPapaBearReplyWipedOut";
			sleep 22;
			_handle=[_radioUnit, 500, 40, 3000, 0, 400, _callerTexMarker, "November 1"] execvm "dropSupportTeam.sqf";
		};

		case "Bravo":
		{
			_callerMarker setMarkerColorLocal "ColorRed";
			_radioUnit sideRadio "RadioBravoWipedOut";
			[west, "Base"] sideRadio "RadioPapaBearReplyWipedOut";
			sleep 22;

			_handle=[_radioUnit, 500, 40, 3000, 0, 400, _callerTexMarker, "November 2"] execvm "dropSupportTeam.sqf";
		};

		case "Charlie":
		{
			_callerMarker setMarkerColorLocal "ColorGreen";
			_radioUnit sideRadio "RadioCharlieWipedOut";
			[west, "Base"] sideRadio "RadioPapaBearReplyWipedOut";
			sleep 22;
			_handle=[_radioUnit, 500, 40, 3000, 0, 400, _callerTexMarker, "November 3"] execvm "dropSupportTeam.sqf";
		};

		case "Delta":
		{
			_callerMarker setMarkerColorLocal "ColorYellow";
			_radioUnit sideRadio "RadioDeltaWipedOut";
			[west, "Base"] sideRadio "RadioPapaBearReplyWipedOut";
			sleep 22;

			_handle=[_radioUnit, 500, 40, 3000, 0, 400, _callerTexMarker, "November 4"] execvm "dropSupportTeam.sqf";
		};

		case "Echo":
		{
			_callerMarker setMarkerColorLocal "ColorOrange";
			_radioUnit sideRadio "RadioDeltaWipedOut";
			[west, "Base"] sideRadio "RadioPapaBearReplyWipedOut";
			sleep 22;

			_handle=[_radioUnit, 500, 40, 3000, 0, 400, _callerTexMarker, "November 5"] execvm "dropSupportTeam.sqf";
		};
		default
		{
		};
	};
