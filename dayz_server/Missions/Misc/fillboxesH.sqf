_crate3 = _this select 0;

clearWeaponCargoGlobal _crate3;
clearMagazineCargoGlobal _crate3;


_ammoQuant = (ceil(random 5) + 2);
_ammoCrateClasses=floor(random 5);
switch (_ammoCrateClasses) do
{
  case 0: 
  {
  _crate addWeaponCargoGlobal ["M9SD", 1];
  _crate addMagazineCargoGlobal ["15Rnd_9x19_M9SD", _ammoQuant];
  _crate addWeaponCargoGlobal ["AK_107_pso", 1];
  _crate addMagazineCargoGlobal ["30Rnd_545x39_AK", _ammoQuant];
  _crate addBackpackCargoGlobal ['DZ_Assault_Pack_EP1', 1];
  _crate addMagazineCargoGlobal ["Skin_Soldier1_DZ", 1];
  };
  case 1: 
  {
  _crate addWeaponCargoGlobal ["MakarovSD", 1];
  _crate addMagazineCargoGlobal ["8Rnd_9x18_MakarovSD", _ammoQuant];
  _crate addWeaponCargoGlobal ["DMR", 1];
  _crate addMagazineCargoGlobal ["20Rnd_762x51_DMR", _ammoQuant];
  _crate addBackpackCargoGlobal ['DZ_LargeGunBag_EP1', 1];
  _crate addMagazineCargoGlobal ["Skin_Camo1_DZ", 1];
  };
  case 2: 
  {
  _crate addWeaponCargoGlobal ["M9SD", 1];
  _crate addMagazineCargoGlobal ["15Rnd_9x19_M9SD", _ammoQuant];
  _crate addWeaponCargoGlobal ["SVD_CAMO", 2];
  _crate addMagazineCargoGlobal ["10Rnd_762x54_SVD", _ammoQuant];
  _crate addBackpackCargoGlobal ['DZ_TerminalPack_EP1', 1];
  _crate addMagazineCargoGlobal ["Skin_CZ_Special_Forces_GL_DES_EP1_DZ", 1];
  };
  case 3: 
  {
  _crate addWeaponCargoGlobal ["MakarovSD", 1];
  _crate addMagazineCargoGlobal ["8Rnd_9x18_MakarovSD", _ammoQuant];
  _crate addWeaponCargoGlobal ["Saiga12K", 1];
  _crate addMagazineCargoGlobal ["8Rnd_B_Saiga12_74Slug", _ammoQuant];
  _crate addMagazineCargoGlobal ["8Rnd_B_Saiga12_Pellets", _ammoQuant];
  _crate addBackpackCargoGlobal ['DZ_British_ACU', 1];
  _crate addMagazineCargoGlobal ["Skin_Soldier_Bodyguard_AA12_PMC_DZ", 1];
  };
  case 4: 
  {
  _crate addWeaponCargoGlobal ["M9SD", 1];
  _crate addMagazineCargoGlobal ["15Rnd_9x19_M9SD", _ammoQuant];
  _crate addWeaponCargoGlobal ["SCAR_H_LNG_Sniper_SD", 1];
  _crate addMagazineCargoGlobal ["20Rnd_762x51_SB_SCAR", _ammoQuant];
  _crate addBackpackCargoGlobal ['CZ_VestPouch_EP1', 1];
  _crate addMagazineCargoGlobal ["Skin_CZ_Soldier_Sniper_EP1_DZ", 1];
  };
};