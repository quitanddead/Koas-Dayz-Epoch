// =========================================================================================================
//  SAR_AI - DayZ AI library
//  Version: 1.0.0 
//  Author: Sarge (sarge@krumeich.ch) 
//
//		Wiki: to come
//		Forum: to come
//		
// ---------------------------------------------------------------------------------------------------------
//  Required:
//  UPSMon  
//  SHK_pos 
//  
// ---------------------------------------------------------------------------------------------------------
//   grid cfg file for Chernarus
//   last modified: 5.3.2013
// ---------------------------------------------------------------------------------------------------------

// x coordinate of the first, bottom left grid center point
_startx=2500;


// y coordinate of the first, bottom left grid center point
_starty=2800;

// gridsize x (how many single squares in the grid) for the x-axis
_gridsize_x=6;

// gridsize y (how many single squares in the grid) for the y-axis
_gridsize_y=6;

// distance from the center of one square of the grid to the border of that square. so overall size of a square in the grid is 2x gridwidth / 2x gridwidth
_gridwidth = 1000;


//
// Definition of area markers for static spawns
//

diag_log format["SAR_AI: Static spawning area definition started"];

// Sector FNG - Front Base Patrol Area
_this = createMarker ["SAR_marker_sectorfng_front", [6559, 14199]];
_this setMarkerShape "RECTANGLE";
_this setMarkeralpha 0;
_this setMarkerType "Flag";
_this setMarkerBrush "Solid";
_this setMarkerSize [10, 10];
_this setMarkerDir 120.050;
SAR_marker_sectorfng_front = _this;

// Sector FNG - Back Base Patrol Area
_this = createMarker ["SAR_marker_sectorfng_back", [6736.28, 14204.5]];
_this setMarkerShape "RECTANGLE";
_this setMarkeralpha 0;
_this setMarkerType "Flag";
_this setMarkerBrush "Solid";
_this setMarkerSize [10, 10];
_this setMarkerDir 270.050;
SAR_marker_sectorfng_back = _this;

// Sector FNG - Crate 1
_this = createMarker ["SAR_marker_sectorfng_crate1", [6589.84, 14277.5]];
_this setMarkerShape "RECTANGLE";
_this setMarkeralpha 0;
_this setMarkerType "Flag";
_this setMarkerBrush "Solid";
_this setMarkerSize [5, 5];
_this setMarkerDir 120.050;
SAR_marker_sectorfng_crate1 = _this;

// Sector FNG - Crate 2
_this = createMarker ["SAR_marker_sectorfng_crate2", [6785, 14319]];
_this setMarkerShape "RECTANGLE";
_this setMarkeralpha 0;
_this setMarkerType "Flag";
_this setMarkerBrush "Solid";
_this setMarkerSize [5, 5];
_this setMarkerDir 120.050;
SAR_marker_sectorfng_crate2 = _this;

// Sector FNG - Crate 3
_this = createMarker ["SAR_marker_sectorfng_crate3", [6788, 14090]];
_this setMarkerShape "RECTANGLE";
_this setMarkeralpha 0;
_this setMarkerType "Flag";
_this setMarkerBrush "Solid";
_this setMarkerSize [5, 5];
_this setMarkerDir 120.050;
SAR_marker_sectorfng_crate3 = _this;

// Sector FNG - Crate 4
_this = createMarker ["SAR_marker_sectorfng_crate4", [6668, 14128]];
_this setMarkerShape "RECTANGLE";
_this setMarkeralpha 0;
_this setMarkerType "Flag";
_this setMarkerBrush "Solid";
_this setMarkerSize [5, 5];
_this setMarkerDir 120.050;
SAR_marker_sectorfng_crate4 = _this;

// Sector FNG - Crate 5
_this = createMarker ["SAR_marker_sectorfng_crate5", [6660, 14182]];
_this setMarkerShape "RECTANGLE";
_this setMarkeralpha 0;
_this setMarkerType "Flag";
_this setMarkerBrush "Solid";
_this setMarkerSize [3, 3];
_this setMarkerDir 120.050;
SAR_marker_sectorfng_crate5 = _this;

// SECTION 1
//Sector UBF

_this = createMarker ["SAR_marker_firebasereaper_1", [976.0527, 8057.0728]];
_this setMarkerShape "RECTANGLE";
_this setMarkeralpha 0;
_this setMarkerType "Flag";
_this setMarkerBrush "Solid";
_this setMarkerSize [5, 5];
_this setMarkerDir 120.050;
SAR_marker_firebasereaper_1 = _this;

_this = createMarker ["SAR_marker_firebasereaper_2", [4043.071, 8024.0879]];
_this setMarkerShape "RECTANGLE";
_this setMarkeralpha 0;
_this setMarkerType "Flag";
_this setMarkerBrush "Solid";
_this setMarkerSize [5, 5];
_this setMarkerDir 120.050;
SAR_marker_firebasereaper_2 = _this;

