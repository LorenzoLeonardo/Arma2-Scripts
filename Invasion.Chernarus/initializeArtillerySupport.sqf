//_scriptArtillery = [this,400,artiller_alpha_0,"M119"] execVM "initializeArtillerySupport.sqf";

_squadLeader = _this select 0;
_radiusDetection = _this select 1;
_artilleryUnit = _this select 2;
_artilleryType = _this select 3;

_text = toArray(str(group _squadLeader));
_text set[0,"**DELETE**"];
_text set[1,"**DELETE**"];
_text = _text - ["**DELETE**"];
_companyName = toString(_text);

		
_squadArray = units (group _squadLeader);
_allEntities = [];
_maxRange = 0;
_minRange = 0;
_ammoClass = "";
_markFireMission = true;
_countEast = 0;
_targetPos = 0;
_countAmmo = 0;
_countSquadArray = count _squadArray;
{
	_countAmmo = _countAmmo + (_x ammo _artilleryType);
} foreach _artilleryUnit;
_radioArtillery = "";
_radioArtilleryAdjust = "";
_radioArtilleryReply = "";
_markerColor = "";
_callerTexMarker = "";
_callerMarker = 0;
_countEast =  ({(side _x) == east && alive _x} count allUnits);
_enemyArray = [];

switch (_artilleryType) do
{
	case "M119":
	{
		_maxRange = 3000;
		_minRange = 500;
		_ammoClass = "ARTY_Sh_105_HE";
	};
	case "M252":
	{
		_maxRange = 1500;
		_minRange = 250;
		_ammoClass = "ARTY_Sh_81_HE";
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

switch (_companyName) do
{
	case "Alpha":
	{
		_radioArtillery = "RadioArtillerySupportAlpha";
		_radioArtilleryReply = "RadioArtillerySupportReplyAlpha";
		_radioArtilleryAdjust = "RadioArtilleryAdjustAlpha";
		_markerColor = "ColorBlue";
	};
	case "Bravo":
	{
		_radioArtillery = "RadioArtillerySupportBravo";
		_radioArtilleryReply = "RadioArtillerySupportReplyBravo";
		_radioArtilleryAdjust = "RadioArtilleryAdjustBravo";
		_markerColor = "ColorRed";
	};
	case "Charlie":
	{
		_radioArtillery = "RadioArtillerySupportCharlie";
		_radioArtilleryReply = "RadioArtillerySupportReplyCharlie";
		_radioArtilleryAdjust = "RadioArtilleryAdjustCharlie";
		_markerColor = "ColorGreen";
	};
	default
	{

	};
};

while { (_countAmmo > 0) && (_countEast > 0) && ( count _artilleryUnit > 0) && (_countSquadArray > 0) } do
{
	if ( alive _squadLeader ) then
	{
		_allEntities = (getPosASL _squadLeader) nearEntities [["Man", "Tank"], _radiusDetection];
	}
	else
	{
		_squadArray = _squadArray - [_squadLeader];
		_squadLeader = _squadArray select 0;
	};
	_countSquadArray = count _squadArray;
	_countEast =  ({(side _x) == east && alive _x} count _allEntities);

	//Check if too large army spotted call artillery strike
	if(	_countEast >= 15) then
	{
		hint format["Call Artillery Strike Now (%1)!", _companyName];
		{
			if( (side _x) == east && alive _x) then
			{
				_enemyArray set [count _allEastUnits, _x];
			}
		} foreach _allEntities;
	
		while { count _enemyArray > 0 } do
		{
			_enemyUnit = _enemyArray select floor(random(count _enemyArray));
			if( (alive _enemyUnit) ) then 
			{
				_xPos = 0;
				_yPos = 0;
				_zPos = 0;
				_averagePosition = [];
				
				{
					_xPos = _xPos + ((getPosASL _x) select 0);
					_yPos = _yPos + ((getPosASL _x) select 1);
					_zPos = _zPos + ((getPosASL _x) select 2);
					
				} foreach _enemyArray;
				_enemyCount = count _enemyArray;
				_xPos = _xPos/_enemyCount;
				_yPos = _yPos/_enemyCount;
				_zPos = _zPos/_enemyCount;
				
				_averagePosition set [count _averagePosition, _xPos];
				_averagePosition set [count _averagePosition, _yPos];
				_averagePosition set [count _averagePosition, _zPos];
				_targetPos = _averagePosition;//getPosASL _enemyUnit;
				//_targetPos = _enemyArray call getAverageArtilleryFiringPosition;
				if( _markFireMission) then
				{
					_callerTexMarker = str format["Fire Mission (%1)",_companyName];
					_callerMarker = createMarkerLocal[_callerTexMarker, _targetPos];
					_callerMarker setMarkerSizeLocal[1,1];
					_callerMarker setMarkerShapeLocal "ICON";
					_callerMarker setMarkerTypeLocal "FireMission";
					_callerMarker setMarkerDirLocal 0;
					_callerMarker setMarkerTextLocal _callerTexMarker;
					_callerMarker setMarkerColorLocal _markerColor;
					_markFireMission = false;
					
					{
						_x doWatch [_targetPos select 0, _targetPos select 1,  _maxRange];
					} foreach _artilleryUnit;
				
					_squadLeader sideRadio _radioArtillery;
					[west,"Base"] sideRadio _radioArtilleryReply;
					sleep 15;
				};
				_countAmmo = 0;
				for "_i" from 0 to 3 do
				{
					_artSound = 0;
					{
						_x fire _artilleryType;
						_Xrnd = (_targetPos select 0) + (round(random 100) - 50);
						_Yrnd = (_targetPos select 1) + (round(random 100) - 50);
						_bomb = _ammoClass createVehicle [_Xrnd, _Yrnd, _targetPos select 2];
						_countAmmo = _countAmmo + (_x ammo _artilleryType);
						sleep 2.5;
						switch( _artSound ) do
						{
							case 0:
							{
								playSound "IncomingArtillery0";
							};
							case 1:
							{
								playSound "IncomingArtillery1";							
							};
							case 2:
							{
								playSound "IncomingArtillery2";							
							};
							case 3:
							{
								playSound "IncomingArtillery0";							
							};
							case 4:
							{
								playSound "IncomingArtillery1";							
							};
						};
						_artSound = _artSound + 1;
					} foreach _artilleryUnit;
				};
				sleep 12;
			};

			{
				if( !(alive _x) ) then
				{
					_enemyArray = _enemyArray - [_x];
				};
			} foreach _enemyArray;
			
			{
				if( !(alive _x) ) then
				{
					_artilleryUnit = _artilleryUnit - [_x];
				};
			} foreach _artilleryUnit;
		};
		(leader (_artilleryUnit select 0)) sideRadio "RadioArtilleryRoundsComplete";
		_markFireMission = true;
		deleteMarkerLocal _callerMarker;
		sleep 6;
	};
	_countEast =  ({(side _x) == east && alive _x} count allUnits);
	sleep 1;
};

if( _countAmmo == 0) then
{
	hint format["Artillery out of ammo (%1)",_companyName];
	(leader (_artilleryUnit select 0)) sideRadio "RadioArtilleryOutOfAmmo";
};

if( count _artilleryUnit == 0) then
{
	hint "Artillery Squad was wiped out";
};

if( _countSquadArray == 0) then
{
	hint format["%1 was all wiped out.", _companyName];
};