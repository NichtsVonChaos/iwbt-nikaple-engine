var fromName, data, _id, _x, _y, isAllPlayersSaved;
fromName = argument0
data = argument1
isAllPlayersSaved = argument2

_id = json_pick(data, 'id')
_x = json_pick(data, 'x')
_y = json_pick(data, 'y')

if (isAllPlayersSaved) {
    with (_id) {
        saveX = _x
        saveY = _y
        event_user(0)
    }
} else {
    _id.image_index = 1
}

