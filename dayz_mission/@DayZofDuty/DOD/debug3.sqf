
part3 = true;

while {part3} do
{


_killsss = player getVariable["zombieKills",0]; 
_killZcount = player getVariable["zombieKills",0]; 
_countBB = player getVariable["banditKills",0];
_countHH = player getVariable["headShots",0];
_countHumans = player getVariable["humanKills",0]; 



TimestartContinue = (timeRestart)-(round(serverTime/60));


if ((TimestartContinue == 5) and (restartfive)) then
{
playsound "5min";
cutText ["5 Minutes until restart","PLAIN DOWN"];
restartfive = false;  
};


if ((TimestartContinue == 3) and (restartthree)) then
{
playsound "3min";
cutText ["3 Minutes until restart","PLAIN DOWN"];
restartthree = false; 
};


if ((TimestartContinue == 1) and (restartone)) then
{
playsound "1min";
cutText ["1 Minutes until restart","PLAIN DOWN"];
restartone = false;
};

if (TimestartContinue == 0) then
{
sleep 3;
endmission "LOSER";
};



	
	if (_killZcount >= zombies10) then
	{
    cutText [_Killingspree,"PLAIN DOWN"];
	playsound "killingspree";
	zombies10 = 9999;
	};	
	
	
	
	if (_killZcount >= zombies25) then
	{ 
    cutText [_Rampage,"PLAIN DOWN"];
	playsound "Rampage";
	zombies25 = 9999;
	};	


	
		
	if (_killZcount >= zombies40) then
	{
    cutText [_Dominating,"PLAIN DOWN"];
	playsound "Dominating";
	zombies40 = 9999;
	};	

	
		
	if (_killZcount >= zombies60) then
	{
   cutText [_Unstoppable,"PLAIN DOWN"];
	playsound "Unstoppable";
	zombies60 = 9999;
	};	

	
		
	if (_killZcount >= zombies100) then
	{
    cutText [_Godlike,"PLAIN DOWN"];
	playsound "Godlike";
	zombies10 = _killZcount + 10;
	zombies25 = _killZcount + 25;
	zombies40 = _killZcount + 40;
	zombies60 = _killZcount + 60;
	zombies100 = _killZcount + 100;
	};	

findObjects = _pos nearObjects ["FlagCarrierGermany_EP1",12000];
Countobjects = count findObjects;
if (Countobjects >= 1) then {_done = 1;player setVariable["firstblood",_done, true];};

	if (_killsss >= pwnagespork4) then
	{
	adding = profileNamespace setVariable ["rewardScore", currentMoney+addscore]; saveProfileNamespace;
	_setscore = profileNamespace getVariable ["rewardScore",0];
	currentMoney = _setscore;
	Exp_Counter = Exp_Counter + addscore;
	pwnagespork4 = _killsss + 1;
	};
	
	
	if (_countBB >= pwnagespork) then
	{
firstblood = player getVariable["firstblood",0];
if (firstblood == 0) then {cutText [_firstblood,"PLAIN DOWN"];playsound "firstblood";player_first = true;};
	adding = profileNamespace setVariable ["rewardScore", currentMoney+addscore2]; saveProfileNamespace;
	_setscore = profileNamespace getVariable ["rewardScore",0];
	currentMoney = _setscore;
	Exp_Counter = Exp_Counter + addscore2;
	pwnagespork = _countBB + 1;
	};
	
	
    if (_countHH >= pwnagespork2) then
	{
	cutText ["Headshot","PLAIN DOWN"];
	adding = profileNamespace setVariable ["rewardScore", currentMoney+addscoreH]; saveProfileNamespace;
	_setscore = profileNamespace getVariable ["rewardScore",0];
	currentMoney = _setscore;
	playsound "headshot";
	Exp_Counter = Exp_Counter + addscoreH;
	pwnagespork2 = _countHH + 1;
	};	
	
	if (_countHumans >= pwnagespork3) then
	{
firstblood = player getVariable["firstblood",0];
if (firstblood == 0) then {cutText [_firstblood,"PLAIN DOWN"];playsound "firstblood";player_first = true;};
	adding = profileNamespace setVariable ["rewardScore", currentMoney+addscore3]; saveProfileNamespace;
	_setscore = profileNamespace getVariable ["rewardScore",0];
	currentMoney = _setscore;
	Exp_Counter = Exp_Counter + addscore3;
	pwnagespork3 = _countHumans + 1;
	};

	
_vehicle_1 = objNull; 
if (player_first) then 
{
_flagpole = createVehicle ["FlagCarrierGermany_EP1", [11438.859, 11369.827, -9.1552734e-005], [], 0, "CAN_COLLIDE"];
_vehicle_1 = _flagpole;
_flagpole setDir 34.523594;
_flagpole setPos [11438.859, 11369.827, -9.1552734e-005];
_flagpole hideobject true;
_flagpole allowdamage false;
};

};