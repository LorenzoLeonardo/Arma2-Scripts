_radioGrp = _this select 0;
_tankGroup = _this select 1;
_emptyTankArray = _this select 2;

_tankMenArray = units _tankGroup;
_radioGrpArray = units _radioGrp;
_text = toArray(str(_radioGrp));
_text set[0,"**DELETE**"];
_text set[1,"**DELETE**"];
_text = _text - ["**DELETE**"];
_grpName = toString(_text);

_nTanks = count _emptyTankArray;
{
	if ( !alive _x ) then
	{
		_radioGrpArray = _radioGrpArray - [_x];
	};
}foreach _radioGrpArray;

_radioUnit = _radioGrpArray select 0;
_tankLeader = (units _tankGroup) select 0;

_callerTexMarker = str format["Requesting Tank Support (%1)", _grpName];
_callerMarker = createMarkerLocal[_callerTexMarker, position _radioUnit];
_callerMarker setMarkerSizeLocal[1,1];
_callerMarker setMarkerShapeLocal "ICON";
_callerMarker setMarkerTypeLocal "Tank";
_callerMarker setMarkerDirLocal 0;
_callerMarker setMarkerTextLocal _callerTexMarker;
_callerMarker setMarkerColorLocal "ColorBlue";

_iMen = 0;
_iTank = 0;
while { _iTank < _nTanks} do
{
	(_tankMenArray select _iMen) moveInCommander (_emptyTankArray select _iTank);
	_iMen = _iMen + 1;
	_iTank = _iTank + 1;
};
_iTank = 0;
while { _iTank < _nTanks} do
{
	(_tankMenArray select _iMen) moveInDriver (_emptyTankArray select _iTank);
	_iMen = _iMen + 1;
	_iTank = _iTank + 1;
};
_iTank = 0;
while { _iTank < _nTanks} do
{
	(_tankMenArray select _iMen) moveInGunner (_emptyTankArray select _iTank);
	_iMen = _iMen + 1;
	_iTank = _iTank + 1;
};
//_iTank = 0;
//while { _iTank < _nTanks} do
//{
//	(_tankMenArray select _iMen) moveInTurret [(_emptyTankArray select _iTank),[0,1]];
//	_iMen = _iMen + 1;
//	_iTank = _iTank + 1;
//};

_radioUnit sideRadio "RadioAlphaRequestTankSupport";
sleep 12;
[west,"Base"] sideRadio "RadioPapaBearReplyTankSupport";
sleep 10;
_tankLeader sideRadio "RadioTankSupportReply";
sleep 9.5;
_radioUnit sideRadio "RadioAlphaReplyToTankPlatoon";
sleep 8;

deleteMarkerLocal _callerMarker;