private ["_bombOwnerUID","_bombPos","_bombTrigger","_objectUID"];
if (!isServer) exitWith {}; //Make sure this script runs only on server.
 
_bombOwnerUID = (_this select 0) select 0;      //diag_log format ["Bomb owner's UID is %1",_bombOwnerUID];
_bombPos = (_this select 0) select 1;          //diag_log format ["Bomb's position is %1",_bombPos];
 
//Create the trigger object
_bombTrigger = createTrigger["EmptyDetector",[0,0,0]];
_bombTrigger setTriggerArea [5,5,0,false];
_bombTrigger setTriggerActivation ["ANY","PRESENT",true];
_bombTrigger setTriggerStatements ["{(isPlayer _x)} count thisList > 0;","0 = [thisTrigger,thislist] execVM 'Scripts\DetonateBodyBomb.sqf'",""]; //You don't want a vehicle like a helicopter to set off the trigger.
_bombTrigger setVariable ["ownerUID",_bombOwnerUID];
 
//Set position of stash and trigger
_bombTrigger setPosATL _bombPos;
DZ_bodyTrap = nil;