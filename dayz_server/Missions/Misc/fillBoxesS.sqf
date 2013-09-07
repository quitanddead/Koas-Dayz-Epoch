_crate2 = _this select 0;

clearWeaponCargoGlobal _crate2;
clearMagazineCargoGlobal _crate2;

_ammoQuant = (ceil(random 5) + 2);
_ammoCrateClasses=floor(random 5);
switch (_ammoCrateClasses) do
{
  case 0: 
  {
  _crate addWeaponCargoGlobal ["ItemToolbox", 1];
  _crate addWeaponCargoGlobal ["ItemMap", 1];
  _crate addWeaponCargoGlobal ["M9SD", 1];
  _crate addMagazineCargoGlobal ["15Rnd_9x19_M9SD", _ammoQuant];
  _crate addWeaponCargoGlobal ["M4A1_RCO_GL", 1];
  _crate addMagazineCargoGlobal ["30Rnd_556x45_Stanag", _ammoQuant];
  _crate addBackpackCargoGlobal ['DZ_Assault_Pack_EP1', 1];
  };
  case 1: 
  {
  _crate addWeaponCargoGlobal ["ItemToolbox", 1];
  _crate addWeaponCargoGlobal ["ItemMap", 1];
  _crate addWeaponCargoGlobal ["MakarovSD", 1];
  _crate addMagazineCargoGlobal ["8Rnd_9x18_MakarovSD", _ammoQuant];
  _crate addWeaponCargoGlobal ["M16A4_GL", 1];
  _crate addMagazineCargoGlobal ["30Rnd_556x45_Stanag", _ammoQuant];
  _crate addBackpackCargoGlobal ['DZ_LargeGunBag_EP1', 1];
  };
  case 2: 
  {
  _crate addWeaponCargoGlobal ["ItemToolbox", 1];
  _crate addWeaponCargoGlobal ["ItemMap", 1];
  _crate addWeaponCargoGlobal ["M9SD", 1];
  _crate addMagazineCargoGlobal ["15Rnd_9x19_M9SD", _ammoQuant];
  _crate addWeaponCargoGlobal ["SVD_CAMO", 2];
  _crate addMagazineCargoGlobal ["10Rnd_762x54_SVD", _ammoQuant];
  _crate addBackpackCargoGlobal ['DZ_TerminalPack_EP1', 1];
  };
  case 3: 
  {
  _crate addWeaponCargoGlobal ["ItemToolbox", 1];
  _crate addWeaponCargoGlobal ["ItemMap", 1];
  _crate addWeaponCargoGlobal ["MakarovSD", 1];
  _crate addMagazineCargoGlobal ["8Rnd_9x18_MakarovSD", _ammoQuant];
  _crate addWeaponCargoGlobal ["RPK_74", 1];
  _crate addMagazineCargoGlobal ["75Rnd_545x39_RPK", _ammoQuant];
  _crate addBackpackCargoGlobal ['DZ_British_ACU', 1];
  };
  case 4: 
  {
  _crate addWeaponCargoGlobal ["ItemToolbox", 1];
  _crate addWeaponCargoGlobal ["ItemMap", 1];
  _crate addWeaponCargoGlobal ["M9SD", 1];
  _crate addMagazineCargoGlobal ["15Rnd_9x19_M9SD", _ammoQuant];
  _crate addWeaponCargoGlobal ["M4SPR", 1];
  _crate addMagazineCargoGlobal ["30Rnd_556x45_Stanag", _ammoQuant];
  _crate addBackpackCargoGlobal ['CZ_VestPouch_EP1', 1];
  };
};