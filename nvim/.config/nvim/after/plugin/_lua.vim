let s:lua_dir = expand('<sfile>:p:h:h:h').'/lua'
exec printf('luafile %s/init.lua', s:lua_dir)
