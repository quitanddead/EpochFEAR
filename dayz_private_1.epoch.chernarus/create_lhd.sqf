_LHDspawn = _this select 0;
_LHDdir = getDir _LHDspawn;
_LHDspawnpoint = getPosasl _LHDspawn;
deleteVehicle _LHDspawn;
_parts =
[
    "Land_LHD_house_1",
    "Land_LHD_house_2",
    "Land_LHD_elev_R",
    "Land_LHD_1",
    "Land_LHD_2",
    "Land_LHD_3",
    "Land_LHD_4",
    "Land_LHD_5",
    "Land_LHD_6"
];
{
    _dummy = _x createVehicle _LHDspawnpoint;
    _dummy setDir _LHDdir;
    _dummy setPos _LHDspawnpoint;
}forEach _parts;