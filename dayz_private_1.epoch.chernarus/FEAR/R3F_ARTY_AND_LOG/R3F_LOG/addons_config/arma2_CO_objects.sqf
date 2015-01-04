/**
 * English and French comments
 * Commentaires anglais et français
 * 
 * This file adds the ArmA 2 and Arrowhead objetcs in the configuration variables of the logistics system.
 * Fichier ajoutant les objets d'ArmA 2 et Arrowhead dans la configuration du système de logistique.
 * 
 * Important note : All the classes names which inherits from the ones used in configuration variables will be also available.
 * Note importante : Tous les noms de classes dérivant de celles utilisées dans les variables de configuration seront aussi valables.
 */

/****** TOW WITH VEHICLE / REMORQUER AVEC VEHICULE ******/

/**
 * List of class names of vehicles which can tow towable objects.
 * This is the list of Vehicles that are ABLE to tow.
 */
R3F_LOG_CFG_remorqueurs = R3F_LOG_CFG_remorqueurs +
[
	"UralRepair_CDF",
	"UralRepair_INS",
	"GAZ_Vodnik_HMG",
	"HMMWV_Ambulance_DZ",
	"GAZ_Vodnik",
	"GAZ_Vodnik_DZ_LM",
	"GAZ_Vodnik_DZ_VLM",
	"GAZ_Vodnik_MedEvac",
	"Kamaz",
	"KamazOpen",
	"KamazRepair",
	"KamazRefuel",
	"HMMWV",
	"HMMWV_DES_EP1",
	"HMMWV_M998_crows_MK19_DES_EP1",
	"S1203_TK_CIV_EP1",
	"UralRefuel_CDF",
	"UralRefuel_INS",
	"Tractor",
	"Ural_CDF",
	"Ural_INS",
	"UralOpen_INS",
	"UralCivil",
	"UralCivil2",
	"SUV_PMC",
	"tractorOld",
	"Ikarus",
	"V3S_Civ",
	"Ikarus_TK_CIV_EP1",
	"SUV_TK_CIV_EP1",
	"MTVR",
	"HMMWV_DZ",
	"S1203_TK_CIV_EP1",
	"SUV_TK_CIV_EP1",
	"SUV_TK_EP1",
	"Ural_TK_CIV_EP1"
];

/**
 * List of class names of towables objects.
 * This is the list of vehicles that ARE towable
 */
