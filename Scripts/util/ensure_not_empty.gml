var valid;
valid = true

if (is_string(argument0)) {
    if (argument0 == '') {
        valid = false
    }
}
if (is_real(argument0)) {
    if (argument0 == 0) {
        valid = false
    }
}

if (!valid) {
    show_message(i18n_get('cannot_be_empty', i18n_get(argument1)))
}

