#重置自己的签到状态
#execute as @a if score @s dlsign.calendar < #dlsign dlsign.calendar run scoreboard players set @s dlsign.signing 0
#execute as @a if score @s dlsign.calendar < #dlsign dlsign.calendar run say /11
#同步日历
#execute as @a if score @s dlsign.calendar < #dlsign dlsign.calendar run scoreboard players add @s dlsign.calendar 1