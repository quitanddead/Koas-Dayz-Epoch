//tow
BTC_tow_driver   = [];
BTC_tow         = 1;
BTC_towed       = 0;
BTC_tow_min_h   = -10;
BTC_tow_max_h   = 5;
BTC_tow_radius  = 8;
BTC_cargo_towed = objNull;
BTC_towable     = ["LandVehicle","car","Air","Ship","Motorcycle","Helicopter","Chopper"];
BTC_Hud_Cond     = false;
BTC_HUD_x        = (SafeZoneW+2*SafeZoneX) + 0.045;
BTC_HUD_y        = (SafeZoneH+2*SafeZoneY) + 0.045;
_tow = [] execVM "=BTC=_LogisticTow\=BTC=_tow\=BTC=_towInit.sqf";
//Functions
BTC_get_towable_array =
{
   _LandVehicle = _this select 0;
   _array   = [];
   switch (typeOf _LandVehicle) do
   {
	  case "UAZ_Unarmed_TK_EP1"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34","Su34"];};
	  case "UAZ_Unarmed_TK_CIV_EP1"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "UAZ_Unarmed_UN_EP1"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "UAZ_RU"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "ATV_US_EP1"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "ATV_CZ_EP1"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "SkodaBlue"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "Skoda"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "SkodaGreen"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "hilux1_civil_3_open"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "Ikarus_TK_CIV_EP1"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "Ikarus"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "Tractor"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "S1203_TK_CIV_EP1"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "V3S_Civ"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "UralCivil"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "car_hatchback"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "Volha_2_TK_CIV_EP1"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "Volha_1_TK_CIV_EP1"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "SUV_TK_CIV_EP1"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "car_sedan"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "hilux1_civil_3_open_EP1"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "UralCivil2"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "LandRover_CZ_EP1"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "BW_Ikarus1"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "BW_Ikarus2"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "kpfs_golf_g"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "kpfs_golf_p"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "kpfs_golf_post"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "kpfs_golf_tk"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "Lada1_GDR"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "Lada2_GDR"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "Lada2_TK_CIV_EP1"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "Lada4_GDR"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "Lada5_GDR"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "TT650_Civ"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "TT650_Gue"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "MTVR"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "BAF_Offroad_D"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "BAF_Offroad_W"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "datsun1_civil_3_open"    : {_array = ["LandVehicle","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle"];};
	  case "datsun1_civil_2_covered"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "GAZ_Vodnik"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "hilux1_civil_1_open"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "hilux1_civil_2_covered"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "Lada"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "Lada1"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "Lada1_TK_CIV_EP1"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "LadaLM"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "LandRover_TK_CIV_EP1"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "MMT_Civ"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "Old_moto_TK_Civ_EP1"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "S1203_ambulance_EP1"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "SkodaRed"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "TowingTractor"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "VWGolf"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "VolhaLimo_TK_CIV_EP1"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "UralRefuel_INS"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "Ural_INS"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "HMMWV_DES_EP1"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "KamazRefuel"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "kamaz_refuel"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "UAZ_MG_INS"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "KamazRepair"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "UralRepair_INS"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "ZSU_TK_EP1"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "Ural_CDF"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "Suv_PMC"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "HMMWV_M1151_M2_DES_EP1"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "HMMWV_M998_crows_MK19_DES_EP1"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "SUV_TK_EP1"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "M1128_MGS_EP1"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "HMMWV_M998_crows_MK19_DES_EP1"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "BTR60_TK_EP1"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "LAV25"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "LAV25_HQ"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "HMMWV"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "HMMWV_TOW"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
	  case "BTR90_HQ"    : {_array = ["LandVehicle","car","AH64D_EP1","Mi24_D","Mi24_P","Mi24_V","AH6X_DZ","UH1H_DZ","Ship","Motorcycle","A10_US_EP1","AH1Z","MH60S","A10","AV8B2","Su39","kh_maule_m7_white","AN2_DZ","Su34"];};
   };
   _array
};
BTC_obj_fall =
{
   _obj    = _this select 0;
   _height = getPos _obj select 2;
   _fall   = 0.09;
   while {(getPos _obj select 2) > 1} do
   {

      _fall = (_fall * 1.1);
      _obj setPos [getPos _obj select 0, getPos _obj select 1, _height];
      _height = _height - _fall;
      sleep 0.01;
   };
   _obj setPos [getPos _obj select 0, getPos _obj select 1, 0];
};
BTC_paradrop =
{
   _Veh          = _this select 0;
   _dropped      = _this select 1;
   _chute_type   = _this select 2;
   private ["_chute"];
   _dropped_type = typeOf _dropped;
   if (typeOf _Veh == "MH6J_EP1") then {_chute = createVehicle [_chute_type, [((position _Veh) select 0) - 5,((position _Veh) select 1) - 10,((position _Veh) select 2)- 4], [], 0, "NONE"];} else {_chute = createVehicle [_chute_type, [((position _Veh) select 0) - 5,((position _Veh) select 1) - 3,((position _Veh) select 2)- 4], [], 0, "NONE"];};
   _smoke        = "" createVehicle position _Veh;
    _smoke attachto [_dropped,[0,0,0]];
   _dropped attachTo [_chute,[0,0,0]];
   while {getPos _chute select 2 > 2} do {sleep 1;};
   detach _dropped;
};
BTC_hint = {_text  = _this select 0;_sleep = _this select 1;hintSilent _text;sleep _sleep;hintSilent "";};