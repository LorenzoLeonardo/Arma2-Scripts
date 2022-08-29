_group = _this select 0;
_grpName = _this select 1;

_Array = units _group;
_countTotal = 0;
_currentTotalCount = 0;


{
	_count = count magazines _x;
	_countTotal = _countTotal + _count;
} foreach _Array;

_currentTotalCount = _countTotal;
while {_currentTotalCount > (_countTotal * 0.5)} do
{
	_currentTotalCount = 0;
	{
		if(!alive _x)then
		{
			_count = count magazines _x;
			_countTotal = _countTotal - _count;
			_Array = _Array - [_x];
		};
	} foreach _Array;
	
	{
		_count = count magazines _x;
		_currentTotalCount = _currentTotalCount + _count;
	} foreach _Array;
	sleep 0.1;
};

if(count _Array > 0)then
{
	_scriptHandle = [player,"ALPHA SQUAD",300,100,1500,100,"USBasicAmmunitionBox"] execvm "dropAmmoSupplies.sqf";
};
