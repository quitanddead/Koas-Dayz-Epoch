 private ["_chance", "_sounddist", "_press", "_sfx", "_dis"];
 
_dis=100;
_sfx = "engine_12s";
_chance = floor(random 100);
_press = nearestObject [player, "Land_Ind_Stack_Big"]; 
_sounddist = 15;

player playActionNow "Medic";
sleep 1;
titleText ["You have activated the ammo press.","PLAIN DOWN"]; titleFadeOut 5;
sleep 2;

 
if (_chance > 10) then
    {

		[nil,_press,rSAY,["engine_12s", _sounddist]] call RE;	
		[player,_sfx,0,false,_dis] call dayz_zombieSpeak;
		[player,_dis,true,(getPosATL player)] spawn player_alertZombies;
		player addMagazine "20Rnd_762x51_DMR";    
        player addMagazine "20Rnd_762x51_DMR";   
        player addMagazine "20Rnd_762x51_DMR";  
        player removeMagazine "PartGeneric"; 	
        sleep 0.01;    
        titleText ["You pressed some DMR mags.","PLAIN DOWN"]; titleFadeOut 5;
    }
else
    {
 		[nil,_press,rSAY,["PMC_ElectricBlast1", _sounddist]] call RE;	
		player removeMagazine "PartGeneric"; 	
        sleep 0.01;
       
        titleText ["The press has malfunctioned.","PLAIN DOWN"]; titleFadeOut 5;
    };
 
 
//Ammo Press by Smokey Meadow