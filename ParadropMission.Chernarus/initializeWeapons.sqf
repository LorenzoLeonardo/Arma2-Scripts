_groupCompanyArray = _this select 0;

player removeWeapon (primaryWeapon player);
player addWeapon "M4A1_RCO_GL";//"M16A4_ACG_GL"; //
player removeMagazines "30Rnd_556x45_Stanag";
for "_i" from 0 to 12 do
{
	player addMagazine "30Rnd_556x45_Stanag";
};
player selectWeapon "M4_ACOG_Muzzle"; //"M16A4_ACG_GL";
reload player;
