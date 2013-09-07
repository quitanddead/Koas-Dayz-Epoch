_crate = _this select 0;

clearWeaponCargoGlobal _crate;
clearMagazineCargoGlobal _crate;
_ammoCrateClasses=floor(random 4);
switch (_ammoCrateClasses) do
{
  case 0: {_crate addWeaponCargoGlobal ["ItemToolbox", 1];};
  case 1: {_crate addWeaponCargoGlobal ["glock17_EP1", 1];};
  case 2: {_crate addWeaponCargoGlobal ["M4A1_AIM_SD_camo", 1];};
  case 3: {_crate addWeaponCargoGlobal ["M4A1_HWS_GL_SD_Camo", 1];};
};
/*
_crate addMagazineCargoGlobal ["ItemBandage", 6];

_crate addWeaponCargoGlobal ["ItemMatchbox", 6];

_crate addMagazineCargoGlobal ["ItemMorphine", 6];

_crate addMagazineCargoGlobal ["ItemEpinephrine", 6];

_crate addMagazineCargoGlobal ["ItemPainkiller", 6];

_crate addMagazineCargoGlobal ["ItemWaterbottle", 6];

_crate addMagazineCargoGlobal ["FoodCanBakedBeans", 6];

_crate addMagazineCargoGlobal ["ItemAntibiotic", 6];

_crate addMagazineCargoGlobal ["ItemBloodbag", 6];

_crate addMagazineCargoGlobal ["SmokeShellRed", 6];

_crate addMagazineCargoGlobal ["SmokeShellGreen", 6];

_crate addMagazineCargoGlobal ["SmokeShellPurple", 6];

_crate addMagazineCargoGlobal ["SmokeShellBlue", 6];

_crate addMagazineCargoGlobal ["SmokeShellYellow", 6];

_crate addBackpackCargoGlobal ['DZ_Backpack_EP1', 1];
*/