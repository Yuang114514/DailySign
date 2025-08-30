#给新来的玩家添加计分板
scoreboard players enable @a dlsign.signing

#给新来的玩家根成就
advancement grant @a only dlsign:sign_root

#通过日历同步签到状态
execute as @a run scoreboard players operation @s dlsign.need_sync = @s dlsign.calendar
execute as @a run scoreboard players operation @s dlsign.need_sync -= #dlsign dlsign.calendar
execute as @a if score @s dlsign.need_sync matches ..-1 run function dlsign:sync_status