_safeZoneSectorUBF = [] spawn
{
	 sleep 60;
    while {true} do {
    _ZombieList = [3976.0527, 8057.0728,0] nearEntities ["zZombie_Base",800];
    if (count _ZombieList > 0) then{
        {
        deleteVehicle _x;
        } forEach _zombielist;
    };
    sleep 1;
    };
};

// Script by Xyberviri - Sector UBF //