custom_game = _this select 0;
admin_house = _this select 1; 
if (isNil "custom_game") then {custom_game = true;active_game = true;};
if (custom_game) then {active_game = true;};
waitUntil {!isNil ("dayz_animalCheck")};
captinspork = true;
while {custom_game} do 
{

	
_pos = getpos player;
_veh = vehicle player;



TimestartContinue = (timeRestart)-(round(serverTime/60));
if (Timestarted > TimestartContinue) then
{
PlayingTime = Timestarted - TimestartContinue;
_timeplayed = profileNamespace getVariable ["TotalTime",0];
profileNamespace setVariable ["TotalTime",_timeplayed+PlayingTime]; saveProfileNamespace;
_timeplayed = profileNamespace getVariable ["TotalTime",0];
Timestarted = TimestartContinue;
};
//Setvehicle   SetBot

if ((findTime >= TimestartContinue) and (Setvehicle == 1)) then
{
_howLong = _howLong * 2;
Setvehicle = 0;
};

vehicle_spawner =
{
if (Setvehicle == 0) then
{
   _allUnits = allUnits;
	player setVehicleInit "allUnits = [];";
	processInitCommands;
	clearVehicleInit player;
	allUnits = _allUnits;
	
	_dir = getdir player;
	_pos = getpos player;
	_pos = [(_pos select 0)+5*sin(_dir),(_pos select 1)+5*cos(_dir),0]; 
	
	sporkulus = createVehicle [spawnthisshit, _pos, [], 0, "CAN_COLLIDE"];
	sporkulus setVariable ["ObjectUID", "script made by Sporkulus", true];	
	Setvehicle = 1;
};
};

profileNamespace setVariable ["MyVehicle", Setvehicle]; saveProfileNamespace;
profileNamespace setVariable ["MyBot",SetBot]; saveProfileNamespace;

if ((currentMoney >= (v2)) and (currentMoney < (v3)) and (Currentlevel == 1)) then
{
Currentlevel = 2;
profileNamespace setVariable ["level", Currentlevel]; saveProfileNamespace;	
_setlevel = profileNamespace getVariable ["level",0];
Currentlevel = _setlevel;spawnthisshit = "Old_bike_TK_CIV_EP1";call vehicle_spawner;
cutText [format["LEVEL %1 REACHED!", Currentlevel], "WHITE IN"];
playsound "Challenge_Completed";genRewards = true;
};	


if ((currentMoney >= (v3)) and (currentMoney < (v4)) and (Currentlevel == 2)) then
{
Currentlevel = 3;
profileNamespace setVariable ["level", Currentlevel]; saveProfileNamespace;	
_setlevel = profileNamespace getVariable ["level",0];
Currentlevel = _setlevel;spawnthisshit = "Old_bike_TK_CIV_EP1";call vehicle_spawner;
cutText [format["LEVEL %1 REACHED!", Currentlevel], "WHITE IN"];
playsound "Challenge_Completed";if (allow_rewards) then {genRewards = true;};
};



if ((currentMoney >= (v4)) and (currentMoney < (v5)) and (Currentlevel == 3)) then
{
Currentlevel = 4;
profileNamespace setVariable ["level", Currentlevel]; saveProfileNamespace;	
_setlevel = profileNamespace getVariable ["level",0];
Currentlevel = _setlevel;spawnthisshit = "TT650_Civ";call vehicle_spawner;
cutText [format["LEVEL %1 REACHED!", Currentlevel], "WHITE IN"];
playsound "Challenge_Completed";genRewards = true;
};


if ((currentMoney >= (v5)) and (currentMoney < (v6)) and (Currentlevel == 4)) then
{
Currentlevel = 5;
profileNamespace setVariable ["level", Currentlevel]; saveProfileNamespace;	
_setlevel = profileNamespace getVariable ["level",0];
Currentlevel = _setlevel;spawnthisshit = "TT650_Civ";call vehicle_spawner;
cutText [format["LEVEL %1 REACHED!", Currentlevel], "WHITE IN"];
playsound "Challenge_Completed";genRewards = true;
};

if ((currentMoney >= (v6)) and (currentMoney < (v7)) and (Currentlevel == 5)) then
{
Currentlevel = 6;
profileNamespace setVariable ["level", Currentlevel]; saveProfileNamespace;	
_setlevel = profileNamespace getVariable ["level",0];
Currentlevel = _setlevel;spawnthisshit = "ATV_US_EP1";call vehicle_spawner;
cutText [format["LEVEL %1 REACHED!", Currentlevel], "WHITE IN"];
playsound "Challenge_Completed";genRewards = true;
};

if ((currentMoney >= (v7)) and (currentMoney < (v8)) and (Currentlevel == 6)) then
{
Currentlevel = 7;
profileNamespace setVariable ["level", Currentlevel]; saveProfileNamespace;	
_setlevel = profileNamespace getVariable ["level",0];
Currentlevel = _setlevel;spawnthisshit = "ATV_US_EP1";call vehicle_spawner;
cutText [format["LEVEL %1 REACHED!", Currentlevel], "WHITE IN"];
playsound "Challenge_Completed";genRewards = true;
};

if ((currentMoney >= (v8)) and (currentMoney < (v9)) and (Currentlevel == 7)) then
{
Currentlevel = 8;
profileNamespace setVariable ["level", Currentlevel]; saveProfileNamespace;	
_setlevel = profileNamespace getVariable ["level",0];
Currentlevel = _setlevel;spawnthisshit = "tractorOld";call vehicle_spawner;
cutText [format["LEVEL %1 REACHED!", Currentlevel], "WHITE IN"];
playsound "Challenge_Completed";genRewards = true;
};

if ((currentMoney >= (v9)) and (currentMoney < (v10)) and (Currentlevel == 8)) then
{
Currentlevel = 9;
profileNamespace setVariable ["level", Currentlevel]; saveProfileNamespace;	
_setlevel = profileNamespace getVariable ["level",0];
Currentlevel = _setlevel;spawnthisshit = "tractorOld";call vehicle_spawner;
cutText [format["LEVEL %1 REACHED!", Currentlevel], "WHITE IN"];
playsound "Challenge_Completed";genRewards = true;
};

if ((currentMoney >= (v10)) and (currentMoney < (v11)) and (Currentlevel == 9)) then
{
Currentlevel = 10;
profileNamespace setVariable ["level", Currentlevel]; saveProfileNamespace;	
_setlevel = profileNamespace getVariable ["level",0];
Currentlevel = _setlevel;spawnthisshit = "policecar";call vehicle_spawner;
cutText [format["LEVEL %1 REACHED!", Currentlevel], "WHITE IN"];
playsound "Challenge_Completed";genRewards = true;
};

if ((currentMoney >= (v11)) and (currentMoney < (v12)) and (Currentlevel == 10)) then
{
Currentlevel = 11;
profileNamespace setVariable ["level", Currentlevel]; saveProfileNamespace;	
_setlevel = profileNamespace getVariable ["level",0];
Currentlevel = _setlevel;spawnthisshit = "policecar";call vehicle_spawner;
cutText [format["LEVEL %1 REACHED!", Currentlevel], "WHITE IN"];
playsound "Challenge_Completed";genRewards = true;
};

if ((currentMoney >= (v12)) and (currentMoney < (v13)) and (Currentlevel == 11)) then
{
Currentlevel = 12;
profileNamespace setVariable ["level", Currentlevel]; saveProfileNamespace;	
_setlevel = profileNamespace getVariable ["level",0];
Currentlevel = _setlevel;spawnthisshit = "hilux1_civil_3_open";call vehicle_spawner;
cutText [format["LEVEL %1 REACHED!", Currentlevel], "WHITE IN"];
playsound "Challenge_Completed";genRewards = true;
};

if ((currentMoney >= (v13)) and (currentMoney < (v14)) and (Currentlevel == 12)) then
{
Currentlevel = 13;
profileNamespace setVariable ["level", Currentlevel]; saveProfileNamespace;	
_setlevel = profileNamespace getVariable ["level",0];
Currentlevel = _setlevel;spawnthisshit = "hilux1_civil_3_open";call vehicle_spawner;
cutText [format["LEVEL %1 REACHED!", Currentlevel], "WHITE IN"];
playsound "Challenge_Completed";genRewards = true;
};

if ((currentMoney >= (v14)) and (currentMoney < (v15)) and (Currentlevel == 13)) then
{
Currentlevel = 14;
profileNamespace setVariable ["level", Currentlevel]; saveProfileNamespace;	
_setlevel = profileNamespace getVariable ["level",0];
Currentlevel = _setlevel;spawnthisshit = "UAZ_CDF";call vehicle_spawner;
cutText [format["LEVEL %1 REACHED!", Currentlevel], "WHITE IN"];
playsound "Challenge_Completed";genRewards = true;
};

if ((currentMoney >= (v15)) and (currentMoney < (v16)) and (Currentlevel == 14)) then
{
Currentlevel = 15;
profileNamespace setVariable ["level", Currentlevel]; saveProfileNamespace;	
_setlevel = profileNamespace getVariable ["level",0];
Currentlevel = _setlevel;spawnthisshit = "UAZ_CDF";call vehicle_spawner;
cutText [format["LEVEL %1 REACHED!", Currentlevel], "WHITE IN"];
playsound "Challenge_Completed";genRewards = true;
};

if ((currentMoney >= (v16)) and (currentMoney < (v17)) and (Currentlevel == 15)) then
{
Currentlevel = 16;
profileNamespace setVariable ["level", Currentlevel]; saveProfileNamespace;	
_setlevel = profileNamespace getVariable ["level",0];
Currentlevel = _setlevel;spawnthisshit = "UralCivil2";call vehicle_spawner;
cutText [format["LEVEL %1 REACHED!", Currentlevel], "WHITE IN"];
playsound "Challenge_Completed";genRewards = true;
};

if ((currentMoney >= (v17)) and (currentMoney < (v18)) and (Currentlevel == 16)) then
{
Currentlevel = 17;
profileNamespace setVariable ["level", Currentlevel]; saveProfileNamespace;	
_setlevel = profileNamespace getVariable ["level",0];
Currentlevel = _setlevel;spawnthisshit = "UralCivil2";call vehicle_spawner;
cutText [format["LEVEL %1 REACHED!", Currentlevel], "WHITE IN"];
playsound "Challenge_Completed";genRewards = true;
};

if ((currentMoney >= (v18)) and (currentMoney < (v19)) and (Currentlevel == 17)) then
{
Currentlevel = 18;
profileNamespace setVariable ["level", Currentlevel]; saveProfileNamespace;	
_setlevel = profileNamespace getVariable ["level",0];
Currentlevel = _setlevel;spawnthisshit = "V3S_Civ";call vehicle_spawner;
cutText [format["LEVEL %1 REACHED!", Currentlevel], "WHITE IN"];
playsound "Challenge_Completed";genRewards = true;
};

if ((currentMoney >= (v19)) and (currentMoney < (v20)) and (Currentlevel == 18)) then
{
Currentlevel = 19;
profileNamespace setVariable ["level", Currentlevel]; saveProfileNamespace;	
_setlevel = profileNamespace getVariable ["level",0];
Currentlevel = _setlevel;spawnthisshit = "V3S_Civ";call vehicle_spawner;
cutText [format["LEVEL %1 REACHED!", Currentlevel], "WHITE IN"];
playsound "Challenge_Completed";genRewards = true;
};

if ((currentMoney >= (v20)) and (currentMoney < (v21)) and (Currentlevel == 19)) then
{
Currentlevel = 20;
profileNamespace setVariable ["level", Currentlevel]; saveProfileNamespace;	
_setlevel = profileNamespace getVariable ["level",0];
Currentlevel = _setlevel;spawnthisshit = "HMMWV_DZ";call vehicle_spawner;
cutText [format["LEVEL %1 REACHED!", Currentlevel], "WHITE IN"];
playsound "Challenge_Completed";genRewards = true;
};

if ((currentMoney >= (v21)) and (currentMoney < (v22)) and (Currentlevel == 20)) then
{
Currentlevel = 21;
profileNamespace setVariable ["level", Currentlevel]; saveProfileNamespace;	
_setlevel = profileNamespace getVariable ["level",0];
Currentlevel = _setlevel;spawnthisshit = "HMMWV_DZ";call vehicle_spawner;
cutText [format["LEVEL %1 REACHED!", Currentlevel], "WHITE IN"];
playsound "Challenge_Completed";genRewards = true;
};

if ((currentMoney >= (v22)) and (currentMoney < (v23)) and (Currentlevel == 21)) then
{
Currentlevel = 22;
profileNamespace setVariable ["level", Currentlevel]; saveProfileNamespace;	
_setlevel = profileNamespace getVariable ["level",0];
Currentlevel = _setlevel;spawnthisshit = "SUV_DZ";call vehicle_spawner;
cutText [format["LEVEL %1 REACHED!", Currentlevel], "WHITE IN"];
playsound "Challenge_Completed";genRewards = true;
};

if ((currentMoney >= (v23)) and (currentMoney < (v24)) and (Currentlevel == 22)) then
{
Currentlevel = 23;
profileNamespace setVariable ["level", Currentlevel]; saveProfileNamespace;	
_setlevel = profileNamespace getVariable ["level",0];
Currentlevel = _setlevel;spawnthisshit = "SUV_DZ";call vehicle_spawner;
cutText [format["LEVEL %1 REACHED!", Currentlevel], "WHITE IN"];
playsound "Challenge_Completed";genRewards = true;
};

if ((currentMoney >= (v24)) and (currentMoney < (v25)) and (Currentlevel == 23)) then
{
Currentlevel = 24;
profileNamespace setVariable ["level", Currentlevel]; saveProfileNamespace;	
_setlevel = profileNamespace getVariable ["level",0];
Currentlevel = _setlevel;spawnthisshit = "SUV_DZ";call vehicle_spawner;
cutText [format["LEVEL %1 REACHED!", Currentlevel], "WHITE IN"];
playsound "Challenge_Completed";genRewards = true;
};

if ((currentMoney >= (v25)) and (currentMoney < (v26)) and (Currentlevel == 24)) then
{
Currentlevel = 25;
profileNamespace setVariable ["level", Currentlevel]; saveProfileNamespace;	
_setlevel = profileNamespace getVariable ["level",0];
Currentlevel = _setlevel;spawnthisshit = "AH6X_DZ";call vehicle_spawner;
cutText [format["LEVEL %1 REACHED!", Currentlevel], "WHITE IN"];
playsound "Challenge_Completed";genRewards = true;
};

if ((currentMoney >= (v26)) and (currentMoney < (v27)) and (Currentlevel == 25)) then
{
Currentlevel = 26;
profileNamespace setVariable ["level", Currentlevel]; saveProfileNamespace;	
_setlevel = profileNamespace getVariable ["level",0];
Currentlevel = _setlevel;spawnthisshit = "MH6J_DZ";call vehicle_spawner;
cutText [format["LEVEL %1 REACHED!", Currentlevel], "WHITE IN"];
playsound "Challenge_Completed";genRewards = true;
};

if ((currentMoney >= (v27)) and (currentMoney < (v28)) and (Currentlevel == 26)) then
{
Currentlevel = 27;
profileNamespace setVariable ["level", Currentlevel]; saveProfileNamespace;	
_setlevel = profileNamespace getVariable ["level",0];
Currentlevel = _setlevel;spawnthisshit = "MH6J_DZ";call vehicle_spawner;
cutText [format["LEVEL %1 REACHED!", Currentlevel], "WHITE IN"];
playsound "Challenge_Completed";genRewards = true;
};

if ((currentMoney >= (v28)) and (currentMoney < (v29)) and (Currentlevel == 27)) then
{
Currentlevel = 28;
profileNamespace setVariable ["level", Currentlevel]; saveProfileNamespace;	
_setlevel = profileNamespace getVariable ["level",0];
Currentlevel = _setlevel;spawnthisshit = "UH1H_DZ";call vehicle_spawner;
cutText [format["LEVEL %1 REACHED!", Currentlevel], "WHITE IN"];
playsound "Challenge_Completed";genRewards = true;
};

if ((currentMoney >= (v29)) and (currentMoney < (v30)) and (Currentlevel == 28)) then
{
Currentlevel = 29;
profileNamespace setVariable ["level", Currentlevel]; saveProfileNamespace;	
_setlevel = profileNamespace getVariable ["level",0];
Currentlevel = _setlevel;spawnthisshit = "UH1H_DZ";call vehicle_spawner;
cutText [format["LEVEL %1 REACHED!", Currentlevel], "WHITE IN"];
playsound "Challenge_Completed";genRewards = true;
};


if ((currentMoney >= (v30)) and (Currentlevel == 29)) then
{
Currentlevel = 30;
profileNamespace setVariable ["level", Currentlevel]; saveProfileNamespace;	
_setlevel = profileNamespace getVariable ["level",0];
Currentlevel = _setlevel;spawnthisshit = "UH1H_DZ";call vehicle_spawner;
cutText [format["LEVEL %1 REACHED!", Currentlevel], "WHITE IN"];
playsound "Challenge_Completed";genRewards = true;
Sporkhint = format ["%1 reached level %2", name player, Currentlevel];
publicVariable "Sporkhint";
};



if ((Currentlevel == 1) and (genRewards)) then
{
genRewards = true;
if (genRewards) then
{
genRewards = false;
};
Nextlvl = v2;Lastlvl = 0;
Should_EXP = 1;
};

if ((Currentlevel == 2) and (genRewards)) then
{
genRewards = true;
if (genRewards) then
{
call _level_2;
genRewards = false;
};
Should_EXP = 2;
Nextlvl = v3;Lastlvl = 0;
};


if ((Currentlevel == 3) and (genRewards)) then
{
Nextlvl = v4;Lastlvl = v2;
genRewards = true;
if (genRewards) then
{
call _level_3;
genRewards = false;
};
Should_EXP = 3;
};

if ((Currentlevel == 4) and (genRewards)) then
{
Nextlvl = v5;Lastlvl = v3;
genRewards = true;
if (genRewards) then
{
call _level_4;
genRewards = false;
Should_EXP = 4;
};

};

if ((Currentlevel == 5) and (genRewards)) then
{
Nextlvl = v6;Lastlvl = v4;
genRewards = true;
if (genRewards) then
{
call _level_5;
genRewards = false;
};
Should_EXP = 5;
};

if ((Currentlevel == 6) and (genRewards)) then
{
Nextlvl = v7;Lastlvl = v5;
genRewards = true;
if (genRewards) then
{
call _level_6;
genRewards = false;
};
Should_EXP = 6;
};

if ((Currentlevel == 7) and (genRewards)) then
{
Nextlvl = v8;Lastlvl = v6;
genRewards = true;
if (genRewards) then
{
call _level_7;
genRewards = false;
};
Should_EXP = 7;
};

if ((Currentlevel == 8) and (genRewards)) then
{
Nextlvl = v9;Lastlvl = v7;
genRewards = true;
if (genRewards) then
{
call _level_8;
genRewards = false;
};
Should_EXP = 8;
};

if ((Currentlevel == 9) and (genRewards)) then
{
Nextlvl = v10;Lastlvl = v8;
genRewards = true;
if (genRewards) then
{
call _level_9;
genRewards = false;
};
Should_EXP = 9;
};

if ((Currentlevel == 10) and (genRewards)) then
{
Nextlvl = v11;Lastlvl = v9;
genRewards = true;
if (genRewards) then
{
call _level_10;
genRewards = false;
};
Should_EXP = 10;
};

if ((Currentlevel == 11) and (genRewards)) then
{
Nextlvl = v12;Lastlvl = v10;
genRewards = true;
if (genRewards) then
{
call _level_11;
genRewards = false;
};
Should_EXP = 11;
};

if ((Currentlevel == 12) and (genRewards)) then
{
Nextlvl = v13;Lastlvl = v11;
genRewards = true;
if (genRewards) then
{
call _level_12;
genRewards = false;
};
Should_EXP = 12;
};

if ((Currentlevel == 13) and (genRewards)) then
{
Nextlvl = v14;Lastlvl = v12;
genRewards = true;
if (genRewards) then
{
call _level_13;
genRewards = false;
};
Should_EXP = 13;
};

if ((Currentlevel == 14) and (genRewards)) then
{
Nextlvl = v15;Lastlvl = v13;
genRewards = true;
if (genRewards) then
{
call _level_14;
genRewards = false;
};
Should_EXP = 14;
};

if ((Currentlevel == 15) and (genRewards)) then
{
Nextlvl = v16;Lastlvl = v14;
genRewards = true;
if (genRewards) then
{
call _level_15;
genRewards = false;
};
Should_EXP = 15;
};

if ((Currentlevel == 16) and (genRewards)) then
{
Nextlvl = v17;Lastlvl = v15;
genRewards = true;
if (genRewards) then
{
call _level_16;
genRewards = false;
};
Should_EXP = 16;
};

if ((Currentlevel == 17) and (genRewards)) then
{
Nextlvl = v18;Lastlvl = v16;
genRewards = true;
if (genRewards) then
{
call _level_17;
genRewards = false;
};
Should_EXP = 17;
};

if ((Currentlevel == 18) and (genRewards)) then
{
Nextlvl = v19;Lastlvl = v17;
genRewards = true;
if (genRewards) then
{
call _level_18;
genRewards = false;
};
Should_EXP = 18;
};

if ((Currentlevel == 19) and (genRewards)) then
{
Nextlvl = v20;
genRewards = true;
if (genRewards) then
{
call _level_19;
genRewards = false;
};
Should_EXP = 19;
};

if ((Currentlevel == 20) and (genRewards)) then
{
Nextlvl = v21;Lastlvl = v19;
genRewards = true;
if (genRewards) then
{
call _level_20;
genRewards = false;
};
Should_EXP = 20;
};

if ((Currentlevel == 21) and (genRewards)) then
{
Nextlvl = v22;Lastlvl = v20;
genRewards = true;
if (genRewards) then
{
call _level_21;
genRewards = false;
};
Should_EXP = 21;
};

if ((Currentlevel == 22) and (genRewards)) then
{
Nextlvl = v23;Lastlvl = v21;
genRewards = true;
if (genRewards) then
{
call _level_22;
genRewards = false;
};
Should_EXP = 22;
};

if ((Currentlevel == 23) and (genRewards)) then
{
Nextlvl = v24;Lastlvl = v22;
genRewards = true;
if (genRewards) then
{
call _level_23;
genRewards = false;
};
Should_EXP = 23;
};

if ((Currentlevel == 24) and (genRewards)) then
{
Nextlvl = v25;Lastlvl = v23;
genRewards = true;
if (genRewards) then
{
call _level_24;
genRewards = false;
};
Should_EXP = 24;
};

if ((Currentlevel == 25) and (genRewards)) then
{
Nextlvl = v26;Lastlvl = v24;
genRewards = true;
if (genRewards) then
{
call _level_25;
genRewards = false;
};
Should_EXP = 24;
};

if ((Currentlevel == 26) and (genRewards)) then
{
Nextlvl = v27;Lastlvl = v25;

genRewards = true;
if (genRewards) then
{
call _level_26;
genRewards = false;
};
Should_EXP = 24;
};

if ((Currentlevel == 27) and (genRewards)) then
{
Nextlvl = v28;Lastlvl = v26;

genRewards = true;
if (genRewards) then
{
call _level_27;
genRewards = false;
};
Should_EXP = 24;
};

if ((Currentlevel == 28) and (genRewards)) then
{
Nextlvl = v29;Lastlvl = v27;

genRewards = true;
if (genRewards) then
{
call _level_28;
genRewards = false;
};
Should_EXP = 24;
};

if ((Currentlevel == 29) and (genRewards)) then
{
Nextlvl = v30;Lastlvl = v28;

genRewards = true;
if (genRewards) then
{
call _level_29;
genRewards = false;
};
Should_EXP = 24;
};

if ((Currentlevel == 30) and (genRewards)) then
{
Nextlvl = "Coming Soon!";Lastlvl = v29;

genRewards = true;
if (genRewards) then
{
call _level_30;
genRewards = false;
};
Should_EXP = 24;
};


	
if (currentMoney > 50000) then
{
currentMoney = 50000;
};


_setscore = profileNamespace getVariable ["rewardScore",0];	
_setlevel = profileNamespace getVariable ["level",0];
profileNamespace setVariable ["rewardScore",currentMoney]; saveProfileNamespace;
profileNamespace setVariable ["level", Currentlevel]; saveProfileNamespace;	
profileNamespace setVariable ["bank",bankMoney]; saveProfileNamespace;
profileNamespace setVariable ["money",mymoneyz]; saveProfileNamespace;

change_debug =
{

if (IsDebug == 1) then
{
IsDebug = 2;
} else
{
IsDebug = 1;
};

};


if !(toggled) then
{
_keyalt = (findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) == 56) then {call change_debug;}"];        //ALT
toggled = true;
};

        myhp_fixer = (r_player_blood / 12000) * 100;
        myHp_corrector = round myhp_fixer;
		if (r_player_blood <= 0) then {myHp_corrector = "Dead!";};
        _pos = getpos player;
        _Lastlvlz = Lastlvl;
        _moneyz = currentMoney;
		_shopMoneyz = myMoneyZ;
		_levelz = currentlevel;	
		_Nextlvlz = Nextlvl;
  		Pname = name player;
		MaxMoney = 100000;
		MaxMoneyz = 20000;
	   _EXPz = Exp_Counter;
	   _maxedlvl = 30;
	   _checkEXP = Should_EXP;
	   My_speed = speed (vehicle player);
	    kills =        player getVariable["zombieKills",0];
       _killsH =        player getVariable["humanKills",0];
       _killsB =        player getVariable["banditKills",0];
       _humanity =        player getVariable["humanity",0];
	   
	    //#ff0000 = red
		//#FFFFFF = white
		//#00FF00 = green
	    //#00FFFF = blue
		//#c72842 = redish pink
		//#ffff00 = yellow
		//#ff8800 = orange
		

