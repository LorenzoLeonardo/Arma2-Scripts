_group = _this select 0;

_Array = units _group;
_totalUnits = count _Array;
_radioUnit = _Array select 0;

_text = toArray(str(_group));
_text set[0,"**DELETE**"];
_text set[1,"**DELETE**"];
_text = _text - ["**DELETE**"];
_grpName = toString(_text);
_bThereIsAmmo = false;

while { !_bThereIsAmmo } do
{
	{
		if(!alive _x) then
		{
			_Array = _Array - [_x];
		};
	} foreach _Array;
	
	{
		if( (count (magazines _x)) <= 2) then
		{
			_bThereIsAmmo = true;
		};
	} foreach _Array;
	sleep 1;
};

_callerTexMarker = str format["Ammo Supply Drop (%1)",_grpName];
_callerMarker = createMarkerLocal [_callerTexMarker, position _radioUnit];
_callerMarker setMarkerSizeLocal [1,1];
_callerMarker setMarkerShapeLocal "ICON";
_callerMarker setMarkerTypeLocal "selector_selectedMission";
_callerMarker setMarkerDirLocal 0;
_callerMarker setMarkerTextLocal _callerTexMarker;

switch (_grpName) do
{
	case "Alpha":
	{
		_callerMarker setMarkerColorLocal "ColorBlue";
	};
	case "Bravo":
	{
		_callerMarker setMarkerColorLocal "ColorRed";
	};

	case "Charlie":
	{
		_callerMarker setMarkerColorLocal "ColorYellow";
	};

	case "Delta":
	{
		_callerMarker setMarkerColorLocal "ColorOrange";
	};

	default
	{
		_callerMarker setMarkerColorLocal "ColorBlack";
	};
};
_radioUnit sideRadio "RadioAmmoSupplyRequestAlpha";
sleep 9.5;
[west,"Base"] sideRadio "RadioPapaBearAmmoSupplyRequestReply";
sleep 8;
	
if( count _Array > 0) then
{
	{
		if(!alive _x)then
		{
			_Array = _Array - [_x];
			_radioUnit = _Array select 0;
		}
	}foreach _Array;
	_scriptHandle = [_radioUnit,200,50,2000,150,_callerTexMarker] execvm "dropAmmoSupplies.sqf";
};

