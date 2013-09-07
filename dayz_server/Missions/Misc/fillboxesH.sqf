_crate3 = _this select 0;

clearWeaponCargoGlobal _crate3;
clearMagazineCargoGlobal _crate3;


_ammoCrateClasses=floor(random 4);
switch (_ammoCrateClasses) do
{
  case 0: {_crate3 addWeaponCargoGlobal ["ItemToolbox", 1];};
  case 1: {_crate3 addWeaponCargoGlobal ["glock17_EP1", 1];};
  case 2: {_crate3 addWeaponCargoGlobal ["M4A1_AIM_SD_camo", 1];};
  case 3: {_crate3 addWeaponCargoGlobal ["M4A1_HWS_GL_SD_Camo", 1];};
};
/*
_crate3 addWeaponCargoGlobal ["M9SD", 1];

_crate3 addWeaponCargoGlobal ["MakarovSD", 1];



_crate3 addMagazineCargoGlobal ["15Rnd_9x19_M9SD", 3];

_crate3 addMagazineCargoGlobal ["8Rnd_9x18_MakarovSD", 3];


_crate3 addWeaponCargoGlobal ["AK_107_pso", 1];

//_crate3 addWeaponCargoGlobal ["DMR", 1];

_crate3 addWeaponCargoGlobal ["M40A3", 1];

//_crate3 addWeaponCargoGlobal ["M24_des_EP1", 1];

_crate3 addWeaponCargoGlobal ["SVD_CAMO", 1];

//_crate3 addWeaponCargoGlobal ["SVD", 1];

_crate3 addWeaponCargoGlobal ["SVD_des_EP1", 1];

//_crate3 addBackpackCargoGlobal ['DZ_Backpack_EP1', 1];

_crate3 addMagazineCargoGlobal ["Skin_Sniper1_DZ", 3];



_crate3 addMagazineCargoGlobal ["30Rnd_545x39_AK", 6];

_crate3 addMagazineCargoGlobal ["10Rnd_762x54_SVD", 6];

_crate3 addMagazineCargoGlobal ["20Rnd_762x51_DMR", 6];

*/
