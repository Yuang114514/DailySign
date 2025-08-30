#给新来的玩家添加计分板
scoreboard players enable @a dlsign.signing

#给新来的玩家根成就
advancement grant @a only dlsign:sign_root

#通过日历同步签到状态
execute as @a run function dlsign:sync_status
#execute as @a if score @s dlsign.calendar < #calendar dlsign.calendar run function dlsign:sync_status
#/execute as @a run scoreboard players operation @s dlsign.calendar -= #dlsign dlsign.calendar