private ["_bodypos","_bombOwnerUID","_mags","_tool","_body","_isAlive","_onLadder","_canDo"];

_mags = magazines player;
_tool = items player; //<-- modded by SASZane because Matts a noob ;)
_isAlive = alive cursorTarget;
_onLadder = (getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
_canDo = (!r_drag_sqf and !r_player_unconscious and !_onLadder);
if ((speed player <= 1) && !_isAlive && _canDo) then { //another if statement because fn_self actions is not a while loop.
if (("ItemToolbox" in _tool) && ("HandGrenade_West" in _mags)) then {

player removeAction s_player_makePLBomb;
s_player_makePLBomb = -1;
player playActionNow "Medic";

_body = cursorTarget;
if ((!isNull _body) && (!alive _body)) then {
  _bodyPos = getPosATL _body;
};

_bombOwnerUID = getPlayerUID player;
 
sleep 3;
 
player removeMagazine "HandGrenade_West";
 
DZ_bodyTrap = [_bombOwnerUID,_bodyPos];
publicVariableServer "DZ_bodyTrap"; //Send needed values to server.
DZ_bodyTrap = []; //Clean up global variable.
 
cutText [format["You have placed an explosive trap on the target body."], "PLAIN DOWN"];
} else {
cutText [format["You do not have the required material. You need a toolbox and a hand grenade."], "PLAIN DOWN"];
};
}
else
{
cutText [format["You cannot perform this action while looking away from the corpse."], "PLAIN DOWN"];
};