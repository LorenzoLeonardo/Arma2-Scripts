_grppatrol = _this select 0;
_Array = units _grppatrol;
_grppatrol sideChat format ["Mission Status : %1 was wiped out!", count allUnits];

_radioUnit = _Array select 0;
while{count _Array > 1}do
{
  {
     if(!alive _x)then
     {
        _Array = _Array - [_x];
	
	_radioUnit = _Array select 0;
	_radioUnit sideChat format ["%1 is history.", name _x]; 
     }
   }foreach _Array;
   sleep 1;
};

_radioUnit sideChat format ["HQ please come in, this is %1. We are under heavy fire. %1 has been wiped out. I repeat %1 has been wiped out. I am the only one left. Out!", _this select 1,_this select 1];
hint format ["Mission Status : %1 was wiped out!", _this select 1];

switch (_grppatrol) do
{
    case group_1:
    {
	playSound "AlphaWipedOut";
	sleep 13;
    };

    case group_2:
    {
	playSound "BravoWipedOut";
	sleep 16;
    };

    case group_3:
    {
	playSound "CharlieWipedOut";
	sleep 14;
    };

    case group_4:
    {
	playSound "DeltaWipedOut";
	sleep 13;
    };

    case group_5:
    {
	playSound "EchoWipedOut";
	sleep 15;
    };

    case tank_platoon:
    {
	playSound "FoxtrotTanksWipedOut";
	sleep 14;
    };

    default
    {
	
    };
};


[West, "HQ"] sideChat "Damn! This is papa bear to all units. Please stick together. We need to get hold of the city to liberate it from the oppressors. Papa bear out!";
playSound "HQReply";