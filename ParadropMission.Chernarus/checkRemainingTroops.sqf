grpAlpha = _this select 0;
grpBravo = _this select 1;
enemyOfficersArray = _this select 2;

killsNumAlpha = 0;
killsNumBravo = 0;

killedEH = {
	_killed = _this select 0;
	_killer = _this select 1;

    _alphaCount = count units grpAlpha;
	_bravoCount = count units grpBravo;
	_enemyOfficersCount = count enemyOfficersArray;

	_grpAlphaArray = units grpAlpha;
	_grpBravoArray = units grpBravo;

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
	
	switch (_grpNameKiller) do
	{
		case "Alpha":
		{
			if ( side (group _killer) != side (group _killed) ) then
			{
				killsNumAlpha = killsNumAlpha + 1;
			}
			else
			{
				killsNumAlpha = killsNumAlpha - 1;			
			};
		};

		case "Bravo":
		{
			if ( side (group _killer) != side (group _killed) ) then
			{
				killsNumBravo = killsNumBravo + 1;
			}
			else
			{
				killsNumBravo = killsNumBravo - 1;			
			};
		};

		default
		{
		};
	};
	
	{
		if ( !alive _x ) then
		{
			_grpAlphaArray = _grpAlphaArray -[_x];
			_alphaCount = count _grpAlphaArray;
		};
	} foreach _grpAlphaArray;

	{
		if ( !alive _x ) then
		{
			_grpBravoArray = _grpBravoArray -[_x];
			_bravoCount = count _grpBravoArray;
		};
	} foreach _grpBravoArray;

	{
		if ( !alive _x ) then
		{
			enemyOfficersArray = enemyOfficersArray -[_x];
			_enemyOfficersCount = count enemyOfficersArray;
			saveGame;
		};
	} foreach enemyOfficersArray;	
	
	if( _killer != _killed) then
	{
		systemChat globalChat format ["[%1] %2 %3 >>> [%4] %5 %6", _grpNameKiller, (rank _killer), (name _killer), _grpNameKilled, (rank _killed), (name _killed)];	
	}
	else
	{
		systemChat globalChat format ["[%1] %2 %3 is committing suicide!", _grpNameKiller, (rank _killer), (name _killer)];
	};
	
	hint format["Alpha Team: %1 Kills : %2\nBravo Team: %3 Kills : %4\nEnemy Officers: %5", _alphaCount, killsNumAlpha, _bravoCount, killsNumBravo, _enemyOfficersCount];
};

{
   _x addEventHandler ["killed", killedEH];
} forEach allUnits;