if (IsDebug == 1) then
{

			hintSilent parseText format ["
			<t size='1.3' color='#FFFFFF'>DayZ of Glory</t><br/>
			<t size='1' color='#ff8800'></t><br/>
			<t size='1' color='#ff8800'>Website: </t><t size='1' color='#ff0000'>%11</t><br/>
			<t size='1' color='#ff8800'>TS: </t><t size='1' color='#ff0000'>%12</t><br/>
			<t size='1' color='#ff8800'></t><br/>
			<t size='1' color='#ff8800'>Health: </t><t size='1' color='#ff0000'>%6</t><br/>
			<t size='1' color='#ff8800'>Level: </t><t size='1' color='#ff0000'>%2</t><br/>
			<t size='1' color='#ff8800'>Speed: </t><t size='1' color='#ff0000'>%9</t><br/>
			<t size='1' color='#ff8800'></t><br/>
			<t size='1' color='#ff8800'>Exp: </t><t size='1' color='#ff0000'>%3\%1</t><br/>
			<t size='1' color='#ff8800'>Money: </t><t size='1' color='#ff0000'>$%7</t><br/>
			<t size='1' color='#ff8800'>Money in Bank: </t><t size='1' color='#ff0000'>$%10</t><br/>
			<t size='1' color='#ff8800'></t><br/>
			<t size='1' color='#ff8800'>Time to Restart: </t><t size='1' color='#ff0000'>%5</t><br/>
			<t size='1' color='#ff8800'>Exp This Session: </t><t size='1' color='#ff0000'>%4</t>",
			(_Nextlvlz),
			(_levelz),
			(_moneyz),
			(_EXPz),
			((TimeToRestart)-(round(serverTime/60))),
			(myHp_corrector),
			(_shopMoneyz),
			(_highest),
			(round My_speed),
			(bankMoney),
			(Web_name),
			(TS_name)];
			
} else
{

  hintSilent parseText format ["
        <t size='0.75' font='Bitstream' align='left' color='#BF3EFF'>Players: %8</t><t size='0.75 'font='Bitstream' align='right' color='#FF0000'>Within 2500m: %11</t><br/>
		<t size='0.75' font='Bitstream' align='left' color='#BF3EFF'>Vehicles: </t><t size='0.75' font='Bitstream'align='right' color='#FF0000'>%13(%14)</t><br/>
		<t size='0.75' font='Bitstream' align='left' color='#BF3EFF'>Murders: </t><t size='0.75' font='Bitstream' align='right' color='#FF0000'>%4</t><br/>
		<t size='0.75' font='Bitstream' align='left' color='#BF3EFF'>Humanity: </t><t size='0.75' font='Bitstream' align='right' color='#FF0000'>%6</t><br/>
		<t size='0.75' font='Bitstream' align='left' color='#BF3EFF'>Blood: </t><t size='0.75' font='Bitstream' align='right' color='#FF0000'>%9</t><br/>
		<t size='0.75' font='Bitstream' align='left' color='#BF3EFF'>FPS</t><t size='0.75' font='Bitstream' align='right' color='#ddc92a'>%10</t><br/><br/>
		<t size='0.75' font='Bitstream' align='left' color='#BF3EFF'>Min until Restart</t><t size='0.75' font='Bitstream' align='right' color='#ddc92a'>%25</t><br/><br/>
        <t size='0.75' font='Bitstream' align='center' color='#FF0000'>ALT to Toggle</t><br/>
        <t size='0.75' font='Bitstream' align='center' color='#ddc92a' shadow='true' shadowColor='#000000'>Website: %27</t><br/>
		<t size='0.75' font='Bitstream' align='center' color='#ddc92a' shadow='true' shadowColor='#000000'>TS3: %26</t>",		
		(name player),																									//1
		(player getVariable["zombieKills", 0]),																			//2
		(player getVariable["headShots", 0]),																			//3
		(player getVariable["humanKills", 0]),																			//4
		(player getVariable["banditKills", 0]),																			//5
		(player getVariable["humanity", 0]),																			//6
		(dayz_Survived),																								//7
		(count playableUnits),																							//8
		r_player_blood,																									//9
		((round diag_fps) + 10),																						//10
		(({isPlayer _x} count (getPos vehicle player nearEntities [["AllVehicles"], 2500]))-1),							//11
		viewdistance,																									//12
		((count([6800, 9200, 0] nearEntities [["StaticWeapon","Car","Motorcycle","Tank","Air","Ship"],25000])) + 300),	//13
		((count vehicles) + 300),																						//14
		((count([6800, 9200, 0] nearEntities [["Motorcycle"],25000])) + 100),											//15
		((count([6800, 9200, 0] nearEntities [["Air"],25000])) + 50),													//16
		((count([6800, 9200, 0] nearEntities [["Car"],25000])) + 100),													//17
		(gettext (configFile >> "CfgVehicles" >> (typeof vehicle player) >> "displayName")),							//18
		(count entities "zZombie_Base"),																				//19
		({alive _x} count entities "zZombie_Base"),																		//20
		(getPosASL player),																								//21
		(mapGridPosition getPos player),																				//22
		(count([6800, 9200, 0] nearEntities [["Ship"],25000])),															//23
        (round(getDir player)),																							//24
		((TimeToRestart)-(round(serverTime/60))),
        (TS_name),
        (Web_name)];
};		
		
	
if (currentlevel != 30) then
{			
if ((_moneyz) > ((_Nextlvlz)+100)) then
{
Currentlevel = 1;
currentMoney = 0;
_setscore = profileNamespace getVariable ["rewardScore",0];	
_setlevel = profileNamespace getVariable ["level",0];
profileNamespace setVariable ["rewardScore",currentMoney]; saveProfileNamespace;
profileNamespace setVariable ["level", Currentlevel]; saveProfileNamespace;	
Sporkhint = format ["%1 Hacked his EXP!", name player];
publicVariable "Sporkhint";
};
};

if ((_levelz) > (_maxedlvl)) then
{
Currentlevel = 1;
currentMoney = 0;
_setscore = profileNamespace getVariable ["rewardScore",0];	
_setlevel = profileNamespace getVariable ["level",0];
profileNamespace setVariable ["rewardScore",currentMoney]; saveProfileNamespace;
profileNamespace setVariable ["level", Currentlevel]; saveProfileNamespace;	
Sporkhint = format ["%1 Hacked his level!", name player];
publicVariable "Sporkhint";
};


if (((_moneyz) < (_Lastlvlz)) and (currentlevel > 2)) then
{
Currentlevel = Currentlevel - 1;
_setlevel = profileNamespace getVariable ["level",0];
profileNamespace setVariable ["level", Currentlevel]; saveProfileNamespace;	
genRewards = true;
};
};