
// Below, put the UID of player(s) where it says pasteUIDhere that you want to give access to the dome
if ((getPlayerUID player) in ["129351558" , "pasteUIDhere"]) exitWith { 
titleText ["Welcome to the Bandits Restricted Area", "PLAIN DOWN", 3];
};
// What happens if unauthorized players get into the dome
titleText ["You are entering a Bandits Restricted Area, leave now.", "PLAIN DOWN", 3];
sleep 5;
titleText ["You will be killed, GET OUT", "PLAIN DOWN", 3];
sleep 5;
titleText ["Still not listening, huh?", "PLAIN DOWN", 3];
sleep 5;
titleText ["You have 5 seconds left", "PLAIN DOWN", 3];
sleep 5;
titleText ["Bye, Bye.", "PLAIN DOWN", 3];
sleep 2;
player setDamage 1;



