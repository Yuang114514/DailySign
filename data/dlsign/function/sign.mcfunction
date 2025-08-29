#开始签到操作
execute as @a[scores={dlsign.signing=1}] run scoreboard players add @s dlsign.sign_days 1

#给予奖励
execute as @a[scores={dlsign.signing=1,dlsign.sign_days=1}] run give @s minecraft:enchanted_golden_apple 1
execute as @a[scores={dlsign.signing=1,dlsign.sign_days=2..}] run give @s minecraft:golden_apple 1

#添加总人数
execute as @a[scores={dlsign.signing=1}] run scoreboard players add #total_signd_players dlsign.total_signd_players 1

#授予成就
execute as @a[scores={dlsign.signing=1,dlsign.sign_days=1}] run advancement grant @s only dlsign:fitst_sign
execute as @a[scores={dlsign.signing=1,dlsign.sign_days=10}] run advancement grant @s only dlsign:sign_10

#添加未同步标签
execute as @a[scores={dlsign.signing=1}] run tag @s add dlsign.unsync

#播放音效
execute as @a[scores={dlsign.signing=1}] run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 10 1 0

#输出成功消息
execute as @a[scores={dlsign.signing=1}] run tellraw @s [{text:"[DailySign] ",color:light_purple},{text:"签到成功！",color:green},{text:"您已签到 ",color:gold},{score:{"name":"*", "objective":"dlsign.sign_days"},color:gold,bold:true},{text:" 天",color:gold}]

#结束签到操作
execute as @a[scores={dlsign.signing=1}] run scoreboard players set @s dlsign.signing 2