_myBattery = _this select 0;
_targetUnit = _this select 1;

_heTemplate = ["IMMEDIATE", "HE", 0, 15];
_targetPos = getPosASL _targetUnit;
[_myBattery, _targetPos, _heTemplate] call BIS_ARTY_F_ExecuteTemplateMission;