if (i18n_get_lang() == 'en' && global.useBuiltInDrawing) {
    draw_text_ext_color(argument0, argument1, i18n_get(argument2), argument3, argument4, argument5, argument5, argument6, argument6, argument7)
} else {
    fw_draw_set_line_spacing(argument3)
    fw_draw_text_ext_color(argument0, argument1, i18n_get(argument2), argument4, argument5, argument6, argument7)
}

