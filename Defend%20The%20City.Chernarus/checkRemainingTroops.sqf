_countEast =  ({(side _x) == east && alive _x} count allUnits);
_countWest =  ({(side _x) == west && alive _x} count allUnits);

_Array =  allUnits;
_totalCount = count _Array;

[west, "Base"] sideRadio "RadioPapaBearIntro";
sleep 14;

while{_countEast > 0}do
{
	{
		if(!alive _x)then
		{
			_Array = _Array - [_x];
			_countEast =  ({(side _x) == east} count allUnits);
			_countWest =  ({(side _x) == west} count allUnits);
			_totalCount = count _Array;
		}
	}foreach _Array;
   sleep 1;
};
player sideRadio "RadioGroundToPapaBearVictory";
sleep 9;
[west, "Base"] sideRadio "RadioPapaBearVictory";
sleep 30;

endMission "END1";

	