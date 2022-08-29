_group = _this select 0;
_grpName = _this select 1;

_Array = units _group;


_flag = true;
while { _flag } do
{
	{
		if(!alive _x)then
		{
			_Array = _Array - [_x];
		};
	} foreach _Array;
	
	for "_i" from 0 to (count _Array) do 
	{
		if( !(someAmmo (_Array select _i))) then{
			_i = (count _Array);
			_flag = false;
		};
	};
	sleep 1;
};

if(count _Array > 0)then
{
	_scriptHandle = [_Array select 0,_grpName,300,50,2000,150,"USBasicAmmunitionBox"] execvm "dropAmmoSupplies.sqf";
};
