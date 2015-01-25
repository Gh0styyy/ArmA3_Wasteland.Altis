if (hasInterface) exitWith {};
diag_log "hLoad.sqf loading ...";
#include "macro.h"

externalConfigFolder = "\A3Wasteland_settings";
call compile preprocessFileLineNumbers "server\default_config.sqf";
call compile preprocessFileLineNumbers (externalConfigFolder + "\main_config.sqf");
call compile preprocessFileLineNumbers "persistence\fn_sock_custom.sqf";
call compile preprocessFileLineNumbers "persistence\lib\hash.sqf";
call compile preprocessFileLineNumbers "persistence\lib\shFunctions.sqf";


def(_var);
{
  _var = _x;
  diag_log format["Syncing variable %1 ...", _var];
  [_var] call sh_sync;
    diag_log format["%1 = %2", _var, missionNamespace getVariable _var];
  diag_log format["Syncing variable %1 complete", _var];
} forEach ["active_players_list", "tracked_objects_list"];

call compile preprocessFileLineNumbers "persistence\players\sFunctions.sqf";
call compile preprocessFileLineNumbers "persistence\players\pFunctions.sqf";
call compile preprocessFileLineNumbers "persistence\world\vFunctions.sqf";
call compile preprocessFileLineNumbers "persistence\world\oFunctions.sqf";
HeadlessClient setVariable ["hc_ready", true, true];
diag_log "hLoad.sqf loading complete";