_this = createMarker ["SAR_marker_firebasereaper_3", [4023.5303, 8070.8081]];
_this setMarkerShape "RECTANGLE";
_this setMarkeralpha 0;
_this setMarkerType "Flag";
_this setMarkerBrush "Solid";
_this setMarkerSize [5, 5];
_this setMarkerDir 120.050;
SAR_marker_firebasereaper_3 = _this;

_this = createMarker ["SAR_marker_firebasereaper_4", [4000.8169, 8115.8252]];
_this setMarkerShape "RECTANGLE";
_this setMarkeralpha 0;
_this setMarkerType "Flag";
_this setMarkerBrush "Solid";
_this setMarkerSize [5, 5];
_this setMarkerDir 120.050;
SAR_marker_firebasereaper_4 = _this;

_this = createMarker ["SAR_marker_firebasereaper_5", [3983.1641, 8102.7847]];
_this setMarkerShape "RECTANGLE";
_this setMarkeralpha 0;
_this setMarkerType "Flag";
_this setMarkerBrush "Solid";
_this setMarkerSize [5, 5];
_this setMarkerDir 120.050;
SAR_marker_firebasereaper_5 = _this;

_this = createMarker ["SAR_marker_firebasereaper_6", [4004.8845, 8094.1113]];
_this setMarkerShape "RECTANGLE";
_this setMarkeralpha 0;
_this setMarkerType "Flag";
_this setMarkerBrush "Solid";
_this setMarkerSize [5, 5];
_this setMarkerDir 120.050;
SAR_marker_firebasereaper_6 = _this;

_this = createMarker ["SAR_marker_firebasereaper_7", [3946.0886, 8100.1699]];
_this setMarkerShape "RECTANGLE";
_this setMarkeralpha 0;
_this setMarkerType "Flag";
_this setMarkerBrush "Solid";
_this setMarkerSize [5, 5];
_this setMarkerDir 120.050;
SAR_marker_firebasereaper_7 = _this;

_this = createMarker ["SAR_marker_firebasereaper_8", [3926.5972, 8060.126]];
_this setMarkerShape "RECTANGLE";
_this setMarkeralpha 0;
_this setMarkerType "Flag";
_this setMarkerBrush "Solid";
_this setMarkerSize [5, 5];
_this setMarkerDir 120.050;
SAR_marker_firebasereaper_8 = _this;

_this = createMarker ["SAR_marker_firebasereaper_9", [3879.6641, 8062.459]];
_this setMarkerShape "RECTANGLE";
_this setMarkeralpha 0;
_this setMarkerType "Flag";
_this setMarkerBrush "Solid";
_this setMarkerSize [5, 5];
_this setMarkerDir 120.050;
SAR_marker_firebasereaper_9 = _this;

_this = createMarker ["SAR_marker_firebasereaper_10", [3990.3865, 8008.3545]];
_this setMarkerShape "RECTANGLE";
_this setMarkeralpha 0;
_this setMarkerType "Flag";
_this setMarkerBrush "Solid";
_this setMarkerSize [5, 5];
_this setMarkerDir 120.050;
SAR_marker_firebasereaper_10 = _this;


diag_log format["SAR_AI: Static spawning area definition finished"];



// Section 2
diag_log format["SAR_AI: Static Spawning for infantry patrols started"];

//
// define your static infantry patrols here
//

//Sector FNG Stuff
[SAR_marker_sectorfng_front,1,0,15,"fortify",false] call SAR_AI;
[SAR_marker_sectorfng_back,1,0,15,"fortify",false] call SAR_AI;
[SAR_marker_sectorfng_crate1,1,1,4,"fortify",false] call SAR_AI;
[SAR_marker_sectorfng_crate2,1,1,4,"fortify",false] call SAR_AI;
[SAR_marker_sectorfng_crate3,1,1,4,"fortify",false] call SAR_AI;
[SAR_marker_sectorfng_crate4,1,1,4,"fortify",false] call SAR_AI;
[SAR_marker_sectorfng_crate5,1,1,4,"fortify",false] call SAR_AI;

[SAR_marker_firebasereaper_1,1,0,5,"fortify",false] call SAR_AI;
[SAR_marker_firebasereaper_2,1,0,6,"fortify",false] call SAR_AI;
[SAR_marker_firebasereaper_3,1,0,5,"fortify",false] call SAR_AI;
[SAR_marker_firebasereaper_4,1,1,4,"fortify",false] call SAR_AI;
[SAR_marker_firebasereaper_5,1,0,6,"patrol",true] call SAR_AI;
[SAR_marker_firebasereaper_6,1,0,4,"fortify",false] call SAR_AI;
[SAR_marker_firebasereaper_7,1,0,5,"fortify",false] call SAR_AI;
[SAR_marker_firebasereaper_8,1,1,4,"patrol",true] call SAR_AI;
[SAR_marker_firebasereaper_9,1,0,6,"fortify",false] call SAR_AI;
[SAR_marker_firebasereaper_10,1,1,3,"fortify",false] call SAR_AI;

diag_log format["SAR_AI: Static Spawning for infantry patrols finished"];
