if (room != rTitle) exit;

debug('Login success')

var data;
data = argument0

global.__player_id = json_pick(data, 'id')
global.__player_name = json_pick(data, 'name')

// send udp handshake packet
if (!instance_exists(objUdpShakehand)) {
    instance_create(0, 0, objUdpShakehand)
} else {
    objUdpShakehand.alarm[0] = 5
}

//show_message(i18n_get('login_success'))

