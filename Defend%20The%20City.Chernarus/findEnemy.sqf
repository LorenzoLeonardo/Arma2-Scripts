_allEastUnits = [];

{
	if( (side _x == east) && (alive  _x) ) then 
	{
		_allEastUnits set [count _allEastUnits, _x];
	};
} forEach allUnits;

_countEast = count _allEastUnits;
if(_countEast < 10) then{

	{
		_callerTexMarker = str format["Enemy Location : %1",_x];
		_callerMarker = createMarker[_callerTexMarker, position _x];
		_callerMarker setMarkerSize[1,1];
		_callerMarker setMarkerShape "ICON";
		_callerMarker setMarkerType "hd_destroy";
		_callerMarker setMarkerDir 45;
		_callerMarker setMarkerText _callerTexMarker;
		_callerMarker setMarkerColorLocal "ColorBlack";
		_bomb = "ARTY_Sh_81_HE" createVehicle (position _x);
		sleep 5;
		deleteMarkerLocal _callerMarker;
	} forEach _allEastUnits;
}
else
{
	hint "Not Yet Available";
};