#给新来的玩家添加计分板
scoreboard players enable @a dlsign.signing

#给玩家成就
advancement grant @a only dlsign:sign_root
execute as @a[scores={dlsign.signing=10}] run advancement grant @s only dlsign:so_boring
execute as @a[scores={dlsign.signing=100}] run advancement grant @s only dlsign:so_boring_100
execute as @a[scores={dlsign.signing=500}] run advancement grant @s only dlsign:so_boring_500
execute as @a[scores={dlsign.signing=1000}] run advancement grant @s only dlsign:so_boring_1000
execute as @a[scores={dlsign.signing=5000}] run advancement grant @s only dlsign:so_boring_5000
execute as @a[scores={dlsign.signing=10000}] run advancement grant @s only dlsign:so_boring_10000

#通过fuck mojang同步签到状态
execute as @a run scoreboard players operation @s dlsign.need_sync = @s dlsign.calendar
execute as @a run scoreboard players operation @s dlsign.need_sync -= #dlsign dlsign.calendar
execute as @a if score @s dlsign.need_sync matches ..-1 run function dlsign:sync_status

#通过fuck mojang同步签到天数
execute as @a run scoreboard players operation @s dlsign.syncd_reset = @s dlsign.reset_count
execute as @a run scoreboard players operation @s dlsign.syncd_reset -= #dlsign dlsign.reset_count
execute as @a if score @s dlsign.syncd_reset matches ..-1 run function dlsign:sync_days