_countEast =  ({(side _x) == east && alive _x} count allUnits);
_countWest =  ({(side _x) == west && alive _x} count allUnits);

_Array =  allUnits;
_totalCount = count _Array;

hint format["Checking Remaining Troops (%1)\n\nWest : %2\nEast : %3", _totalCount, _countWest, _countEast];

//while{_countEast > 0}do
//{
  //{
    // if(!alive _x)then
     //{
       // _Array = _Array - [_x];
	//	_countEast =  ({(side _x) == east} count allUnits);
	//	_countWest =  ({(side _x) == west} count allUnits);
	//	_totalCount = count _Array;
	//	hint format["Checking Remaining Troops (%1)\n\nWest : %2\nEast : %3", _totalCount, _countWest, _countEast];
     //}
   //}foreach _Array;
   //sleep 1;
//};

	