_crate2 = _this select 0;

clearWeaponCargoGlobal _crate2;
clearMagazineCargoGlobal _crate2;

_ammoQuant = (ceil(random 5) + 2);

// Number of primary weapons allowed
_numPrim = 2;
_numPist = 2;
_numClothes = 2;
_numPack = 1;

// Primary Gun List ["ClassName",1-100(probability),"Ammo"]
_primaryWeapons = [
	["G36A_camo",80,"30Rnd_556x45_G36"],
	["M4A1_AIM_SD_camo",20,"30Rnd_556x45_StanagSD"],
	["M14_EP1",50,"30Rnd_556x45_StanagSD"],
	["M16A4_ACG_GL",45,"30Rnd_556x45_StanagSD"],
	["M4A3_CCO_EP1",90,"30Rnd_556x45_StanagSD"],
	["Sa58P_EP1",90,"30Rnd_762x39_SA58"],
	["Sa58V_CCO_EP1",90,"30Rnd_762x39_SA58"],
	["Sa58V_EP1",90,"30Rnd_762x39_SA58"],
	["Sa58V_RCO_EP1",90,"30Rnd_762x39_SA58"],
	["AKS_74_kobra",90,"30Rnd_545x39_AK"],
	["AKS_74_U",90,"30Rnd_545x39_AK"],
	["AKS_GOLD",90,"30Rnd_545x39_AK"],
	["AK_47_M",90,"30Rnd_762x39_AK47"],
	["AK_74",90,"30Rnd_762x39_AK47"],
	["FN_FAL",90,"20Rnd_762x51_FNFAL"],
	["FN_FAL_ANPVS4",90,"20Rnd_762x51_FNFAL"]
	]; 
/*
// Pistol Gun List ["ClassName",1-100(probability),"Ammo"]
_pistolWeapons = [
	["MakarovSD",20,"8Rnd_9x18_MakarovSD"],
	["Colt1911",20,"7Rnd_45ACP_1911"],
	["glock17_EP1",20,"17Rnd_9x19_glock17"],
	["M9",20,"15Rnd_9x19_M9"],
	["M9SD",20,"15Rnd_9x19_M9SD"],
	["Makarov",20,"8Rnd_9x18_Makarov"],
	["revolver_EP1",20,"6Rnd_45ACP"],
	["revolver_gold_EP1",20,"6Rnd_45ACP"],
	["UZI_EP1",20,"30Rnd_9x19_UZI"]
	];
	
// Clothes List ["ClassName",1-100(probability)]
_cothesSkin = [
	["Skin_Functionary1_EP1_DZ",20],
	["Skin_Haris_Press_EP1_DZ",20],
	["Skin_Ins_Soldier_GL_DZ",20],
	["Skin_Priest_DZ",20],
	["Skin_Rocker2_DZ",20],
	["Skin_Sniper1_DZ",20],
	["Skin_Soldier_Bodyguard_AA12_PMC_DZ",20],
	["Skin_Survivor2_DZ",20],
	["Skin_TK_INS_Soldier_EP1_DZ",20],
	["Skin_TK_INS_Warlord_EP1_DZ",20],
	["Skin_Rocker1_DZ",20],
	["Skin_Rocker3_DZ",20],
	["Skin_Rocker4_DZ",20],
	["Skin_Bandit1_DZ",20],
	["Skin_Bandit2_DZ",20],
	["Skin_BanditW1_DZ",20],
	["Skin_BanditW2_DZ",20],
	["Skin_SurvivorW2_DZ",20],
	["Skin_SurvivorW3_DZ",20],
	["Skin_SurvivorWpink_DZ",20],
	["Skin_SurvivorWcombat_DZ",20],
	["Skin_SurvivorWdesert_DZ",20],
	["Skin_SurvivorWurban_DZ",20],
	["Skin_CZ_Special_Forces_GL_DES_EP1_DZ",20],
	["Skin_Drake_Light_DZ",20],
	["Skin_Pilot_EP1_DZ",20],
	["Skin_RU_Policeman_DZ",20],
	["Skin_Camo1_DZ",20],
	["Skin_Rocket_DZ",20],
	["Skin_Soldier1_DZ",20],
	["Skin_Soldier_Sniper_PMC_DZ",20],
	["Skin_Soldier_TL_PMC_DZ",20],
	["Skin_FR_OHara_DZ",20],
	["Skin_FR_Rodriguez_DZ",20],
	["Skin_CZ_Soldier_Sniper_EP1_DZ",20],
	["Skin_Graves_Light_DZ",20],
	["Skin_GUE_Commander_DZ",20],
	["Skin_GUE_Soldier_2_DZ",20],
	["Skin_GUE_Soldier_CO_DZ",20],
	["Skin_GUE_Soldier_Crew_DZ",20],
	["Skin_GUE_Soldier_Sniper_DZ",20]
	];

// Backpack List ["ClassName",1-100(probability)]
_backPack = [
	["CZ_VestPouch_EP1",10],
	["DZ_ALICE_Pack_EP1",10],
	["DZ_Assault_Pack_EP1",10],
	["DZ_Backpack_EP1",5],
	["DZ_British_ACU",10],
	["DZ_CivilBackpack_EP1",10],
	["DZ_Czech_Vest_Puch",10],
	["DZ_Patrol_Pack_EP1",10],
	["DZ_TK_Assault_Pack_EP1",10],
	["DZ_LargeGunBag_EP1",1],
	["DZ_GunBag_EP1",10],
	["DZ_CompactPack_EP1",10],
	["DZ_TerminalPack_EP1",10],
	];
	
// These items are always included
_toolsAlways = ["ItemToolbox","ItemMap"]; 
*/



