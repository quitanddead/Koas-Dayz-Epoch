_crate = _this select 0;

clearWeaponCargoGlobal _crate;
clearMagazineCargoGlobal _crate;

_ammoQuant = (ceil(random 5)) + 6;

_crate addMagazineCargoGlobal ["ItemBandage", _ammoQuant];
_crate addWeaponCargoGlobal ["ItemMatchbox", _ammoQuant];
_crate addMagazineCargoGlobal ["ItemMorphine", _ammoQuant];
_crate addMagazineCargoGlobal ["ItemEpinephrine", _ammoQuant];
_crate addMagazineCargoGlobal ["ItemPainkiller", _ammoQuant];
_crate addMagazineCargoGlobal ["ItemWaterbottle", _ammoQuant];
_crate addMagazineCargoGlobal ["FoodCanBakedBeans", _ammoQuant];
_crate addMagazineCargoGlobal ["ItemAntibiotic", _ammoQuant];
_crate addMagazineCargoGlobal ["ItemBloodbag", _ammoQuant];
_crate addMagazineCargoGlobal ["SmokeShellRed", _ammoQuant];
_crate addMagazineCargoGlobal ["SmokeShellGreen", _ammoQuant];
_crate addMagazineCargoGlobal ["SmokeShellPurple", _ammoQuant];
_crate addMagazineCargoGlobal ["SmokeShellBlue", _ammoQuant];
_crate addMagazineCargoGlobal ["SmokeShellYellow", _ammoQuant];