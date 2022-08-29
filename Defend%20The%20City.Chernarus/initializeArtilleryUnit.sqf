_artilleryUnit = _this select 0;
_artilleryType = _this select 1;
_enemyUnit = player;
_maxRange = 0;
_minRange = 0;
_distance = 0;
_vDistance = 0;
_hDistance = 0;
_ammoClass = "Sh_105_HE";
_allEastUnits = [];
_countAmmo = (_artilleryUnit ammo _artilleryType);
switch (_artilleryType) do
{
	case "M119":
	{
		_maxRange = 2000;
		_minRange = 500;
		_ammoClass = "ARTY_Sh_105_HE";
		hint "Initialize Artillery Units";
	};
	case "M252":
	{
		_maxRange = 1000;
		_minRange = 250;
		_ammoClass = "ARTY_Sh_81_HE";
		hint "Initialize Mortar Units";
	};
	case "MLRS":
	{
		_maxRange = 15550;
		_minRange = 4900;
		_ammoClass = "ARTY_R_227mm_HE_Rocket";
	};
	default
	{
		hint format["Unknown Weapon : %1", _artilleryUnit];
	};
};

{
	if( (side _x == east) && (alive  _x) ) then 
	{
		_enemyUnit = _x;
		_allEastUnits set [count _allEastUnits, _enemyUnit];
	};
} forEach allUnits;

while{(alive _artilleryUnit) && ((count _allEastUnits) > 0) && (_countAmmo > 0)} do 
{
	{
		if(!alive _x)then 
		{
			_allEastUnits = _allEastUnits - [_x];
		};
	} forEach _allEastUnits;
	uiSleep 1;
	_enemyUnit = _allEastUnits select floor(random(count _allEastUnits));
	if(alive _enemyUnit) then
	{
		_distance = abs(_artilleryUnit distance _enemyUnit);
		_targetPos = getPosASL _enemyUnit;
		_vDistance = abs((getPosASL _enemyUnit) select 2);
		_hDistance = sqrt ((_distance * _distance) - (_vDistance * _vDistance));
		if ((_hDistance <= _maxRange) && (_hDistance >= _minRange)) then
		{
			_artilleryUnit doWatch [_targetPos select 0, _targetPos select 1,  _maxRange];
			uiSleep 2;
			_artilleryUnit fire _artilleryType;
			_Xrnd = (_targetPos select 0) + (round(random 80) - 40);
			_Yrnd = (_targetPos select 1) + (round(random 80) - 40);
			_bomb = _ammoClass createVehicle [_Xrnd, _Yrnd, _targetPos select 2];
			_countAmmo = (_artilleryUnit ammo _artilleryType);
		};
	};
};
if((alive _artilleryUnit) && (_countAmmo == 0)) then
{
	switch (_artilleryType) do
	{
		case "M119":
		{
			_artilleryUnit sideRadio "RadioArtilleryOutOfAmmo";

		};
		case "M252":
		{
			_artilleryUnit sideRadio "RadioMortarOutOfAmmo";
		};
	};
	_artVehicle = (vehicle _artilleryUnit);
	_artilleryUnit action ["getOut", _artVehicle];
	deleteVehicle _artVehicle;
};