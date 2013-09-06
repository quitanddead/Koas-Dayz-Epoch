scriptName "Functions\misc\fn_selfActions.sqf";
/***********************************************************
	ADD ACTIONS FOR SELF
	- Function
	- [] call fnc_usec_selfActions;
************************************************************/
private["_isStash","_vehicle","_inVehicle","_bag","_classbag","_isWater","_hasAntiB","_hasFuelE","_hasFuel5","_hasbottleitem","_hastinitem","_hasKnife","_hasToolbox","_hasTent","_onLadder","_nearLight","_canPickLight","_canDo","_text","_isHarvested","_isVehicle","_isVehicletype","_isMan","_ownerID","_isAnimal","_isDog","_isZombie","_isDestructable","_isTent","_isFuel","_isAlive","_canmove","_rawmeat","_hasRawMeat","_allFixed","_hitpoints","_damage","_part","_cmpt","_damagePercent","_color","_string","_handle","_dogHandle","_lieDown","_warn","_dog","_speed"];

_vehicle = vehicle player;
_inVehicle = (_vehicle != player);
_bag = unitBackpack player;
_classbag = typeOf _bag;
_isWater = (surfaceIsWater (position player)) or dayz_isSwimming;
_hasAntiB = "ItemAntibiotic" in magazines player;
_hasFuelE20 = "ItemJerrycanEmpty" in magazines player;
_hasFuelE5 = "ItemFuelcanEmpty" in magazines player;
//boiled Water
_hasbottleitem = "ItemWaterbottle" in magazines player;
_hastinitem = false;
{
    if (_x in magazines player) then {
        _hastinitem = true;
    };

} forEach boil_tin_cans;


