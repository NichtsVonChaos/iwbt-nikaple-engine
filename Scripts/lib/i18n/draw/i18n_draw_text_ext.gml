if (i18n_get_lang() == 'cn') {
    fw_draw_set_line_spacing(argument3)
    fw_draw_text_ext(argument0, argument1, i18n_get(argument2), argument4)
} else {
    draw_text_ext(argument0, argument1, i18n_get(argument2), argument3, argument4)
}
