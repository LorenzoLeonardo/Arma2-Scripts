player removeWeapon (primaryWeapon player);
player addWeapon "M16A4_ACG_GL";//"M16A4_ACG_GL"; //
player removeMagazines "30Rnd_556x45_Stanag";
for "_i" from 0 to 12 do
{
	player addMagazine "30Rnd_556x45_Stanag";
};
player selectWeapon "M16A4_ACG_GL"; //"M16A4_ACG_GL";
reload player;
