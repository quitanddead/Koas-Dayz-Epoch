
waitUntil {!isNull player};
while {alive player}do{

if(daytime<4||daytime>23)then 

{ 

setWind [0, -2, true];
_obj = player;
_pos = position (vehicle _obj);
_d  = 15;
_h  = 12;
_h1 = 8;
_h2 = 4;
_density = 20000;
 
_fog1 = "#particlesource" createVehicleLocal _pos;
_fog1 setParticleParams [
  ["\Ca\Data\ParticleEffects\Universal\universal.p3d" , 16, 12, 13, 0], "", "Billboard", 1, 10,
  [0, 0, -6], [0, 0, 0], 1, 1.275, 1, 0,
  [7,6], [[1, 1, 1, 0], [1, 1, 1, 0.04], [1, 1, 1, 0]], [1000], 1, 0, "", "", _obj
];
_fog1 setParticleRandom [3, [55, 55, 0.2], [0, 0, -0.1], 2, 0.45, [0, 0, 0, 0.1], 0, 0];
_fog1 setParticleCircle [0.001, [0, 0, -0.12]];
_fog1 setDropInterval 0.01;
 
_fog2 = "#particlesource" createVehicleLocal _pos;
_fog2 setParticleParams [
  ["\Ca\Data\ParticleEffects\Universal\universal.p3d" , 16, 12, 13, 0], "", "Billboard", 1, 10,
  [0, 0, -6], [0, 0, 0], 1, 1.275, 1, 0,
  [7,6], [[1, 1, 1, 0], [1, 1, 1, 0.04], [1, 1, 1, 0]], [1000], 1, 0, "", "", _obj
];
_fog2 setParticleRandom [3, [55, 55, 0.2], [0, 0, -0.1], 2, 0.45, [0, 0, 0, 0.1], 0, 0];
_fog2 setParticleCircle [0.001, [0, 0, -0.12]];
_fog2 setDropInterval 0.01;
 
_fog3 = "#particlesource" createVehicleLocal _pos;
_fog3 setParticleParams [
  ["\Ca\Data\ParticleEffects\Universal\universal.p3d" , 16, 12, 13, 0], "", "Billboard", 1, 10,
  [0, 0, -6], [0, 0, 0], 1, 1.275, 1, 0,
  [7,6], [[1, 1, 1, 0], [1, 1, 1, 0.04], [1, 1, 1, 0]], [1000], 1, 0, "", "", _obj
];
_fog3 setParticleRandom [3, [55, 55, 0.2], [0, 0, -0.1], 2, 0.45, [0, 0, 0, 0.1], 0, 0];
_fog3 setParticleCircle [0.001, [0, 0, -0.12]];
_fog3 setDropInterval 0.01;
 
};
sleep 30;
};