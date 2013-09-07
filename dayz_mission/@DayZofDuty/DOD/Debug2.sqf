

part2 = true;

while {part2} do
{

_endsending = 0;
_myLevel = currentLevel;
player setVariable["Clevel",_myLevel, true];
player setVariable["allmoney",myMoneyZ, true];
player setVariable["MyBlood",r_player_blood, true];

playername = name player; 
player setVariable["myplayer",playername, true];

totalbank = bankMoney; 
player setVariable["totalbank",totalbank, true];

addmoneyc = player getVariable["Cmoney",0];

if (addmoneyc >= 1) then
{
bankMoney = bankMoney + addmoneyc;
cutText [format["You received $%1 and was transfered to bank!", addmoneyc], "PLAIN"];
player setVariable["Cmoney",_endsending, true];
};




player setVariable["EXP",currentMoney, true];
_units = playableUnits;	
_hasToolbox = "ItemToolbox" in items player;
_pos = getpos player;
_isMan = cursorTarget isKindOf "Man";
_onLadder = (getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
_isAI = cursorTarget isKindOf "US_Soldier_EP1";
_hasMap = "ItemMap" in items player;
_name = CursorTarget;
_myGun = currentWeapon player;
_zombies = _pos nearEntities ["zZombie_Base",10000];
_allplayers = _pos nearEntities ["CAManBase",20000];
theAction = _name getVariable["action",0];
theActionAI = _name getVariable["actionAI",0];
if ((_isAI) and (theActionAI == 0)) then
{

if (currentlevel >= 25) then
{
Myaction7 = _name addaction[("<t color=""#ff0000"">" + ("Teleport to...") +"</t>"),"@DayZofDuty\DOD\teleport.sqf",_myLevel,0,false,true,"", ""];
};
Myaction6 = _name addaction[("<t color=""#ff8800"">" + ("Check Stats") +"</t>"),"@DayZofDuty\dod\stats.sqf",_myLevel,0,false,true,"", ""];
Myaction2 = _name addaction[("<t color=""#ff8800"">" + ("Open Gun Shop") +"</t>"),"@DayZofDuty\dod\gunshop\gunshop.sqs",_myLevel,0,false,true,"", ""];
Myaction3 = _name addaction[("<t color=""#ff8800"">" + ("Send Money") +"</t>"),"@DayZofDuty\dod\send.sqf",_myLevel,0,false,true,"", ""];
Myaction4 = _name addaction[("<t color=""#ff8800"">" + ("Deposit Money") +"</t>"),"@DayZofDuty\dod\deposit.sqf",_myLevel,0,false,true,"", ""];
Myaction5 = _name addaction[("<t color=""#ff8800"">" + ("Withdraw Money") +"</t>"),"@DayZofDuty\dod\withdraw.sqf",_myLevel,0,false,true,"", ""];
_fixaction = 1;
_name setVariable["actionAI",_fixaction, true];
};

if (_isAI) then
{
//isbuying
} else
{ 
	_pos = getPos player;
	_AIS = _pos nearEntities ["CAManBase",20];
	_count = count _AIS;
	for "_i" from 0 to (_count -1) do
	{
		_AI = _AIS select _i;
	if (_AI isKindOf "US_Soldier_EP1") then
	{
		_AI removeAction Myaction2;
        _AI removeAction Myaction3;
        _AI removeAction Myaction4;
        _AI removeAction Myaction5;
        _AI removeAction Myaction6;
        _AI removeAction Myaction7;
	};
	};
};




	
_name = CursorTarget;
_isAlive = alive cursorTarget;
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
_name = CursorTarget;
Enddead = 1;

{
_checkKnownbody = _x getVariable["KnownDeadbody",0];
if ((_checkKnownbody == 0) and (_x isKindOf "Man") and !(_x isKindOf "Animal") and !(_x isKindOf "zZombie_base")) then
{
_money = random 1000;
_totalmoney = round _money;
_x setVariable["Deadsmoney",_totalmoney, true];
_x setVariable["KnownDeadbody",Enddead, true];
};
} forEach allDEAD;

{
_checkKnownbodyz = _x getVariable["KnownDeadbody",0];
if ((_checkKnownbodyz == 0) and (_x isKindOf "zZombie_base")) then
{
_moneyz = random 30;
_totalmoneyz = round _moneyz;
_x setVariable["Deadsmoney",_totalmoneyz, true];
_x setVariable["KnownDeadbody",Enddead, true];
};
} forEach allDEAD;


_checkKnownmoney = _name getVariable["Deadsmoney",0];
_pos = getPos player;
_name = CursorTarget;
_GetLevelcursor = _name getVariable["Clevel",0];
_zombies = _pos nearEntities ["zZombie_Base",10000];
_allplayers = _pos nearEntities ["CAManBase",20000];

if ((_isMan) and !(_isAnimal) and !(_isZombie)) then 
{
if ((moneyremover < 0) and (_checkKnownmoney >= 0) and (_GetLevelcursor >= 5)) then
{

_takemoney = format["<t color='#0096ff'>Search for Money...</t>",_checkKnownmoney, name _name]; 
Myactionbody = (vehicle player) addAction [_takemoney, "@DayZofDuty\dod\Money.sqf",[_checkKnownmoney,_x], 0, false, true, "",""];
moneyremover = 0;
};
} else {
if (moneyremover == 0) then
{
(vehicle player) removeAction Myactionbody;
moneyremover = -1;
};
};


if (_isZombie) then 
{
if ((moneyremoverz < 0) and (_checkKnownmoney >= 0)) then
{

_takemoneyz = format["<t color='#0096ff'>Search for Money...</t>",_checkKnownmoney]; 
Myactionbodyz = (vehicle player) addAction [_takemoneyz, "@DayZofDuty\dod\ZMoney.sqf",[_checkKnownmoney,_x], 0, false, true, "",""];
moneyremoverz = 0;
};
} else {
if (moneyremoverz == 0) then
{
(vehicle player) removeAction Myactionbodyz;
moneyremoverz = -1;
};
};

if (r_player_blood <= 0) then
{
sleep 1;
mymoneyz = 0;
profileNamespace setVariable ["money",myMoneyZ]; saveProfileNamespace;
for "_i" from 0 to 40 do {deletevehicle _spawnAIS;};
endmission "LOSER";
};

if (mymoneyz > 20000) then
{
mymoneyz = 20000;
};

if (bankmoney > 20000) then
{
bankmoney = 20000;
};	

	
	
	{
	
	if (_x iskindof "US_Soldier_EP1") then 
		{
         deleteVehicle _x;
		};
		
	} forEach allDEAD;



if ((grenadePunish) and (r_player_blood <= 0)) then
{
_pos = getposATL player;
"Grenade" createvehiclelocal ([(_pos select 0),(_pos select 1),(_pos select 2)]);
grenadePunish = false;
};













};