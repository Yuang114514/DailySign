#启用记分板
scoreboard players enable @a dlsign.sign
scoreboard players enable @a dlsign.lang

#给予成就
advancement grant @a[scores={dlsign.sign=10}] only dlsign:so_boring_10
advancement grant @a[scores={dlsign.sign=100}] only dlsign:so_boring_100
advancement grant @a[scores={dlsign.sign=500}] only dlsign:so_boring_500
advancement grant @a[scores={dlsign.sign=1000}] only dlsign:so_boring_1000
advancement grant @a[scores={dlsign.sign=5000}] only dlsign:so_boring_5000
advancement grant @a[scores={dlsign.sign=10000}] only dlsign:so_boring_10000

#执行签到处理函数
#scoreboard players set @a[scores={dlsign.sign_status=2}] dlsign.sign 2
execute \
    as @a[scores={dlsign.sign=1}] \
    run function dlsign:day_after_day/sign

#执行玩家初始化函数
execute \
    as @a[tag=!dlsign.initialized] \
    run function dlsign:player_init

#玩家重新签到
execute \
    as @a \
    run scoreboard players operation @s dlsign.calendar -= #dlsign dlsign.calendar

execute \
    as @a[scores={dlsign.calendar=-1}] \
    run function dlsign:day_after_day/player_sync_stats
execute \
    as @a[scores={dlsign.calendar=..-2}] \
    run function dlsign:day_after_day/missing_sign
#正常=0，重签=1，补签=2......