R3F_LOG_CFG_objets_remorquables = R3F_LOG_CFG_objets_remorquables +
[
	"UAZ_MG_INS",
	"UAZ_MG_INS_DZ_LM",
	"UAZ_MG_INS_DZ_VLM",
	"UAZ_MG_CDF",
	"UAZ_MG_CDF_DZ_LM",
	"UAZ_MG_CDF_DZ_VLM",
	"policecar",
	"PaperCar",
	"PBX",
	"Fishing_Boat",
	"UAZ_CDF",
	"UAZ_RU",
	"Skoda",
	"SkodaBlue",
	"SkodaRed",
	"SkodaGreen",
	"datsun1_civil_1_open",
	"datsun1_civil_2_covered",
	"datsun1_civil_3_open",
	"car_hatchback",
	"car_sedan",
	"hilux1_civil_1_open",
	"hilux1_civil_2_covered",
	"hilux1_civil_3_open",
	"Lada_base",
	"Lada1",
	"Lada2",
	"LadaLM",
	"UAZ_Unarmed_TK_CIV_EP1",
	"UAZ_Unarmed_UN_EP1",
	"ATV_US_EP1",
	"ATV_CZ_EP1",
	"Old_bike_TK_CIV_EP1",
	"Old_bike_TK_INS_EP1",
	"PBX",
	"Volha_2_TK_CIV_EP1",
	"Volha_1_TK_CIV_EP1",
	"hilux1_civil_3_open_EP1",
	"LandRover_CZ_EP1",
	"Lada1_GDR",
	"Lada2_GDR",
	"Lada2_TK_CIV_EP1",
	"Lada4_GDR",
	"Lada5_GDR",
	"M1030_US_DES_EP1",
	"BAF_Offroad_D",
	"BAF_Offroad_W",
	"PBX_DZ",
	"Lada",
	"Lada1_TK_CIV_EP1",
	"LandRover_TK_CIV_EP1",
	"AN2_DZ",
	"VolhaLimo_TK_CIV_EP1",
	"UAZ",
	"M1030",
	"TT650_Ins",
	"TT650_Gue",
	"VWGolf",
	"TT650_Civ",
	"datsun1_civil_3_open",
	"Smallboat_1",
	"Smallboat_2",
	"TT650_TK_EP1",
	"UAZ_Unarmed_TK_EP1",
	"TT650_TK_CIV_EP1",
	"Old_moto_TK_Civ_EP1",
	// JE 02032014 Extra vehicles added
	"HMMWV_DZ",
	"HMMWV_M998A2_SOV_DES_EP1",
	"HMMWV_M998_crows_MK19_DES_EP1",
	"SUV_Blue",
    "SUV_Camo",
    "SUV_Charcoal",
    "SUV_DZ",
    "SUV_Green",
    "SUV_Orange",
    "SUV_Pink",
    "SUV_PMC",
    "SUV_PMC_BAF",
    "SUV_Red",
    "SUV_Silver",
    "SUV_TK_CIV_EP1",
    "SUV_TK_EP1",
    "SUV_UN_EP1",
    "SUV_White",
    "SUV_Yellow",
	"Pickup_PK_GUE",
	"Pickup_PK_GUE_DZ",
	"Pickup_PK_GUE_DZE",
	"Pickup_PK_INS",
	"Pickup_PK_INS_DZ",
	"Pickup_PK_INS_DZE",
	"Pickup_PK_TK_GUE_EP1",
	"Pickup_PK_TK_GUE_EP1_DZ",
	"Pickup_PK_TK_GUE_EP1_DZE",
	"Offroad_DSHKM_Gue",
	"Offroad_DSHKM_Gue_DZ",
	"Offroad_DSHKM_Gue_DZE",
	"Offroad_DSHKM_Gue_DZE1",
	"Offroad_DSHKM_Gue_DZE2",
	"Offroad_DSHKM_Gue_DZE3",
	"Offroad_DSHKM_Gue_DZE4",
	"Offroad_DSHKM_INS",
	"Offroad_DSHKM_TK_GUE_EP1",
	"HMMWV_DZ",
	"HMMWV_Ambulance",
	"HMMWV_Ambulance_CZ_DES_EP1",
	"HMMWV_Ambulance_DES_EP1",
	"HMMWV_Armored",
	"HMMWV_Avenger",
	"HMMWV_Avenger_DES_EP1",
	"HMMWV_DES_EP1",
	"HMMWV_M1035_DES_EP1",
	"HMMWV_M1151_M2_CZ_DES_EP1",
	"HMMWV_M1151_M2_CZ_DES_EP1_DZ",
	"HMMWV_M1151_M2_CZ_DES_EP1_DZE",
	"HMMWV_M1151_M2_DES_EP1",
	"HMMWV_M2",
	"HMMWV_M998_crows_M2_DES_EP1",
	"HMMWV_M998_crows_MK19_DES_EP1",
	"HMMWV_M998A2_SOV_DES_EP1",
	"HMMWV_M998A2_SOV_DES_EP1_DZ",
	"HMMWV_M998A2_SOV_DES_EP1_DZE",
	"HMMWV_MK19",
	"HMMWV_MK19_DES_EP1",
	"HMMWV_Terminal_EP1",
	"HMMWV_TOW",
	"HMMWV_TOW_DES_EP1",
	"HMMWV"	
];


/****** LIFT WITH VEHICLE / HELIPORTER AVEC VEHICULE ******/

/**
 * List of class names of air vehicles which can lift liftable objects.
 * This is the list of HELICOPTERS that can lift
 */
R3F_LOG_CFG_heliporteurs = R3F_LOG_CFG_heliporteurs +
[
	"MV22",
	"MV22_DZ",
	"UH1H_DZE",
	"Mi17_DZ",
	"MH60S",
	"Mi24_D",
	"Mi17_Civilian",
	"CH_47F_EP1",
	"UH1Y_DZE"
];

/**
 * List of class names of liftable objects.
 * This is the list of vehicles that CAN be lifted
 */
