//Lift
BTC_lift_pilot   = [];
BTC_lift         = 1;
BTC_lifted       = 0;
BTC_lift_min_h   = 0;
BTC_lift_max_h   = 50;
BTC_lift_radius  = 5;
BTC_cargo_lifted = objNull;
BTC_Liftable     = ["LandVehicle","Air","Land_HBarrier_large"];
BTC_Hud_Cond     = false;
BTC_HUD_x        = (SafeZoneW+2*SafeZoneX) + 0.045;
BTC_HUD_y        = (SafeZoneH+2*SafeZoneY) + 0.045;
_lift = [] execVM "=BTC=_Logistic\=BTC=_Lift\=BTC=_LiftInit.sqf";
//Functions
BTC_get_liftable_array =
{
   _chopper = _this select 0;
   _array   = [];
   switch (typeOf _chopper) do
   {
      case "MH6J_EP1"    : {_array = ["LandVehicle","car","Air","Ship","Motorcycle"];};
      case "UH1H_DZ"     : {_array = ["LandVehicle","car","Air","Ship","Motorcycle"];};
      case "CH_47F_EP1"  : {_array = ["LandVehicle","car","Air","Ship","Motorcycle"];};
      case "Mi17_DZ"     : {_array = ["LandVehicle","car","Air","Ship","Motorcycle"];};
	  case "AH6X_DZ"     : {_array = ["LandVehicle","car","Air","Ship","Motorcycle"];};
	  case "MV22"     	 : {_array = ["LandVehicle","car","Air","Ship","Motorcycle"];};
	  case "AN2_DZ"      : {_array = ["LandVehicle","car","Air","Ship","Motorcycle"];};
	  case "AH64D_EP1"   : {_array = ["LandVehicle","car","Air","Ship","Motorcycle"];};
	  case "Mi24_D"      : {_array = ["LandVehicle","car","Air","Ship","Motorcycle"];};
	  case "Mi24_P"      : {_array = ["LandVehicle","car","Air","Ship","Motorcycle"];};
	  case "Mi24_V"      : {_array = ["LandVehicle","car","Air","Ship","Motorcycle"];};
	  case "AH1Z"      : {_array = ["LandVehicle","car","Air","Ship","Motorcycle"];};
	  case "MH60S"      : {_array = ["LandVehicle","car","Air","Ship","Motorcycle"];};
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
   _smoke        = "SmokeshellGreen" createVehicle position _Veh;
    _smoke attachto [_dropped,[0,0,0]];
   _dropped attachTo [_chute,[0,0,0]];
   while {getPos _chute select 2 > 2} do {sleep 1;};
   detach _dropped;
};
BTC_hint = {_text  = _this select 0;_sleep = _this select 1;hintSilent _text;sleep _sleep;hintSilent "";};