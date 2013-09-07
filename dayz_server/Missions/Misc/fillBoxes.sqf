_crate = _this select 0;

clearWeaponCargoGlobal _crate;
clearMagazineCargoGlobal _crate;

_ammoQuant = ceil(random 7);
_ammoCrateClasses=floor(random 5);
switch (_ammoCrateClasses) do
{
  case 0: 
  {
  _crate addMagazineCargoGlobal ["SmokeShellRed", _ammoQuant];
  _crate addWeaponCargoGlobal ["ItemToolbox", 1];
  _crate addWeaponCargoGlobal ["ItemMap", 1];
  _crate addWeaponCargoGlobal ["glock17_EP1", 1];
  _crate addMagazineCargoGlobal ["17Rnd_9x19_glock17", _ammoQuant];
  _crate addWeaponCargoGlobal ["G36A_camo", 1];
  _crate addMagazineCargoGlobal ["30Rnd_556x45_G36", _ammoQuant];
  _crate addBackpackCargoGlobal ['DZ_Assault_Pack_EP1', 1];
  _crate addMagazineCargoGlobal ["Skin_Soldier1_DZ", 1];
  };
  case 1: 
  {
  _crate addMagazineCargoGlobal ["SmokeShellGreen", _ammoQuant];
  _crate addWeaponCargoGlobal ["ItemToolbox", 1];
  _crate addWeaponCargoGlobal ["ItemMap", 1];
  _crate addWeaponCargoGlobal ["UZI_EP1", 1];
  _crate addMagazineCargoGlobal ["30Rnd_9x19_UZI", _ammoQuant];
  _crate addWeaponCargoGlobal ["M4A1_AIM_SD_camo", 1];
  _crate addMagazineCargoGlobal ["30Rnd_556x45_StanagSD", _ammoQuant];
  _crate addBackpackCargoGlobal ['DZ_LargeGunBag_EP1', 1];
  _crate addMagazineCargoGlobal ["Skin_Camo1_DZ", 1];
  };
  case 2: 
  {
  _crate addMagazineCargoGlobal ["SmokeShellPurple", _ammoQuant];
  _crate addWeaponCargoGlobal ["ItemToolbox", 1];
  _crate addWeaponCargoGlobal ["ItemMap", 1];
  _crate addWeaponCargoGlobal ["glock17_EP1", 1];
  _crate addMagazineCargoGlobal ["17Rnd_9x19_glock17", _ammoQuant];
  _crate addWeaponCargoGlobal ["M14_EP1", 2];
  _crate addMagazineCargoGlobal ["30Rnd_556x45_Stanag", _ammoQuant];
  _crate addBackpackCargoGlobal ['DZ_TerminalPack_EP1', 1];
  _crate addMagazineCargoGlobal ["Skin_CZ_Special_Forces_GL_DES_EP1_DZ", 1];
  };
  case 3: 
  {
  _crate addMagazineCargoGlobal ["SmokeShellBlue", _ammoQuant];
  _crate addWeaponCargoGlobal ["ItemToolbox", 1];
  _crate addWeaponCargoGlobal ["ItemMap", 1];
  _crate addWeaponCargoGlobal ["UZI_EP1", 1];
  _crate addMagazineCargoGlobal ["30Rnd_9x19_UZI", _ammoQuant];
  _crate addWeaponCargoGlobal ["M16A4_ACG_GL", 1];
  _crate addMagazineCargoGlobal ["30Rnd_556x45_Stanag", _ammoQuant];
  _crate addBackpackCargoGlobal ['DZ_British_ACU', 1];
  _crate addMagazineCargoGlobal ["Skin_Soldier_Bodyguard_AA12_PMC_DZ", 1];
  };
  case 4: 
  {
  _crate addMagazineCargoGlobal ["SmokeShellYellow", _ammoQuant];
  _crate addWeaponCargoGlobal ["ItemToolbox", 1];
  _crate addWeaponCargoGlobal ["ItemMap", 1];
  _crate addWeaponCargoGlobal ["glock17_EP1", 1];
  _crate addMagazineCargoGlobal ["17Rnd_9x19_glock17", _ammoQuant];
  _crate addWeaponCargoGlobal ["M4A3_CCO_EP1", 1];
  _crate addMagazineCargoGlobal ["30Rnd_556x45_Stanag", _ammoQuant];
  _crate addBackpackCargoGlobal ['CZ_VestPouch_EP1', 1];
  _crate addMagazineCargoGlobal ["Skin_CZ_Soldier_Sniper_EP1_DZ", 1];
  };
};
