grpAlpha = _this select 0;
grpBravo = _this select 1;
grpCharlie = _this select 2;
grpDelta = _this select 3;
grpEcho = _this select 4;
grpFoxtrot = _this select 5;
grpGolf = _this select 6;
grpHotel = _this select 7;
grpIndia = _this select 8;
grpJuliet = _this select 9;


killsNumAlpha = 0;
killsNumBravo = 0;
killsNumCharlie = 0;
killsNumDelta = 0;
killsNumEcho = 0;
killsNumFoxtrot = 0;
killsNumGolf = 0;
killsNumHotel = 0;
killsNumIndia = 0;
killsNumJuliet = 0;

friendlyKillsNumAlpha = 0;
friendlyKillsNumBravo = 0;
friendlyKillsNumCharlie = 0;
friendlyKillsNumDelta = 0;
friendlyKillsNumEcho = 0;
friendlyKillsNumFoxtrot = 0;
friendlyKillsNumGolf = 0;
friendlyKillsNumHotel = 0;
friendlyKillsNumIndia = 0;
friendlyKillsNumJuliet = 0;

killedEH = {
   _killed = _this select 0;
   _killer = _this select 1;

	_text = toArray(str(group _killer));
	_text set[0,"**DELETE**"];
	_text set[1,"**DELETE**"];
	_text = _text - ["**DELETE**"];
	_grpNameKiller = toString(_text);

	_text = toArray(str(group _killed));
	_text set[0,"**DELETE**"];
	_text set[1,"**DELETE**"];
	_text = _text - ["**DELETE**"];
	_grpNameKilled = toString(_text);
	
	_grpAlphaArray = units grpAlpha;
	_grpBravoArray = units grpBravo;
	_grpCharlieArray = units grpCharlie;
	_grpDeltaArray = units grpDelta;
	_grpEchoArray = units grpEcho;
	_grpFoxtrotArray = units grpFoxtrot;
	_grpGolfArray = units grpGolf;
	_grpHotelArray = units grpHotel;
	_grpIndiaArray = units grpIndia;
	_grpJulietArray = units grpJuliet;
	
	_countAlpha = count _grpAlphaArray;
	_countBravo = count _grpBravoArray;
	_countCharlie = count _grpCharlieArray;
	_countDelta = count _grpDeltaArray;
	_countEcho = count _grpEchoArray;
	_countFoxtrot = count _grpFoxtrotArray;
	_countGolf = count _grpGolfArray;
	_countHotel = count _grpHotelArray;
	_countIndia = count _grpIndiaArray;
	_countJuliet = count _grpJulietArray;
	
	switch (_grpNameKiller) do
	{
		case "Alpha":
		{
			if( _killer != _killed) then
			{
				if ( side (group _killer) != side (group _killed) ) then
				{
					killsNumAlpha = killsNumAlpha + 1;
				}
				else
				{
					friendlyKillsNumAlpha = friendlyKillsNumAlpha + 1;			
				};
			};
		};

		case "Bravo":
		{
			if( _killer != _killed) then
			{
				if ( side (group _killer) != side (group _killed) ) then
				{
					killsNumBravo = killsNumBravo + 1;
				}
				else
				{
					friendlyKillsNumBravo = friendlyKillsNumBravo + 1;	
				};
			};
		};

		case "Charlie":
		{
			if( _killer != _killed) then
			{
				if ( side (group _killer) != side (group _killed) ) then
				{
					killsNumCharlie = killsNumCharlie + 1;
				}
				else
				{
					friendlyKillsNumCharlie = friendlyKillsNumCharlie + 1;			
				};
			};
		};
		case "Delta":
		{
			if( _killer != _killed) then
			{
				if ( side (group _killer) != side (group _killed) ) then
				{
					killsNumDelta = killsNumDelta + 1;
				}
				else
				{
					friendlyKillsNumDelta = friendlyKillsNumDelta + 1;			
				};
			};
		};
		case "Echo":
		{
			if( _killer != _killed) then
			{
				if ( side (group _killer) != side (group _killed) ) then
				{
					killsNumEcho = killsNumEcho + 1;
				}
				else
				{
					friendlyKillsNumEcho = friendlyKillsNumEcho + 1;			
				};
			};
		};
		case "Foxtrot":
		{
			if( _killer != _killed) then
			{
				if ( side (group _killer) != side (group _killed) ) then
				{
					killsNumFoxtrot = killsNumFoxtrot + 1;
				}
				else
				{
					friendlyKillsNumFoxtrot = friendlyKillsNumFoxtrot + 1;			
				};
			};
		};
		case "Golf":
		{
			if( _killer != _killed) then
			{
				if ( side (group _killer) != side (group _killed) ) then
				{
					killsNumGolf = killsNumGolf + 1;
				}
				else
				{
					friendlyKillsNumGolf = friendlyKillsNumGolf + 1;			
				};
			};
		};
		case "Hotel":
		{
			if( _killer != _killed) then
			{
				if ( side (group _killer) != side (group _killed) ) then
				{
					killsNumHotel = killsNumHotel + 1;
				}
				else
				{
					friendlyKillsNumHotel = friendlyKillsNumHotel + 1;			
				};
			};
		};
		case "India":
		{
			if( _killer != _killed) then
			{
				if ( side (group _killer) != side (group _killed) ) then
				{
					killsNumIndia = killsNumIndia + 1;
				}
				else
				{
					friendlyKillsNumIndia = friendlyKillsNumIndia + 1;			
				};
			};
		};
		case "Juliet":
		{
			if( _killer != _killed) then
			{
				if ( side (group _killer) != side (group _killed) ) then
				{
					killsNumJuliet = killsNumJuliet + 1;
				}
				else
				{
					friendlyKillsNumJuliet = friendlyKillsNumJuliet + 1;			
				};
			};
		};
		default
		{
		};
	};
	
	{
		if ( !alive _x ) then
		{
			__grpAlphaArray = __grpAlphaArray -[_x];
			_countAlpha = count _grpAlphaArray;
		};
	} foreach _grpAlphaArray;

	{
		if ( !alive _x ) then
		{
			_grpBravoArray = _grpBravoArray -[_x];
			_countBravo = count _grpBravoArray;
		};
	} foreach _grpBravoArray;

	{
		if ( !alive _x ) then
		{
			_grpCharlieArray = _grpCharlieArray -[_x];
			_countCharlie = count _grpCharlieArray;
		};
	} foreach _grpCharlieArray;

	{
		if ( !alive _x ) then
		{
			_grpDeltaArray = _grpDeltaArray -[_x];
			_countDelta = count _grpDeltaArray;
		};
	} foreach _grpDeltaArray;
	
	{
		if ( !alive _x ) then
		{
			_grpEchoArray = _grpEchoArray -[_x];
			_countEcho = count _grpEchoArray;
		};
	} foreach _grpEchoArray;
	
	{
		if ( !alive _x ) then
		{
			_grpFoxtrotArray = _grpFoxtrotArray -[_x];
			_countFoxtrot = count _grpFoxtrotArray;
		};
	} foreach _grpFoxtrotArray;
	
	{
		if ( !alive _x ) then
		{
			_grpGolfArray = _grpGolfArray -[_x];
			_countGolf = count _grpGolfArray;
		};
	} foreach _grpGolfArray;
	
	{
		if ( !alive _x ) then
		{
			_grpHotelArray = _grpHotelArray -[_x];
			_countHotel = count _grpHotelArray;
		};
	} foreach _grpHotelArray;

	{
		if ( !alive _x ) then
		{
			_grpIndiaArray = _grpIndiaArray -[_x];
			_countIndia = count _grpIndiaArray;
		};
	} foreach _grpIndiaArray;
	
	{
		if ( !alive _x ) then
		{
			_grpJulietArray = _grpJulietArray -[_x];
			_countJuliet = count _grpJulietArray;
		};
	} foreach _grpJulietArray;
	
	if( _killer != _killed) then
	{
		_killerRank = (rank _killer);
		_killerName = (name _killer);
		if( (isNull _killer) &&  (side (group _killed) == east ) ) then
		{
			killsNumFoxtrot = killsNumFoxtrot + 1;
			_grpNameKiller ="Foxtrot";
			_killerRank = "Artillery";
			_killerName = "M119 Howitzer";
		};
		if( (isNull _killer) &&  (side (group _killed) == west ) ) then
		{
			friendlyKillsNumFoxtrot = friendlyKillsNumFoxtrot + 1;
			_grpNameKiller ="Foxtrot";
			_killerRank = "Colonel";
			_killerName = "Artillery";
		};
		systemChat globalChat format ["[%1] %2 %3 >>> [%4] %5 %6", _grpNameKiller, _killerRank, _killerName, _grpNameKilled, (rank _killed), (name _killed)];

	hint format["Team        Kills Friendly\n
Alpha(%1)     %2     %21\n
Bravo(%3)     %4     %22\n
Charlie(%5)    %6     %23\n
Delta(%7)     %8     %24\n
Echo(%9)      %10     %25\n
Foxtrot(%11)   %12     %26\n
Golf(%13)      %14     %27\n
Hotel(%15)     %16     %28\n
India(%17)      %18     %29\n
Juliet(%19)     %20     %30\n\n",_countAlpha, killsNumAlpha, 
									_countBravo, killsNumBravo, 
									_countCharlie, killsNumCharlie, 
									_countDelta, killsNumDelta, 
									_countEcho, killsNumEcho, 
									_countFoxtrot, killsNumFoxtrot, 
									_countGolf, killsNumGolf, 
									_countHotel, killsNumHotel, 
									_countIndia, killsNumIndia, 
									_countJuliet, killsNumJuliet,
									friendlyKillsNumAlpha, 
									friendlyKillsNumBravo, 
									friendlyKillsNumCharlie, 
									friendlyKillsNumDelta,
									friendlyKillsNumEcho,
									friendlyKillsNumFoxtrot,
									friendlyKillsNumGolf,
									friendlyKillsNumHotel,
									friendlyKillsNumIndia,
									friendlyKillsNumJuliet];	
	}
	else
	{
		systemChat globalChat format ["[%1] %2 %3 >>> SUICIDE!", _grpNameKilled, (rank _killed), (name _killed)];
	};
};

{
   _x addEventHandler ["killed", killedEH];
} forEach allUnits;


