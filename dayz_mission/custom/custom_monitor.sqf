
if (isNil "custom_monitor") then {custom_monitor = true;} else {custom_monitor = !custom_monitor;};

while {custom_monitor} do 
{
	_kills = 		player getVariable["zombieKills",0];
	_killsH = 		player getVariable["humanKills",0];
	_killsB = 		player getVariable["banditKills",0];
	_humanity =		player getVariable["humanity",0];
	_headShots = 	player getVariable["headShots",0];
	_zombies =              count entities "zZombie_Base";
    _zombiesA =     {alive _x} count entities "zZombie_Base";
	_banditCount = {(isPlayer _x) && ((_x getVariable ["humanity",0]) < 0)} count playableUnits;
	_heroCount  = {(isPlayer _x) && ((_x getVariable ["humanity",0]) >= 5000)} count playableUnits; 
	hintSilent parseText format ["
	<t size='1' font='Bitstream'align='center'>%1</t><br/>
	<t size='1' font='Bitstream'align='center' color='#ffff00' >www.WTF-Gaming.co.uk</t> <br/>
	<br/>
	<t size='0.75' font='Bitstream'align='left'>Blood Left:</t><t size='0.75' font='Bitstream'align='right'>%2</t><br/>
	<t size='0.75' font='Bitstream'align='left'>Humanity:</t><t size='0.75' font='Bitstream'align='right'>%3</t><br/>
	<t size='0.75' font='Bitstream'align='left'>Heroes Killed:</t><t size='0.75' font='Bitstream'align='right'>%4</t><br/>
	<t size='0.75' font='Bitstream'align='left'>Bandits Killed:</t><t size='0.75' font='Bitstream'align='right'>%5</t><br/>
	<t size='0.75' font='Bitstream'align='left'>Zeds Killed:</t><t size='0.75' font='Bitstream'align='right'>%6</t><br/>
	<t size='0.75' font='Bitstream'align='left'>Headshots:</t><t size='0.75' font='Bitstream'align='right'>%7</t><br/>
	<t size='0.75' font='Bitstream' align='left'>Zeds (alive/total): </t><t size='0.75' font='Bitstream' align='right'>%9/%8</t><br/>
	<t size='0.75'font='Bitstream'align='left'>Current Bandit Count:</t><t size='0.75'font='Bitstream'align='right'>%11</t><br/>
	<t size='0.75'font='Bitstream'align='left'>Current Hero Count:</t><t size='0,75'font='Bitstream'align='right'>%12</t><br/>	
	<t size='0.75' font='Bitstream' align='left'>FPS: </t><t size='0.75' font='Bitstream' align='right'>%10</t><br/>
	<br/>
	<t size='1' font='Bitstream'align='center' color='#ffff00' >TS: 146.185.28.165:7007</t> <br/>

	",dayz_playerName,r_player_blood,round _humanity,_killsH,_killsB,_kills,_headShots,count entities "zZombie_Base",{alive _x} count entities "zZombie_Base",diag_fps,_banditCount,_heroCount];
sleep 1;
};


private ["_toggleUseTime","_toggleLastUsedTime","_lastToggle","_toggleUseTime","_toggleOn","_toggleOff"];

_toggleUseTime = 1; // Amount of time it takes in second for the player to toggle custom debug
_toggleLastUsedTime = 8; // Amount of time in seconds before player can toggle custom debug again
_toggleTime = time - lastToggle; // Variable used for easy reference in determining the cooldown
_toggleOn = s_player_toggle;
_toggleOff = s_player_toggle;

if (dayz_combat == 1) then { // Check if in combat
    cutText [format["You are in Combat and cannot toggle debug"], "PLAIN DOWN"]; //display text at bottom center of screen when in combat
} else {

	player removeAction s_player_toggle; //remove the action from users scroll menu
	
	r_interrupt = false; // public interuppt variable
	_started = false; // this starts as false as a check
	_finished = false; // this starts as false
	while {r_doLoop} do {
		if (_started && (time) > _toggleUseTime) then {
			r_doLoop = false; // turns off the loop
			_finished = true; // set finished to true
			lastToggle = time; // the last toggle time
		};
		if (r_interrupt) then {
			r_doLoop = false; // if interuppted turns loop off early so _finished is never true
		};
		sleep 0.1;
	};
	r_doLoop = false; // make sure loop is off
	
	if (_finished) then {
		// this is for handling if interrupted
		r_interrupt = false;
		player switchMove "";
		player playActionNow "stop";
		cutText [format["You have disabled your debug monitor!"], "PLAIN DOWN"]; //display text at bottom center of screen on interrupt
		hintSilent "";
	};
};