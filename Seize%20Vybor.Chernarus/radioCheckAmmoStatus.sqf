_Array =  allUnits;

{
	if( (side _x) == east && alive _x)then
	{
		_Array = _Array - [_x];
	};
} foreach _Array;


_countTotal = 0;
{
	_count = count magazines _x;
	_countTotal = _countTotal + _count;
} foreach _Array;


hint format["Ammo Status :\nCurrent Total Ammo : %1", _countTotal];