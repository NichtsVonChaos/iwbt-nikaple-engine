///initializing music at the beginning of the game
//initialize supersound system
SS_Init()

var file, name, code, ext, extLength;

// load all musics in music directory
if (directory_exists(global.music_directory)) {
    for (file = file_find_first(global.music_directory + '\\*.ogg', 0); file != ''; file = file_find_next()) {
        extLength = 4
        name = string_delete(file, string_length(file) - 3, extLength)
        code = 'globalvar BGM_' + name + '; BGM_' + name + ' = music_load("' + name + '", global.enable_stream_music)'
        execute_string(code)
    }
    file_find_close()
}

// load all sound in sound directory
if (directory_exists(global.sound_directory)) {
    for (file = file_find_first(global.sound_directory + '\\*.*', 0); file != ''; file = file_find_next()) {
        ext = filename_ext(file)
        if (ext == '.ogg' || ext == '.wav') {
            extLength = 4
            name = string_delete(file, string_length(file) - extLength + 1, extLength)
            code = 'globalvar SE_' + name + '; SE_' + name + ' = music_load("' + name + '", 0, global.sound_directory, "' + ext + '")'
            execute_string(code)
        }
    }
    file_find_close()
}

globalvar curMusic;
curMusic = BGM_Null

// add your code here
// if you want non-stream music in stream mode (so it can be paused), uncomment the line below
// BGM_BOSS1 = music_load('BOSS1', false)
// BGM_BOSS2 = music_load('BOSS2', false)
