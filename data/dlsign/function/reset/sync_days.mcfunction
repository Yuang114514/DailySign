#重置成就
advancement revoke @s through dlsign:sign_root
#清除日历
scoreboard players reset @s dlsign.calendar
#重置同步标记
scoreboard players operation @s dlsign.reset_count = #dlsign dlsign.reset_count