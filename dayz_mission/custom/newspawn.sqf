if (!isDedicated) then {
		sleep 1;
						//Player UID's
		if ((getPlayerUID player) in ["37314054","58434118","118450566"]) exitWith {
		//## Custom Spawn Location 1 - Format: [X,Y,Z] (Z = Height AtTerrainLevel)
			player setPosATL [185,7243,1.5];
		};
		
						//Player UID's
		if ((getPlayerUID player) in ["81239110"]) exitWith {
		//## Custom Spawn Location 2 - Format: [X,Y,Z] (Z = Height AtTerrainLevel)
			player setPosATL [195,7213,1.5];
		};
};