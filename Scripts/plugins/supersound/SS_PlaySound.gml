//Play a sound (once)
/*
argument0: sound handle as returned by SS_LoadSound
*/
/*
return: nothing
*/
if is_real(argument0) then return "0"
return external_call(global.dll_SS_PlaySound,argument0);
