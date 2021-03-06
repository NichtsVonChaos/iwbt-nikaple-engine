var fromName, data, _room, r, IsAllPlayersInWarp, num, mode, width, height, screens, kind, info, seed;
fromName = argument0
data = argument1
IsAllPlayersInWarp = argument2

_room = json_pick(data, 'room')
r = json_pick(data, 'r')
num = json_pick(data, 'num')
mode = json_pick(data, 'mode')
width = json_pick(data, 'width')
height = json_pick(data, 'height')
screens = json_pick(data, 'screens')
kind = json_pick(data, 'kind')
seed = json_pick(data, 'seed') 

if (ds_map_exists(objOnlinePlayers.dsPlayerInfo, fromName)) {
    info = json_pick(objOnlinePlayers.dsPlayerInfo, fromName)
    ds_map_replace(info, 'r', r)
    with (objOnlinePlayers) {
        fakePlayer = variable_local_get(fromName)
        fakePlayer._room = roomTo
    }
}

if (IsAllPlayersInWarp && _room == room) {
    if (seed > 0) {
        random_set_seed(seed)
    }
    scrWarpTo(r, num, mode, width, height, clearSpeed, screens, kind)
}

