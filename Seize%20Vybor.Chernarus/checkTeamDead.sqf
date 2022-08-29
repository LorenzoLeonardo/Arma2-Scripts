//_handle = [this, "ALPHA SQUAD", Marker Name to attack] execVM "checkTeamDead.sqf"; _grppatrol = _this select 0;
_grppatrol = _this select 0;
_grpName = _this select 1;
_Array = units _grppatrol;
_radioUnit = _Array select 0;
_seizeMarkerName = _this select 2;

while{count _Array > 1} do
{
  {
     if(!alive _x)then
     {
    	_Array = _Array - [_x];
		_radioUnit = _Array select 0;
		//_radioUnit sideChat format ["%1 is history!",  name _x]; 
     }
   }foreach _Array;
   uiSleep 0.5;
};

saveGame;

if(count _Array == 0) then
{
	hint format ["Mission Status : %1 WAS WIPED OUT!", _grpName];
	[West, "HQ"] sideChat format["Come in %1, come in %1, come in %1. Damn! We lost %1.", _grpName];
	uiSleep 10;
}
else
{
	_radioUnit sideChat format ["Papa Bear please come in, this is %1. We are under heavy fire. %1 has been wiped out. I repeat %1 has been wiped out. I am the only one left. Out!", _grpName];

	switch (_grpName) do
	{
		case "ALPHA SQUAD":
		{
			playSound "AlphaWipedOut";
			uiSleep 13;
		};

		case "BRAVO SQUAD":
		{
			playSound "BravoWipedOut";
			uiSleep 16;
		};

		case "CHARLIE SQUAD":
		{
			playSound "CharlieWipedOut";
			uiSleep 14;
		};

		case "DELTA SQUAD":
		{
			playSound "DeltaWipedOut";
			uiSleep 13;
		};

		case "ECHO SQUAD":
		{
			playSound "EchoWipedOut";
			uiSleep 15;
		};

		case "FOXTROT SQUAD":
		{
			playSound "FoxtrotWipedOut";
			uiSleep 14;
		};

		default
		{
		};
	};

	[West, "HQ"] sideChat "Damn! This is papa bear to all units. Please stick together. We need to get hold of the city to liberate it from the oppressors. Papa bear out!";
	playSound "HQReply";
	uiSleep 13;
	_scriptHandle = [_radioUnit,_grppatrol,_grpName,300,35,1500,450,_seizeMarkerName] execvm "dropSupportTeam.sqf";
};