R3F_LOG_CFG_objets_heliportables = R3F_LOG_CFG_objets_heliportables +
[
	"UAZ_MG_INS",
	"UralRepair_CDF",
	"UralRepair_INS",
	"GAZ_Vodnik_HMG",
	"HMMWV_Ambulance_DZ",
	"GAZ_Vodnik",
	"GAZ_Vodnik_DZ_LM",
	"GAZ_Vodnik_DZ_VLM",
	"GAZ_Vodnik_MedEvac",
	"Kamaz",
	"KamazOpen",
	"KamazRepair",
	"KamazRefuel",
	"HMMWV",
	"HMMWV_DES_EP1",
	"S1203_TK_CIV_EP1",
	"UralRefuel_CDF",
	"UralRefuel_INS",
	"Tractor",
	"Ural_CDF",
	"Ural_INS",
	"UralOpen_INS",
	"UralCivil",
	"UralCivil2",
	"SUV_PMC",
	"tractorOld",
	"Ikarus",
	"V3S_Civ",
	"Ikarus_TK_CIV_EP1",
	"SUV_TK_CIV_EP1",
	"MTVR",
	"HMMWV_DZ",
	"S1203_TK_CIV_EP1",
	"SUV_TK_CIV_EP1",
	"SUV_TK_EP1",
	"Ural_TK_CIV_EP1",
	"UAZ_MG_INS_DZ_LM",
	"UAZ_MG_INS_DZ_VLM",
	"UAZ_MG_CDF",
	"UAZ_MG_CDF_DZ_LM",
	"UAZ_MG_CDF_DZ_VLM",
	"policecar",
	"PaperCar",
	"PBX",
	"Fishing_Boat",
	"UAZ_CDF",
	"UAZ_RU",
	"Skoda",
	"SkodaBlue",
	"SkodaRed",
	"SkodaGreen",
	"datsun1_civil_1_open",
	"datsun1_civil_2_covered",
	"datsun1_civil_3_open",
	"car_hatchback",
	"car_sedan",
	"hilux1_civil_1_open",
	"hilux1_civil_2_covered",
	"hilux1_civil_3_open",
	"Lada_base",
	"Lada1",
	"Lada2",
	"LadaLM",
	"UAZ_Unarmed_TK_CIV_EP1",
	"UAZ_Unarmed_UN_EP1",
	"ATV_US_EP1",
	"ATV_CZ_EP1",
	"Old_bike_TK_CIV_EP1",
	"Old_bike_TK_INS_EP1",
	"PBX",
	"Volha_2_TK_CIV_EP1",
	"Volha_1_TK_CIV_EP1",
	"hilux1_civil_3_open_EP1",
	"LandRover_CZ_EP1",
	"Lada1_GDR",
	"Lada2_GDR",
	"Lada2_TK_CIV_EP1",
	"Lada4_GDR",
	"Lada5_GDR",
	"M1030_US_DES_EP1",
	"BAF_Offroad_D",
	"BAF_Offroad_W",
	"PBX_DZ",
	"Lada",
	"Lada1_TK_CIV_EP1",
	"LandRover_TK_CIV_EP1",
	"AN2_DZ",
	"VolhaLimo_TK_CIV_EP1",
	"UAZ",
	"M1030",
	"TT650_Ins",
	"TT650_Gue",
	"VWGolf",
	"TT650_Civ",
	"datsun1_civil_3_open",
	"Smallboat_1",
	"Smallboat_2",
	"TT650_TK_EP1",
	"UAZ_Unarmed_TK_EP1",
	"TT650_TK_CIV_EP1",
	"Old_moto_TK_Civ_EP1",
	// JE 02032014 Added Vehicles 
	"HMMWV_DZ",
	"HMMWV_M998A2_SOV_DES_EP1",
	"HMMWV_M998_crows_MK19_DES_EP1",
	"SUV_Blue",
    "SUV_Camo",
    "SUV_Charcoal",
    "SUV_DZ",
    "SUV_Green",
    "SUV_Orange",
    "SUV_Pink",
    "SUV_PMC",
    "SUV_PMC_BAF",
    "SUV_Red",
    "SUV_Silver",
    "SUV_TK_CIV_EP1",
    "SUV_TK_EP1",
    "SUV_UN_EP1",
    "SUV_White",
    "SUV_Yellow",
	"Pickup_PK_GUE",
	"Pickup_PK_GUE_DZ",
	"Pickup_PK_GUE_DZE",
	"Pickup_PK_INS",
	"Pickup_PK_INS_DZ",
	"Pickup_PK_INS_DZE",
	"Pickup_PK_TK_GUE_EP1",
	"Pickup_PK_TK_GUE_EP1_DZ",
	"Pickup_PK_TK_GUE_EP1_DZE",
	"Offroad_DSHKM_Gue",
	"Offroad_DSHKM_Gue_DZ",
	"Offroad_DSHKM_Gue_DZE",
	"Offroad_DSHKM_Gue_DZE1",
	"Offroad_DSHKM_Gue_DZE2",
	"Offroad_DSHKM_Gue_DZE3",
	"Offroad_DSHKM_Gue_DZE4",
	"Offroad_DSHKM_INS",
	"Offroad_DSHKM_TK_GUE_EP1",
	"HMMWV_DZ",
	"HMMWV_Ambulance",
	"HMMWV_Ambulance_CZ_DES_EP1",
	"HMMWV_Ambulance_DES_EP1",
	"HMMWV_Armored",
	"HMMWV_Avenger",
	"HMMWV_Avenger_DES_EP1",
	"HMMWV_DES_EP1",
	"HMMWV_M1035_DES_EP1",
	"HMMWV_M1151_M2_CZ_DES_EP1",
	"HMMWV_M1151_M2_CZ_DES_EP1_DZ",
	"HMMWV_M1151_M2_CZ_DES_EP1_DZE",
	"HMMWV_M1151_M2_DES_EP1",
	"HMMWV_M2",
	"HMMWV_M998_crows_M2_DES_EP1",
	"HMMWV_M998_crows_MK19_DES_EP1",
	"HMMWV_M998A2_SOV_DES_EP1",
	"HMMWV_M998A2_SOV_DES_EP1_DZ",
	"HMMWV_M998A2_SOV_DES_EP1_DZE",
	"HMMWV_MK19",
	"HMMWV_MK19_DES_EP1",
	"HMMWV_Terminal_EP1",
	"HMMWV_TOW",
	"HMMWV_TOW_DES_EP1",
	"HMMWV"
	
];


