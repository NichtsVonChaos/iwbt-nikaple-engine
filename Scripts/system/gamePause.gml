//pause the game

if (isBossRoom() && !global.enable_pause_in_boss_room) {
    exit;
}

if (key_check_pressed(global.pausebutton)) {
    if (instance_exists(player)) {
        pauseon = true
        pauseback = background_create_from_screen(
            0, 0,
            room_width, room_height,
            0, 0
        )
        if (isBossRoom() == true) {
            music_pause()
        } else {
            music_volume(60)
        }
    }
}

