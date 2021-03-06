/// @desc Initializes the nikaple server
/// This is a rewritten gm8-compatible network api based on patchwire,
/// for more information, visit https://github.com/gm-core/patchwire-gm

// remote ip
global.__ip = global.ip_address
// remote tcp port
global.__tcp_port = global.tcp_port
// remote udp port
global.__udp_port = global.udp_port

// Below is the script for system initialization, DO NOT MODIFY if you are not expert.

// load http dll
http_dll_init(global.plugin_directory + "http_dll_2_3.dll", true, true)
// for sending & reading tcp packets
global.bufId = buffer_create()
// for reading udp packets
global.udpBufId = buffer_create()
// for sending udp packets
global.udpSyncBufId = buffer_create()
// load json library
_json_init()
// init global variables
global.__player_id = ""
global.__player_name = ""
global.__player_index = 0
global.__is_host = false
global.__current_lobby_id = 0
global.__current_lobby_name = ""
global.__current_lobby_players = ds_list_create()
global.__current_game_id = 0

// save data used in save_sync event
global.__player_auto_save = 0
global.__save_id = -1
global.__save_room = -1
global.__save_x = -1
global.__save_y = -1
global.__save_xs = 0
global.__save_rev = -1

// used in warpSync
global.__sync_position = false

// used in udp traffic
global.__sync_time = 0

// init handlers, max scripts = 2048
var cmdPrefix, cmdPrefixLength, handlerPrefix, handlerPrefixLength, eventPrefix, eventPrefixLength, i;
// internal event handler map
global.__ns_cmd_handler_map = ds_map_create()
global.__ns_event_handler_map = ds_map_create()
global.__ns_wait_handler_map = ds_map_create()

cmdPrefix = "handler_cmd_"
cmdPrefixLength = string_length(cmdPrefix)
eventPrefix = "handler_event_"
eventPrefixLength = string_length(eventPrefix)
waitPrefix = "handler_wait_"
waitPrefixLength = string_length(waitPrefix)

global.__max_scripts = 0;
for (i = 0; i < 2048; i += 1) {
    if (script_exists(i)) {
        _ns_add_handler(global.__ns_cmd_handler_map, i, cmdPrefix)
        _ns_add_handler(global.__ns_event_handler_map, i, eventPrefix)
        _ns_add_handler(global.__ns_wait_handler_map, i, waitPrefix)
        global.__max_scripts = i;
    }
}
if (script_exists(2048)) {
    // change 2048 to a bigger number
    i18n_show_error(
        "你的脚本也太多了！请务必在 `_ns_init` 的最后将 2048 修改为一个更大的值！务必！",
        "Wow you have so many scripts! Check `_ns_init` for more information."
    )
}

