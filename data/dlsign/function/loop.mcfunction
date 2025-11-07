#启用记分板
scoreboard players enable @a dlsign.sign

#执行签到处理函数
scoreboard players set @a[scores={sign_status=2}] dlsign.sign 2
execute \
    as @a[scores={dlsign.sign=1}] \
    run function dlsign:sign

#执行玩家初始化函数
execute \
    as @a[tag=!dlsign.initialized] \
    run function dlsign:player_init

#玩家重新签到
execute \
    as @a \
    run scoreboard players operation @s dlsign.calendar = @s dlsign.player_sync_stat
execute \
    as @a \
    run scoreboard players operation #dlsign dlsign.calendar -= @s dlsign.player_sync_stat
execute \
    as @a[score={dlsign.player_sync_stat=1}] \
    run function dlsign:resign/player_sync_stats
execute \
    as @a[score={dlsign.player_sync_stat=2..}] \
    run function dlsign:missing_sign
#正常=0，重签=1，补签=2..