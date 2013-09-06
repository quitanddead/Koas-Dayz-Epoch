private ["_trigger","_nearbyUnits","_bombOwnerUID","_nearbyPlayers","_theBomb"];
 
if (!isServer) exitWith {};
 
_trigger = _this select 0;              //The trigger object
_nearbyUnits = _this select 1;  //All units in trigger area (may not be players), Changed from 2 to 1 for testing ini.
 
//diag_log "Bomb is triggered.";
 
_bombOwnerUID = _trigger getVariable "ownerUID"; //Retrieve owner's UID.
 
//Borrowing some DZAI code here. This filters out non-player units from _nearbyUnits
_nearbyPlayers = [];
{
    if (isPlayer _x) then {
                _nearbyPlayers set [(count _nearbyPlayers),_x];
        };
} forEach _nearbyUnits;
 
//diag_log format ["nearbyUnits: %1, _nearbyPlayers: %2.",_nearbyUnits,_nearbyPlayers];
 
//Check if there is at least one player in trigger area that isn't the bomb owner.
if (({(getPlayerUID _x) != _bombOwnerUID} count _nearbyPlayers) > 0) then {
    //Create bomb on trigger object
    _theBomb = createVehicle ["grenade",getPosATL _trigger,[],0,"NONE"];
        //Remove trigger after bomb is created and detonated.
    deleteVehicle _trigger;
        //diag_log "Exploded bomb. Players in trigger area are not bomb creator.";
} else {
        //diag_log "Bomb creator present.";
};