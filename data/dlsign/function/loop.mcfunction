#给新来的玩家添加计分板
scoreboard players enable @a dlsign.signing
scoreboard players set @a[tag=!dlsign.old_fish] dlsign.calendar 0
scoreboard players set @a[tag=!dlsign.old_fish] dlsign.missing_signd_days 0
scoreboard players set @a[tag=!dlsign.old_fish] dlsign.need_sync 0
scoreboard players set @a[tag=!dlsign.old_fish] dlsign.reset_count 0
scoreboard players set @a[tag=!dlsign.old_fish] dlsign.resigning 0
scoreboard players set @a[tag=!dlsign.old_fish] dlsign.sign_days 0
scoreboard players set @a[tag=!dlsign.old_fish] dlsign.signing 0
scoreboard players set @a[tag=!dlsign.old_fish] dlsign.syncd_reset 0
xp add @a[tag=!dlsign.old_fish] 1 levels
tag @a[tag=!dlsign.old_fish] add dlsign.old_fish
#给玩家成就
advancement grant @a only dlsign:sign_root
advancement grant @a[scores={dlsign.signing=10}] only dlsign:so_boring
advancement grant @a[scores={dlsign.signing=100}] only dlsign:so_boring_100
advancement grant @a[scores={dlsign.signing=500}] only dlsign:so_boring_500
advancement grant @a[scores={dlsign.signing=1000}] only dlsign:so_boring_1000
advancement grant @a[scores={dlsign.signing=5000}] only dlsign:so_boring_5000
advancement grant @a[scores={dlsign.signing=10000}] only dlsign:so_boring_10000

#通过fuck mojang同步签到状态
execute as @a run scoreboard players operation @s dlsign.need_sync = @s dlsign.calendar
execute as @a run scoreboard players operation @s dlsign.need_sync -= #dlsign dlsign.calendar
execute as @a if score @s dlsign.need_sync matches ..-1 run function dlsign:new_day_player_join_run/day_join_check

#通过fuck mojang同步签到天数
execute as @a run scoreboard players operation @s dlsign.syncd_reset = @s dlsign.reset_count
execute as @a run scoreboard players operation @s dlsign.syncd_reset -= #dlsign dlsign.reset_count
execute as @a if score @s dlsign.syncd_reset matches ..-1 run function dlsign:reset/sync_days