////// Don't Edit Below!!! ////////


_primecount = 0;
while{_primecount < _numPrim} do
{
	for [{_i=0}, {_i < count _primaryWeapons}, {_i=_i+1}] do
	{
		_item = (_primaryWeapons select _i) select 0;
		_probability = (_primaryWeapons select _i) select 1;
		_ammo = (_primaryWeapons select _i) select 2;
		_chance = (random 100);
		if((_chance < _probability) && (_primecount < _numPrim)) then {
			_crate2 addWeaponCargoGlobal [_item, 1];
			_crate2 addMagazineCargoGlobal [_ammo, _ammoQuant];
			_primecount = _primecount + 1;			
		};
	};
};
/*
_primecount = 0;
while{_primecount < _numPist} do
{
	for [{_i=0}, {_i < count _pistolWeapons}, {_i=_i+1}] do
	{
		_item = (_pistolWeapons select _i) select 0;
		_probability = (_pistolWeapons select _i) select 1;
		_ammo = (_pistolWeapons select _i) select 2;
		_chance = (random 100);
		if(_chance < _probability) then {
			_crate2 addWeaponCargoGlobal [_item, 1];
			_crate2 addMagazineCargoGlobal [_ammo, _ammoQuant];
			_primecount = _primecount + 1;
		};
	};
};

_primecount = 0;
while{_primecount < _numClothes} do
{
	for [{_i=0}, {_i < count _cothesSkin}, {_i=_i+1}] do
	{
		_item = (_cothesSkin select _i) select 0;
		_probability = (_cothesSkin select _i) select 1;
		_chance = (random 100);
		if(_chance < _probability) then {
			_crate2 addMagazineCargoGlobal [_item, 1];
			_primecount = _primecount + 1;
		};
	};
};

_primecount = 0;
while{_primecount < _numPack} do
{
	for [{_i=0}, {_i < count _backPack}, {_i=_i+1}] do
	{
		_item = (_backPack select _i) select 0;
		_probability = (_backPack select _i) select 1;
		_chance = (random 100);
		if(_chance < _probability) then {
			_crate2 addBackpackCargoGlobal [_item, 1];
			_primecount = _primecount + 1;
		};
	};
};

for [{_i=0}, {_i < count _toolsAlways}, {_i=_i+1}] do
{
		_item = (_toolsAlways select _i) select 0;
		_crate2 addWeaponCargoGlobal [_item, 1];
};*/