/****** LOAD IN VEHICLE / CHARGER DANS LE VEHICULE ******/

/*
 * This section use a quantification of the volume and/or weight of the objets.
 * The arbitrary referencial used is : an ammo box of type USSpecialWeaponsBox "weights" 5 units.
 * 
 * Cette section utilise une quantification du volume et/ou poids des objets.
 * Le référentiel arbitraire utilisé est : une caisse de munition de type USSpecialWeaponsBox "pèse" 5 unités.
 * 
 * Note : the priority of a declaration of capacity to another corresponds to their order in the tables.
 *   For example : the "Truck" class is in the "Car" class (see http://community.bistudio.com/wiki/ArmA_2:_CfgVehicles).
 *   If "Truck" is declared with a capacity of 140 before "Car". And if "Car" is declared after "Truck" with a capacity of 40,
 *   Then all the sub-classes in "Truck" will have a capacity of 140. And all the sub-classes of "Car", excepted the ones
 *   in "Truck", will have a capacity of 40.
 * 
 * Note : la priorité d'une déclaration de capacité sur une autre correspond à leur ordre dans les tableaux.
 *   Par exemple : la classe "Truck" appartient à la classe "Car" (voir http://community.bistudio.com/wiki/ArmA_2:_CfgVehicles).
 *   Si "Truck" est déclaré avec une capacité de 140 avant "Car". Et que "Car" est déclaré après "Truck" avec une capacité de 40,
 *   Alors toutes les sous-classes appartenant à "Truck" auront une capacité de 140. Et toutes les sous-classes appartenant
 *   à "Car", exceptées celles de "Truck", auront une capacité de 40.
 */

/**
 * List of class names of (ground or air) vehicles which can transport transportable objects.
 * The second element of the arrays is the load capacity (in relation with the capacity cost of the objects).
 * 
 * [Vehicle Name, Capacity],
 * ["Ikarus", 50],
 */
R3F_LOG_CFG_transporteurs = R3F_LOG_CFG_transporteurs +
[
	
];

/**
 * List of class names of transportable objects.
 * The second element of the arrays is the cost capacity (in relation with the capacity of the vehicles).
 * 
 * [VEHICLE NAME, COST CAPACITY],
 * ["ATV_Base_EP1", 20],
 */
R3F_LOG_CFG_objets_transportables = R3F_LOG_CFG_objets_transportables +
[
	
];


/****** MOVABLE-BY-PLAYER OBJECTS / OBJETS DEPLACABLES PAR LE JOUEUR ******/

/**
 * List of class names of objects moveable by player.
 * "MASH",
 */
R3F_LOG_CFG_objets_deplacables = R3F_LOG_CFG_objets_deplacables +
[

];