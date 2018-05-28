/// Add key-value pairs to existing command

/// cmd_add(command, kvCount, k1, v1, k2, v2, ..., kn, vn)
/// @param {DSMap} type         Command map
/// @param {Number} kvCount     How many key-value pairs to append to the map ? Max is 7
/// @param {Any[]} k...,v...    Key-value pairs
var map;
map = argument
kvCount = argument1

if (kvCount) {
    if (!is_real(kvCount)) {
        show_error('Error in script `cmd_add`, argument[1]: kvCount should be a number', 0)
    }
}

for (i = 0; i < kvCount; i += 1) {
    _cmd_check_key(argument[i * 2 + 2], 'cmd_add')
    ds_map_add(map, argument[i * 2 + 2], argument[i * 2 + 3])
}

return map