_hasKnife = "ItemKnife" in items player;
_hasToolbox = "ItemToolbox" in items player;
//_hasTent = "ItemTent" in items player;
_onLadder = (getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
_nearLight = nearestObject [player,"LitObject"];
_canPickLight = false;

if (!isNull _nearLight) then {
	if (_nearLight distance player < 4) then {
		_canPickLight = isNull (_nearLight getVariable ["owner",objNull]);
	};
};
_canDo = (!r_drag_sqf and !r_player_unconscious and !_onLadder);


// ---------------------------------------Krixes Self Bloodbag Start------------------------------------
    _mags = magazines player;
 
    // Krixes Self Bloodbag
    if ("ItemBloodbag" in _mags) then {
        hasBagItem = true;
    } else { hasBagItem = false;};
    if((speed player <= 1) && hasBagItem && _canDo) then {
        if (s_player_selfBloodbag < 0) then {
            s_player_selfBloodbag = player addaction[("<t color=""#c70000"">" + ("Self Bloodbag") +"</t>"),"scripts\player_selfbloodbag.sqf","",5,false,true,"", ""];
        };
    } else {
        player removeAction s_player_selfBloodbag;
        s_player_selfBloodbag = -1;
    };
// ---------------------------------------Krixes Self Bloodbag End------------------------------------
 

//if((speed player <= 1) && _canDo) then {
//        if (s_player_toggle < 0) then {
//              s_player_toggle = player addaction[("<t color=""#0096ff"">" + ("Toggle Debug") +"</t>"),"scripts\monitor.sqf","",5,false,true,"",""];
//        };
//} else {
//                player removeAction s_player_toggle;
//                s_player_toggle = -1;
//};

//Grab Flare
if (_canPickLight and !dayz_hasLight) then {
	if (s_player_grabflare < 0) then {
		_text = getText (configFile >> "CfgAmmo" >> (typeOf _nearLight) >> "displayName");
		s_player_grabflare = player addAction [format[localize "str_actions_medical_15",_text], "\z\addons\dayz_code\actions\flare_pickup.sqf",_nearLight, 1, false, true, "", ""];
		s_player_removeflare = player addAction [format[localize "str_actions_medical_17",_text], "\z\addons\dayz_code\actions\flare_remove.sqf",_nearLight, 1, false, true, "", ""];
	};
} else {
	player removeAction s_player_grabflare;
	player removeAction s_player_removeflare;
	s_player_grabflare = -1;
	s_player_removeflare = -1;
};

if (!isNull cursorTarget and !_inVehicle and (player distance cursorTarget < 4)) then { //Has some kind of target
	_isHarvested = cursorTarget getVariable["meatHarvested",false];
	_isVehicle = cursorTarget isKindOf "AllVehicles";
	_isVehicletype = typeOf cursorTarget in ["ATV_US_EP1","ATV_CZ_EP1"];
	_isMan = cursorTarget isKindOf "Man";
	_ownerID = cursorTarget getVariable ["characterID","0"];
	_isAnimal = cursorTarget isKindOf "Animal";
	_isDog = (cursorTarget isKindOf "DZ_Pastor" || cursorTarget isKindOf "DZ_Fin");
	_isZombie = cursorTarget isKindOf "zZombie_base";
	_isDestructable = cursorTarget isKindOf "BuiltItems";
	_isTent = cursorTarget isKindOf "TentStorage";
	_isStash = cursorTarget isKindOf "StashSmall";
	_isMediumStash = cursorTarget isKindOf "StashMedium";
	_isFuel = false;
	_hasFuel20 = "ItemJerrycan" in magazines player;
	_hasFuel5 = "ItemFuelcan" in magazines player;
	_isAlive = alive cursorTarget;
	_canmove = canmove cursorTarget;
	_text = getText (configFile >> "CfgVehicles" >> typeOf cursorTarget >> "displayName");

	_rawmeat = meatraw;
	_hasRawMeat = false;
		{
			if (_x in magazines player) then {
				_hasRawMeat = true;
			};
		} forEach _rawmeat;


	if (_hasFuelE20 or _hasFuelE5) then {
		_isFuel = (cursorTarget isKindOf "Land_Ind_TankSmall") or (cursorTarget isKindOf "Land_fuel_tank_big") or (cursorTarget isKindOf "Land_fuel_tank_stairs") or (cursorTarget isKindOf "Land_wagon_tanker");
	};
	//diag_log ("OWNERID = " + _ownerID + " CHARID = " + dayz_characterID + " " + str(_ownerID == dayz_characterID));

	//Allow player to delete objects
	if(_isDestructable and _hasToolbox and _canDo) then {
		if (s_player_deleteBuild < 0) then {
			s_player_deleteBuild = player addAction [format[localize "str_actions_delete",_text], "\z\addons\dayz_code\actions\remove.sqf",cursorTarget, 1, true, true, "", ""];
		};
	} else {
		player removeAction s_player_deleteBuild;
		s_player_deleteBuild = -1;
	};

	//Allow player to force save
	if((_isVehicle or _isTent or _isStash or _isMediumStash) and _canDo and !_isMan and (damage cursorTarget < 1)) then {
		if (s_player_forceSave < 0) then {
			s_player_forceSave = player addAction [format[localize "str_actions_save",_text], "\z\addons\dayz_code\actions\forcesave.sqf",cursorTarget, 1, true, true, "", ""];
		};
	} else {
		player removeAction s_player_forceSave;
		s_player_forceSave = -1;
	};

	//flip vehicle
	if ((_isVehicletype) and !_canmove and _isAlive and (player distance cursorTarget >= 2) and (count (crew cursorTarget))== 0 and ((vectorUp cursorTarget) select 2) < 0.5) then {
		if (s_player_flipveh < 0) then {
			s_player_flipveh = player addAction [format[localize "str_actions_flipveh",_text], "\z\addons\dayz_code\actions\player_flipvehicle.sqf",cursorTarget, 1, true, true, "", ""];
		};
	} else {
		player removeAction s_player_flipveh;
		s_player_flipveh = -1;
	};
//Gut Human
player removeAction s_player_butcher_human;
s_player_butcher_human = -1;
	//Allow player to fill Fuel can
	if((_hasFuelE20 or _hasFuelE5) and _isFuel and _canDo and !a_player_jerryfilling) then {
		if (s_player_fillfuel < 0) then {
			s_player_fillfuel = player addAction [localize "str_actions_self_10", "\z\addons\dayz_code\actions\jerry_fill.sqf",[], 1, false, true, "", ""];
		};
	} else {
		player removeAction s_player_fillfuel;
		s_player_fillfuel = -1;
	};

	//Allow player to fill vehilce 20L
	if(_hasFuel20 and _canDo and _isVehicle and (fuel cursorTarget < 1)) then {
		if (s_player_fillfuel20 < 0) then {
			s_player_fillfuel20 = player addAction [format[localize "str_actions_medical_10"+" with 20L",_text], "\z\addons\dayz_code\actions\refuel.sqf",["ItemJerrycan"], 0, true, true, "", "'ItemJerrycan' in magazines player"];
		};
	} else {
		player removeAction s_player_fillfuel20;
		s_player_fillfuel20 = -1;
	};

	//Allow player to fill vehilce 5L
	if(_hasFuel5 and _canDo and _isVehicle and (fuel cursorTarget < 1)) then {
		if (s_player_fillfuel5 < 0) then {
			s_player_fillfuel5 = player addAction [format[localize "str_actions_medical_10"+" with 5L",_text], "\z\addons\dayz_code\actions\refuel.sqf",["ItemFuelcan"], 0, true, true, "", "'ItemFuelcan' in magazines player"];
		};
	} else {
		player removeAction s_player_fillfuel5;
		s_player_fillfuel5 = -1;
	};

	//Harvested
	if (!alive cursorTarget and _isAnimal and _hasKnife and !_isHarvested and _canDo) then {
		if (s_player_butcher < 0) then {
			s_player_butcher = player addAction [localize "str_actions_self_04", "\z\addons\dayz_code\actions\gather_meat.sqf",cursorTarget, 3, true, true, "", ""];
		};
	} else {
		player removeAction s_player_butcher;
		s_player_butcher = -1;
	};

	//Fireplace Actions check
	if (inflamed cursorTarget and _hasRawMeat and _canDo and !a_player_cooking) then {
		if (s_player_cook < 0) then {
			s_player_cook = player addAction [localize "str_actions_self_05", "\z\addons\dayz_code\actions\cook.sqf",cursorTarget, 3, true, true, "", ""];
		};
	} else {
		player removeAction s_player_cook;
		s_player_cook = -1;
	};
	if (inflamed cursorTarget and (_hasbottleitem and _hastinitem) and _canDo and !a_player_boil) then {
		if (s_player_boil < 0) then {
			s_player_boil = player addAction [localize "str_actions_boilwater", "\z\addons\dayz_code\actions\boil.sqf",cursorTarget, 3, true, true, "", ""];
		};
	} else {
		player removeAction s_player_boil;
		s_player_boil = -1;
	};

	if(cursorTarget == dayz_hasFire and _canDo) then {
		if ((s_player_fireout < 0) and !(inflamed cursorTarget) and (player distance cursorTarget < 3)) then {
			s_player_fireout = player addAction [localize "str_actions_self_06", "\z\addons\dayz_code\actions\fire_pack.sqf",cursorTarget, 0, false, true, "",""];
		};
	} else {
		player removeAction s_player_fireout;
		s_player_fireout = -1;
	};

	//Packing my tent
	if(cursorTarget isKindOf "TentStorage" and _canDo and _ownerID == dayz_characterID) then {
		if ((s_player_packtent < 0) and (player distance cursorTarget < 3)) then {
			s_player_packtent = player addAction [localize "str_actions_self_07", "\z\addons\dayz_code\actions\tent_pack.sqf",cursorTarget, 0, false, true, "",""];
		};
	} else {
		player removeAction s_player_packtent;
		s_player_packtent = -1;
		};

	//Sleep
	if(cursorTarget isKindOf "TentStorage" and _canDo and _ownerID == dayz_characterID) then {
		if ((s_player_sleep < 0) and (player distance cursorTarget < 3)) then {
			s_player_sleep = player addAction [localize "str_actions_self_sleep", "\z\addons\dayz_code\actions\player_sleep.sqf",cursorTarget, 0, false, true, "",""];
		};
	} else {
		player removeAction s_player_sleep;
		s_player_sleep = -1;
	};

// Remove Parts from Vehicles - By SilverShot.
if( !_isMan and _canDo and _hasToolbox and (silver_myCursorTarget != cursorTarget) and cursorTarget isKindOf "AllVehicles" and (getDammage cursorTarget < 0.95) ) then {
_vehicle = cursorTarget;
_invalidVehicle = (_vehicle isKindOf "Motorcycle") or (_vehicle isKindOf "Tractor"); //or (_vehicle isKindOf "ATV_US_EP1") or (_vehicle isKindOf "ATV_CZ_EP1");
if( !_invalidVehicle ) then {
{silver_myCursorTarget removeAction _x} forEach s_player_removeActions;
s_player_removeActions = [];
silver_myCursorTarget = _vehicle;
 
_hitpoints = _vehicle call vehicle_getHitpoints;
 
{
_damage = [_vehicle,_x] call object_getHit;
 
if( _damage < 0.15 ) then {
 
//change "HitPart" to " - Part" rather than complicated string replace
_cmpt = toArray (_x);
_cmpt set [0,20];
_cmpt set [1,toArray ("-") select 0];
_cmpt set [2,20];
_cmpt = toString _cmpt;
 
_skip = true;
if( _skip and _x == "HitFuel" ) then { _skip = false; _part = "PartFueltank"; _cmpt = _cmpt + "tank"};
if( _skip and _x == "HitEngine" ) then { _skip = false; _part = "PartEngine"; };
if( _skip and _x == "HitLFWheel" ) then { _skip = false; _part = "PartWheel"; };
if( _skip and _x == "HitRFWheel" ) then { _skip = false; _part = "PartWheel"; };
if( _skip and _x == "HitLBWheel" ) then { _skip = false; _part = "PartWheel"; };
if( _skip and _x == "HitRBWheel" ) then { _skip = false; _part = "PartWheel"; };
if( _skip and _x == "HitGlass1" ) then { _skip = false; _part = "PartGlass"; };
if( _skip and _x == "HitGlass2" ) then { _skip = false; _part = "PartGlass"; };
if( _skip and _x == "HitGlass3" ) then { _skip = false; _part = "PartGlass"; };
if( _skip and _x == "HitGlass4" ) then { _skip = false; _part = "PartGlass"; };
if( _skip and _x == "HitGlass5" ) then { _skip = false; _part = "PartGlass"; };
if( _skip and _x == "HitGlass6" ) then { _skip = false; _part = "PartGlass"; };
if( _skip and _x == "HitHRotor" ) then { _skip = false; _part = "PartVRotor"; };
 
if (!_skip ) then {
_string = format["<t color='#0096ff'>Remove%1</t>",_cmpt,_color]; //Remove - Part
_handle = silver_myCursorTarget addAction [_string, "scripts\ss_remove.sqf",[_vehicle,_part,_x], 0, false, true, "",""];
s_player_removeActions set [count s_player_removeActions,_handle];
};
};
 
} forEach _hitpoints;
};
};
	
	//Repairing Vehicles
	if ((dayz_myCursorTarget != cursorTarget) and _isVehicle and !_isMan and _hasToolbox and (damage cursorTarget < 1)) then {
		_vehicle = cursorTarget;
		{dayz_myCursorTarget removeAction _x} forEach s_player_repairActions;s_player_repairActions = [];
		dayz_myCursorTarget = _vehicle;

		_allFixed = true;
		_hitpoints = _vehicle call vehicle_getHitpoints;

		{
			_damage = [_vehicle,_x] call object_getHit;

			_cmpt = toArray (_x);
			_cmpt set [0,20];
			_cmpt set [1,toArray ("-") select 0];
			_cmpt set [2,20];
			_cmpt = toString _cmpt;

			_configVeh = configFile >> "cfgVehicles" >> "RepairParts" >> _x;
			_part = getText(_configVeh >> "part");
			if (isnil ("_part")) then { _part = "PartGeneric"; };

			// get every damaged part no matter how tiny damage is!
			_damagePercent = round((1 - _damage) * 100);
			if (_damage > 0) then {
				_allFixed = false;
				_color = "color='#ffff00'"; //yellow
				if (_damage >= 0.5) then {_color = "color='#ff8800'";}; //orange
				if (_damage >= 0.9) then {_color = "color='#ff0000'";}; //red
				_cmpt = format[localize "str_actions_medical_09_status",_cmpt,_damagePercent];

				_string = format[localize "str_actions_medical_09",_cmpt,_color]; //Repair - Part
				_handle = dayz_myCursorTarget addAction [_string, "\z\addons\dayz_code\actions\repair.sqf",[_vehicle,_part,_x], 0, false, true, "",""];
				s_player_repairActions set [count s_player_repairActions,_handle];
			};

		} forEach _hitpoints;
		if (_allFixed) then {
			_vehicle setDamage 0;
		};
	};
	
	    //####    Gut fools ####
    if (!_isAlive and !_isZombie and !_isAnimal and !_isHarvested and _isMan and _hasKnife and _canDo) then {
        if (s_player_butcher_human < 0) then {
            s_player_butcher_human = player addAction [format["<t color='#42426F'>Gut Human%1</t>"], "scripts\gather_meat_human.sqf",cursorTarget, 3, true, true, "", ""];
        };
    } else {
        player removeAction s_player_butcher_human;
        s_player_butcher_human = -1;
    };
 
    //##############################
	/*
	if (_isMan and !_isAlive) then {
		if (s_player_dragbody < 0) then {
			s_player_dragbody = player addAction [localize "str_action_studybody", "\z\addons\dayz_code\actions\drag_body.sqf",cursorTarget, 0, false, true, "",""];
		};
		} else {
		player removeAction s_player_dragbody;
		s_player_dragbody = -1;
	};
	*/
	if (_isMan and !_isAlive and !_isZombie) then {
		if (s_player_studybody < 0) then {
//			s_player_studybody = player addAction [localize "str_action_studybody", "\z\addons\dayz_code\actions\study_body.sqf",cursorTarget, 0, false, true, "",""];
			s_player_studybody = player addAction [localize "str_action_studybody", "scripts\study_body.sqf",cursorTarget, 0, false, true, "",""];
		};
	} else {
		player removeAction s_player_studybody;
		s_player_studybody = -1;
	};
/*
	//Dog
	if (_isDog and _isAlive and (_hasRawMeat) and _canDo and _ownerID == "0" and player getVariable ["dogID", 0] == 0) then {
		if (s_player_tamedog < 0) then {
			s_player_tamedog = player addAction [localize "str_actions_tamedog", "\z\addons\dayz_code\actions\tame_dog.sqf", cursorTarget, 1, false, true, "", ""];
		};
	} else {
		player removeAction s_player_tamedog;
		s_player_tamedog = -1;
	};

	if (_isDog and _ownerID == dayz_characterID and _isAlive and _canDo) then {
		_dogHandle = player getVariable ["dogID", 0];
		if (s_player_feeddog < 0 and _hasRawMeat) then {
			s_player_feeddog = player addAction [localize "str_actions_feeddog","\z\addons\dayz_code\actions\dog\feed.sqf",[_dogHandle,0], 0, false, true,"",""];
		};
		if (s_player_waterdog < 0 and "ItemWaterbottle" in magazines player) then {
			s_player_waterdog = player addAction [localize "str_actions_waterdog","\z\addons\dayz_code\actions\dog\feed.sqf",[_dogHandle,1], 0, false, true,"",""];
		};
		if (s_player_staydog < 0) then {
			_lieDown = _dogHandle getFSMVariable "_actionLieDown";
			if (_lieDown) then { _text = "str_actions_liedog"; } else { _text = "str_actions_sitdog"; };
			s_player_staydog = player addAction [localize _text,"\z\addons\dayz_code\actions\dog\stay.sqf", _dogHandle, 5, false, true,"",""];
		};
		if (s_player_trackdog < 0) then {
			s_player_trackdog = player addAction [localize "str_actions_trackdog","\z\addons\dayz_code\actions\dog\track.sqf", _dogHandle, 4, false, true,"",""];
		};
		if (s_player_barkdog < 0) then {
			s_player_barkdog = player addAction [localize "str_actions_barkdog","\z\addons\dayz_code\actions\dog\speak.sqf", cursorTarget, 3, false, true,"",""];
		};
		if (s_player_warndog < 0) then {
			_warn = _dogHandle getFSMVariable "_watchDog";
			if (_warn) then { _text = "Quiet"; _warn = false; } else { _text = "Alert"; _warn = true; };
			s_player_warndog = player addAction [format[localize "str_actions_warndog",_text],"\z\addons\dayz_code\actions\dog\warn.sqf",[_dogHandle, _warn], 2, false, true,"",""];
		};
		if (s_player_followdog < 0) then {
			s_player_followdog = player addAction [localize "str_actions_followdog","\z\addons\dayz_code\actions\dog\follow.sqf",[_dogHandle,true], 6, false, true,"",""];
		};
	} else {
		player removeAction s_player_feeddog;
		s_player_feeddog = -1;
		player removeAction s_player_waterdog;
		s_player_waterdog = -1;
		player removeAction s_player_staydog;
		s_player_staydog = -1;
		player removeAction s_player_trackdog;
		s_player_trackdog = -1;
		player removeAction s_player_barkdog;
		s_player_barkdog = -1;
		player removeAction s_player_warndog;
		s_player_warndog = -1;
		player removeAction s_player_followdog;
		s_player_followdog = -1;
	};
	*/
} else {

//Extras
//Remove Parts
{silver_myCursorTarget removeAction _x} forEach s_player_removeActions;s_player_removeActions = [];
silver_myCursorTarget = objNull;
	//Engineering
	{dayz_myCursorTarget removeAction _x} forEach s_player_repairActions;s_player_repairActions = [];
	dayz_myCursorTarget = objNull;
	//Others
    player removeAction s_player_dance;
    s_player_dance = -1;
	player removeAction s_player_forceSave;
	s_player_forceSave = -1;
	player removeAction s_player_flipveh;
	s_player_flipveh = -1;
	player removeAction s_player_sleep;
	s_player_sleep = -1;
	player removeAction s_player_deleteBuild;
	s_player_deleteBuild = -1;
	player removeAction s_player_butcher;
	s_player_butcher = -1;
	player removeAction s_player_cook;
	s_player_cook = -1;
	player removeAction s_player_boil;
	s_player_boil = -1;
	player removeAction s_player_fireout;
	s_player_fireout = -1;
	player removeAction s_player_packtent;
	s_player_packtent = -1;
	player removeAction s_player_fillfuel;
	s_player_fillfuel = -1;
	player removeAction s_player_studybody;
	s_player_studybody = -1;
	/*
	//Drag Body
	player removeAction s_player_dragbody;
	s_player_dragbody = -1;
	*/
	//fuel
	player removeAction s_player_fillfuel20;
	s_player_fillfuel20 = -1;
	player removeAction s_player_fillfuel5;
	s_player_fillfuel5 = -1;

	//Dog
	//player removeAction s_player_tamedog;
	//s_player_tamedog = -1;
	player removeAction s_player_feeddog;
	s_player_feeddog = -1;
	player removeAction s_player_waterdog;
	s_player_waterdog = -1;
	player removeAction s_player_staydog;
	s_player_staydog = -1;
	player removeAction s_player_trackdog;
	s_player_trackdog = -1;
	player removeAction s_player_barkdog;
	s_player_barkdog = -1;
	player removeAction s_player_warndog;
	s_player_warndog = -1;
	player removeAction s_player_followdog;
	s_player_followdog = -1;
};

// ZOMBIE SHIELD START
if (("TrashTinCan" in magazines player) && ("TrashJackDaniels" in magazines player) && ("PartEngine" in magazines player) && ("ItemJerrycan" in magazines player) && ("ItemToolbox" in items player)) then {
    hasShield = true;
} else {
    hasShield = false;
};
if (hasShield) then {
    if (zombieShield < 0) then {
    zombieShield = player addAction [("<t color=""#00c362"">" + ("Anti-Zombie Freq Emitter") +"</t>"),"scripts\zombieshield.sqf","",5,false,true,"",""];
    };
} else {
    player removeAction zombieShield;
    zombieShield = -1;
};
// ZOMBIE SHIELD END

// MAKE A BAT START
if (("PartWoodPile" in magazines player) && ("ItemKnife" in items player)) then {
    hasBatParts = true;
} else {
    hasBatParts = false;
};
if (hasBatParts) then {
    if (makeBat < 0) then {
    makeBat = player addAction [("<t color=""#0096ff"">" + ("Craft Baseball Bat") +"</t>"),"scripts\makebat.sqf","",5,false,true,"",""];
    };
} else {
    player removeAction makeBat;
    makeBat = -1;
};
// MAKE A BAT END

// MAKE ARROW START
if (("PartWoodPile" in magazines player) && ("ItemKnife" in items player)) then {
    hasArrowParts = true;
} else {
    hasArrowParts = false;
};
if (hasArrowParts) then {
    if (makeArrows < 0) then {
    makeArrows = player addAction [("<t color=""#0096ff"">" + ("Craft an Arrow") +"</t>"),"scripts\makearrow.sqf","",5,false,true,"",""];
    };
} else {
    player removeAction makeArrows;
    makeArrows = -1;
};
// MAKE ARROW END

// MAKE CROSSBOW START
if (("TrashTinCan" in magazines player) && ("ItemWire" in magazines player) && ("PartGeneric" in magazines player) && ("ItemKnife" in items player) && ("ItemToolbox" in items player)) then {
    hasBowparts = true;
} else {
    hasBowparts = false;
};
if (hasBowparts) then {
    if (makeBow < 0) then {
    makeBow = player addAction [("<t color=""#0096ff"">" + ("Construct Crossbow") +"</t>"),"scripts\makebow.sqf","",5,false,true,"",""];
    };
} else {
    player removeAction makeBow;
    makeBow = -1;
};
// MAKE CROSSBOW END

// CLEAR BRUSH START
if (("MeleeHatchet" in weapons player)) then {
    hasbrushclear = true;
} else {
    hasbrushclear = false;
};
if (hasbrushclear) then {
    if (clearBrush < 0) then {
    clearBrush = player addAction [("<t color=""#00c362"">" + ("Clear Brush") +"</t>"),"scripts\clearbrush.sqf","",5,false,true,"",""];
    };
} else {
    player removeAction clearBrush;
    clearBrush = -1;
};
// CLEAR BRUSH END

// USP SILENCER ADD START
 
private ["_pistol"];
_pistol = currentWeapon player;
if ((_pistol in ["RH_usp"]) && (player ammo _pistol == 0)) then {
    hasUSP = true;
} else {
    hasUSP = false;
};
if (player ammo _pistol == 0) then {
    weaponSafe = true;
} else {
    weaponSafe = false;
};
if((speed player <= 1) && hasUSP && weaponSafe && _canDo) then {
    if (addSil < 0) then {
        addSil = player addAction [("<t color=""#0096ff"">" + ("Add Silencer") +"</t>"),"scripts\uspaddsil.sqf",_pistol,0,false,true,"", ""];
    };
} else {
    player removeAction addSil;
    addSil = -1;
};

// USP REMOVE SILENCER START
 
private ["_pistol"];
_rifle = currentWeapon player;
if ((_pistol in ["RH_uspsd"]) && (player ammo _pistol == 0)) then {
    hasUSP = true;
} else {
    hasUSP = false;
};
if (player ammo _pistol == 0) then {
    weaponSafe = true;
} else {
    weaponSafe = false;
};
if((speed player <= 1) && hasUSP && weaponSafe && _canDo) then {
    if (remUSPsil < 0) then {
        remUSPsil = player addAction [("<t color=""#0096ff"">" + ("Remove Silencer") +"</t>"),"scripts\uspremsil.sqf",_pistol,0,false,true,"", ""];
    };
} else {
    player removeAction remUSPsil;
    remUSPsil = -1;
};
 
// USP REMOVE SILENCER END

// M9 SILENCER ADD START
 
private ["_pistol"];
_pistol = currentWeapon player;
if ((_pistol in ["M9"]) && (player ammo _pistol == 0)) then {
    hasM9 = true;
} else {
    hasM9 = false;
};
if (player ammo _pistol == 0) then {
    weaponSafe = true;
} else {
    weaponSafe = false;
};
if((speed player <= 1) && hasM9 && weaponSafe && _canDo) then {
    if (addM9sil < 0) then {
        addM9sil = player addAction [("<t color=""#0096ff"">" + ("Add Silencer") +"</t>"),"scripts\m9addsil.sqf",_pistol,0,false,true,"", ""];
    };
} else {
    player removeAction addM9sil;
    addM9sil = -1;
};

// M9 SILENCER ADD END

// M9 SILENCER REMOVE START
 
private ["_pistol"];
_rifle = currentWeapon player;
if ((_pistol in ["M9SD"]) && (player ammo _pistol == 0)) then {
    hasM9SD = true;
} else {
    hasM9SD = false;
};
if (player ammo _pistol == 0) then {
    weaponSafe = true;
} else {
    weaponSafe = false;
};
if((speed player <= 1) && hasM9SD && weaponSafe && _canDo) then {
    if (remM9sil < 0) then {
        remM9sil = player addAction [("<t color=""#0096ff"">" + ("Remove Silencer") +"</t>"),"scripts\m9remsil.sqf",_pistol,0,false,true,"", ""];
    };
} else {
    player removeAction remM9sil;
    remM9sil = -1;
};
 
// M9 SILENCER REMOVE END

// RH MAK SILENCER ADD START
 
private ["_pistol"];
_pistol = currentWeapon player;
if ((_pistol in ["RH_pm"]) && (player ammo _pistol == 0)) then {
    haspm = true;
} else {
    haspm = false;
};
if (player ammo _pistol == 0) then {
    weaponSafe = true;
} else {
    weaponSafe = false;
};
if((speed player <= 1) && haspm && weaponSafe && _canDo) then {
    if (addPMsil < 0) then {
        addPMsil = player addAction [("<t color=""#0096ff"">" + ("Add Silencer") +"</t>"),"scripts\pmaddsil.sqf",_pistol,0,false,true,"", ""];
    };
} else {
    player removeAction addPMsil;
    addPMsil = -1;
};

// RH MAK SILENCER ADD END

// RH MAK SILENCER REMOVE START
 
private ["_pistol"];
_rifle = currentWeapon player;
if ((_pistol in ["RH_pmsd"]) && (player ammo _pistol == 0)) then {
    haspmsd = true;
} else {
    haspmsd = false;
};
if (player ammo _pistol == 0) then {
    weaponSafe = true;
} else {
    weaponSafe = false;
};
if((speed player <= 1) && haspmsd && weaponSafe && _canDo) then {
    if (rempmsil < 0) then {
        rempmsil = player addAction [("<t color=""#0096ff"">" + ("Remove Silencer") +"</t>"),"scripts\pmremsil.sqf",_pistol,0,false,true,"", ""];
    };
} else {
    player removeAction rempmsil;
    rempmsil = -1;
};
 
// RH MAK SILENCER REMOVE END

// AS50 TWS ADD START
 
private ["_rifle"];
_rifle = currentWeapon player;
if ((_rifle in ["BAF_AS50_scoped"]) && (player ammo _rifle == 0)) then {
    hasas50 = true;
} else {
    hasas50 = false;
};
if (player ammo _rifle == 0) then {
    weaponSafe = true;
} else {
    weaponSafe = false;
};
if((speed player <= 1) && hasas50 && weaponSafe && _canDo) then {
    if (addTWS < 0) then {
        addTWS = player addAction [("<t color=""#0096ff"">" + ("Add Thermal Weapon Scope") +"</t>"),"scripts\AddTWS.sqf",_rifle,0,false,true,"", ""];
    };
} else {
    player removeAction addTWS;
    addTWS = -1;
};

// AS50 TWS ADD END

// AS50 TWS REMOVE START
 
private ["_rifle"];
_rifle = currentWeapon player;
if ((_rifle in ["BAF_AS50_TWS"]) && (player ammo _rifle == 0)) then {
    hasTWS = true;
} else {
    hasTWS = false;
};
if (player ammo _rifle == 0) then {
    weaponSafe = true;
} else {
    weaponSafe = false;
};
if((speed player <= 1) && hasTWS && weaponSafe && _canDo) then {
    if (remTWS < 0) then {
        remTWS = player addAction [("<t color=""#0096ff"">" + ("Remove Thermal Weapon Scope") +"</t>"),"scripts\RemTWS.sqf",_rifle,0,false,true,"", ""];
    };
} else {
    player removeAction remTWS;
    remTWS = -1;
};
 
// AS50 TWS REMOVE END

// CLEAR BRUSH MACHETE START
if (("MeleeMachete" in weapons player)) then {
    hasbrushclear = true;
} else {
    hasbrushclear = false;
};
if (hasbrushclear) then {
    if (clearBrushMachete < 0) then {
    clearBrushMachete = player addAction [("<t color=""#00c362"">" + ("Clear Brush") +"</t>"),"scripts\clearbrush.sqf","",5,false,true,"",""];
    };
} else {
    player removeAction clearBrushMachete;
    clearBrushMachete = -1;
};
// CLEAR BRUSH MACHETE END

// MAKE SHOTGUN START
if (("TrashTinCan" in magazines player) && ("PartWoodPile" in magazines player) && ("PartGeneric" in magazines player) && ("ItemKnife" in items player) && ("ItemToolbox" in items player)) then {
    hasGunparts = true;
} else {
    hasGunparts = false;
};
if (hasGunparts) then {
    if (makeGun < 0) then {
    makeGun = player addAction [("<t color=""#0096ff"">" + ("Construct Shotgun") +"</t>"),"scripts\makeshotgun.sqf","",5,false,true,"",""];
    };
} else {
    player removeAction makeGun;
    makeGun = -1;
};
// MAKE SHOTGUN END

// BREAK SHOTGUN START
 
private ["_shot"];
_shot = currentWeapon player;
if ((_shot in ["MR43"]) && (player ammo _shot == 0)) then {
    hasGun = true;
} else {
    hasGun = false;
};
if (player ammo _shot == 0) then {
    weaponSafe = true;
} else {
    weaponSafe = false;
};
if((speed player <= 1) && hasGun && weaponSafe && _canDo) then {
    if (breakGun < 0) then {
        breakGun = player addAction [("<t color=""#0096ff"">" + ("Deconstruct Shotgun") +"</t>"),"scripts\breakshotgun.sqf",_shot,0,false,true,"", ""];
    };
} else {
    player removeAction breakGun;
    breakGun = -1;
};

// BREAK SHOTGUN END	

// BREAK BOW START
private ["_bow"];
_bow = currentWeapon player;
if ((_bow in ["Crossbow_DZ"]) && (player ammo _bow == 0)) then {
    hasBow = true;
} else {
    hasBow = false;
};
if (player ammo _bow == 0) then {
    weaponSafe = true;
} else {
    weaponSafe = false;
};
if((speed player <= 1) && hasBow && weaponSafe && _canDo) then {
    if (breakBow < 0) then {
        breakBow = player addAction [("<t color=""#0096ff"">" + ("Deconstruct Crossbow") +"</t>"),"scripts\breakbow.sqf",_bow,0,false,true,"", ""];
    };
} else {
    player removeAction breakBow;
    breakBow = -1;
};
// BREAK BOW END

// MAKE A KNIFE START
private ["_knife"];
_knife = currentWeapon player;
if ((_knife in ["TrashTinCan"]) && (player ammo _knife == 2)) then {
    hasKnifeParts = true;
} else {
    hasKnifeParts = false;
};
if (player ammo _knife == 2) then {
    weaponSafe = true;
} else {
    weaponSafe = false;
};
if((speed player <= 1) && hasKnifeParts && weaponSafe && _canDo) then {
    if (makeKnife < 0) then {
        makeKnife = player addAction [("<t color=""#0096ff"">" + ("Craft Hunting Knife") +"</t>"),"scripts\makeKnife.sqf",_knife,0,false,true,"", ""];
    };
} else {
    player removeAction makeKnife;
    makeKnife = -1;
};
// MAKE A KNIFE END

// MAKE A BOMB START
if (("TrashTinCan" in magazines player) && ("1Rnd_HE_M203" in magazines player) && ("ItemSandbag" in magazines player) && ("ItemToolbox" in items player)) then {
    hasBombParts = true;
} else {
    hasBombParts = false;
};
if (hasBombParts) then {
    if (makeBomb < 0) then {
    makeBomb = player addAction [("<t color=""#00c362"">" + ("Create Satchel Charge") +"</t>"),"scripts\pipebomb.sqf","",5,false,true,"",""];
    };
} else {
    player removeAction makeBomb;
    makeBomb = -1;
};
// MAKE A BOMB END

// GOSHAWK ADD START
 
private ["_rifle"];
_rifle = currentWeapon player;
if ((_rifle in ["AKS_74"]) && (player ammo _rifle == 0)) then {
    hasAK = true;
} else {
    hasAK = false;
};
if (player ammo _rifle == 0) then {
    weaponSafe = true;
} else {
    weaponSafe = false;
};
if((speed player <= 1) && hasAK && weaponSafe && _canDo) then {
    if (addGO < 0) then {
        addGO = player addAction [("<t color=""#0096ff"">" + ("Add GOSHAWK") +"</t>"),"scripts\Addgoshawk.sqf",_rifle,0,false,true,"", ""];
    };
} else {
    player removeAction addGO;
    addGO = -1;
};

// GOSHAWK ADD END

// GOSHAWK REMOVE START
 
private ["_rifle"];
_rifle = currentWeapon player;
if ((_rifle in ["AKS_74_GOSHAWK"]) && (player ammo _rifle == 0)) then {
    hasGO = true;
} else {
    hasGO = false;
};
if (player ammo _rifle == 0) then {
    weaponSafe = true;
} else {
    weaponSafe = false;
};
if((speed player <= 1) && hasGO && weaponSafe && _canDo) then {
    if (remGO < 0) then {
        remGO = player addAction [("<t color=""#0096ff"">" + ("Remove GOSHAWK") +"</t>"),"scripts\Remgoshawk.sqf",_rifle,0,false,true,"", ""];
    };
} else {
    player removeAction remGO;
    remGO = -1;
};
 
// GOSHAWK REMOVE END

// FN ADD START
 
private ["_rifle"];
_rifle = currentWeapon player;
if ((_rifle in ["FN_FAL"]) && (player ammo _rifle == 0)) then {
    hasRifle = true;
} else {
    hasRifle = false;
};
if (player ammo _rifle == 0) then {
    weaponSafe = true;
} else {
    weaponSafe = false;
};
if((speed player <= 1) && hasRifle && weaponSafe && _canDo) then {
    if (addNV < 0) then {
        addNV = player addAction [("<t color=""#0096ff"">" + ("Add Night Vision Scope") +"</t>"),"scripts\AddFN.sqf",_rifle,0,false,true,"", ""];
    };
} else {
    player removeAction addNV;
    addNV = -1;
};
 
// FN ADD END

// FN REMOVE START
 
private ["_rifle"];
_rifle = currentWeapon player;
if ((_rifle in ["FN_FAL_ANPVS4"]) && (player ammo _rifle == 0)) then {
    hasRifle = true;
} else {
    hasRifle = false;
};
if (player ammo _rifle == 0) then {
    weaponSafe = true;
} else {
    weaponSafe = false;
};
if((speed player <= 1) && hasRifle && weaponSafe && _canDo) then {
    if (RemNV < 0) then {
        RemNV = player addAction [("<t color=""#0096ff"">" + ("Remove Night Vision Scope") +"</t>"),"scripts\RemFN.sqf",_rifle,0,false,true,"", ""];
    };
} else {
    player removeAction RemNV;
    RemNV = -1;
};
 
// FN REMOVE END


// ---------------------------------------SUICIDE START------------------------------------
 
private ["_handGun"];
_handGun = currentWeapon player;
if ((_handGun in ["glock17_EP1","M9","M9SD","Makarov","RH_bull","RH_uspm","RH_m9","RH_m9c","RH_m93r","RH_m9sd","RH_m9csd","RH_browninghp","RH_Deagleg","RH_Deaglem","RH_Deaglemzb","RH_Deaglemz","RH_Deagles","RH_g17","RH_g17sd","RH_g18","RH_g19","RH_g19t","RH_tec9","RH_m1911sd","RH_muzi","RH_mk22","RH_mk22sd","RH_mk22v","RH_mk22vsd","RH_p38","RH_ppk","RH_mk2","RH_p226","RH_p226s","RH_tt33","RH_aps","RH_apssd","RH_pmsd","RH_mac10p","RH_pp2000p","RH_mp7p","RH_mp5kp","RH_anac","RH_pm","RH_m1911old","RH_Deagles","RH_m1911","RH_m9sd","RH_python","RH_usp","RH_uspsd","RH_anacg","RH_muzi","RH_vz61","MakarovSD","revolver_EP1","UZI_EP1","Sa61_EP1","Colt1911"]) && (player ammo _handGun > 0)) then {
    hasSecondary = true;
} else {
    hasSecondary = false;
};
if (player ammo _handGun == 1) then {
    lastRound = true;
} else {
    lastRound = false;
};
if((speed player <= 1) && hasSecondary && lastRound && _canDo) then {
    if (s_player_suicide < 0) then {
        s_player_suicide = player addaction[("<t color=""#ff0000"">" + ("Join Twilight Sparkle in the magical world of Equestria!") +"</t>"),"scripts\northernwind.sqf",_handGun,0,false,true,"", ""];
    };
} else {
    player removeAction s_player_suicide;
    s_player_suicide = -1;
};
 
// ---------------------------------------SUICIDE END------------------------------------

// Zombie Bait
if (("ItemBloodbag" in magazines player) && ("FoodSteakRaw" in magazines player)) then {
    hasBait = true;
} else {
    hasBait = false;
};
if (hasBait) then {
    if (zombieBait < 0) then {
zombieBait = player addAction [("<t color=""#c30000"">" + ("Place Zombie Bait") +"</t>"),"scripts\zombiebait\zombiebait.sqf","",5,false,true,"",""];
    };
} else {
    player removeAction zombieBait;
    zombieBait = -1;
};
// Exploding Zombie Bait
if ((hasBait) && ("HandGrenade_West" in magazines player)) then {
if (zombieBomb < 0) then {
zombieBomb = player addAction [("<t color=""#c30000"">" + ("Place Exploding Bait") +"</t>"),"scripts\zombiebait\zombiebomb.sqf","",5,false,true,"",""];
};
} else {
player removeAction zombieBomb;
zombieBomb = -1;
};

//CCTV
    if(cursorTarget isKindOf "Notebook" and _canDo) then {
            if (s_player_Laptop < 0) then {
            s_player_Laptop = player addAction ["Activate Laptop Surveillance","cctv\init.sqf",cursorTarget, 0, false, true, "",""];
        };
    } else {
        player removeAction s_player_Laptop;
        s_player_Laptop = -1;
    };
  //End
  
 //------------------- Drink Water --------------------------------
private["_playerPos","_canDrink","_isPond","_isWell","_pondPos","_objectsWell","_objectsPond","_display"];
 
_playerPos = getPosATL player;
_canDrink = count nearestObjects [_playerPos, ["Land_pumpa","Land_water_tank"], 4] > 0;
_isPond = false;
_isWell = false;
_pondPos = [];
_objectsWell = [];
 
if (!_canDrink) then {
    _objectsWell = nearestObjects [_playerPos, [], 4];
    {
        //Check for Well
        _isWell = ["_well",str(_x),false] call fnc_inString;
        if (_isWell) then {_canDrink = true};
    } forEach _objectsWell;
};
 
if (!_canDrink) then {
    _objectsPond = nearestObjects [_playerPos, [], 50];
    {
        //Check for pond
        _isPond = ["pond",str(_x),false] call fnc_inString;
        if (_isPond) then {
            _pondPos = (_x worldToModel _playerPos) select 2;
            if (_pondPos < 0) then {
                _canDrink = true;
            };
        };
    } forEach _objectsPond;
};
 
if (_canDrink) then {
        if (s_player_drinkWater < 0) then {
            s_player_drinkWater = player addaction[("<t color=""#0096ff"">" + ("Drink water") +"</t>"),"scripts\drink_Water.sqf"];
        };
    } else {
        player removeAction s_player_drinkWater;
        s_player_drinkWater = -1;
    };
 
//-------------------------Drink Water End ----------------------------------------------

// LAPTOP ON START
private ["_laptop"];
_laptop = count nearestObjects [_playerPos, ["Notebook"], 4] > 0;

if((speed player <= 1) && _canDo and !_laptop && ("PartGlass" in magazines player) && ("PartGeneric" in magazines player) && ("ItemToolbox" in items player) && ("ItemFlashlight" in items player)) then {
    hasLaptop = true;
} else {
    hasLaptop = false;
};
if (hasLaptop) then {
    if (LaptopON< 0) then {
    LaptopON = player addAction [("<t color=""#0096ff"">" + ("Laptop On") +"</t>"),"scripts\LaptopON.sqf","",5,false,true,"",""];
    };
} else {
    player removeAction LaptopON;
    LaptopON = -1;
};
// LAPTOP ON END

//LAPTOP OFF START
    if(cursorTarget isKindOf "Notebook") then {
            if (LaptopOFF < 0) then {
            LaptopOFF = player addAction ["Power Down Laptop","scripts\laptopOFF.sqf",cursorTarget, 0, false, true, "",""];
        };
    } else {
        player removeAction LaptopOFF;
        LaptopOFF = -1;
    };
//LAPTOP OFF END

// NOTEBOOK ON START
private ["_laptop"];
_laptop = count nearestObjects [_playerPos, ["Notebook"], 4] > 0;

if((speed player <= 1) && _canDo and !_laptop  && ("Kostey_notebook" in items player) && ("ItemFlashlight" in items player)) then {
    hasNotebook = true;
} else {
    hasNotebook = false;
};
if (hasNotebook) then {
    if (NotebookON < 0) then {
    NotebookON = player addAction [("<t color=""#0096ff"">" + ("Notebook On") +"</t>"),"scripts\notebookON.sqf","",5,false,true,"",""];
    };
} else {
    player removeAction NotebookON;
    NotebookON = -1;
};
// NOTEBOOK ON END

//DANCE BEGIN
    if (inflamed cursorTarget and _canDo) then {
            if (s_player_dance < 0) then {
            s_player_dance = player addAction ["Dance!","scripts\dance.sqf",cursorTarget, 0, false, true, "",""];
        };
    } else {
        player removeAction s_player_dance;
        s_player_dance = -1;
    };
//DANCE END	

// AMMO PRESS ON
    if (cursorTarget isKindOf "Land_Ind_Stack_Big" && ("PartGeneric" in magazines player) and (player distance cursorTarget < 8) and _canDo) then {
            if (s_player_pressfn < 0) then {
            s_player_pressfn = player addAction ["Activate Ammo Press (FAL Mags)","scripts\fnmag.sqf",cursorTarget, 5, false, true, "",""];
        };
    } else {
        player removeAction s_player_pressfn;
        s_player_pressfn = -1;
    };
    if (cursorTarget isKindOf "Land_Ind_Stack_Big" && ("PartGeneric" in magazines player) and (player distance cursorTarget < 8) and _canDo) then {
            if (s_player_pressstn < 0) then {
			s_player_pressstn = player addAction ["Activate Ammo Press (STNAG Mags)","scripts\stnagmag.sqf",cursorTarget, 5, false, true, "",""];
        };
    } else {
        player removeAction s_player_pressstn;
        s_player_pressstn = -1;
    };
    if (cursorTarget isKindOf "Land_Ind_Stack_Big" && ("PartGeneric" in magazines player) and (player distance cursorTarget < 8) and _canDo) then {
            if (s_player_pressAKM < 0) then {
			s_player_pressAKM = player addAction ["Activate Ammo Press (AKM Mags)","scripts\AKMMag.sqf",cursorTarget, 5, false, true, "",""];
        };
    } else {
        player removeAction s_player_pressAKM;
        s_player_pressAKM = -1;
    };
    if (cursorTarget isKindOf "Land_Ind_Stack_Big" && ("PartGeneric" in magazines player) and (player distance cursorTarget < 8) and _canDo) then {
            if (s_player_pressAK < 0) then {
			s_player_pressAK = player addAction ["Activate Ammo Press (AK Mags)","scripts\AKMag.sqf",cursorTarget, 5, false, true, "",""];
        };
    } else {
        player removeAction s_player_pressAK;
        s_player_pressAK = -1;
    };
    if (cursorTarget isKindOf "Land_Ind_Stack_Big" && ("PartGeneric" in magazines player) and (player distance cursorTarget < 8) and _canDo) then {
            if (s_player_pressDMR < 0) then {
			s_player_pressDMR = player addAction ["Activate Ammo Press (DMR Mags)","scripts\DMRmag.sqf",cursorTarget, 5, false, true, "",""];
        };
    } else {
        player removeAction s_player_pressDMR;
        s_player_pressDMR = -1;
    };	
// AMMO PRESS OFF	

// RADIO START
if (_canDo && ("ItemRadio" in items player)) then {
    hasRadio = true;
} else {
    hasRadio = false;
};
if (hasRadio) then {
    if (RadioOn < 0) then {
    RadioOn = player addAction [("<t color=""#0096ff"">" + ("Radio On") +"</t>"),"scripts\radio.sqf","",5,false,true,"",""];
    };
} else {
    player removeAction RadioOn;
    RadioOn = -1;
};
// RADIO END