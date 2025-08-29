#签到操作

#签到天数加一
execute as @a[scores={dlsign.signing=1}] run scoreboard players add @s dlsign.sign_days 1

#给予奖励
give @a[scores={dlsign.signing=1,dlsign.sign_days=1}] minecraft:enchanted_golden_apple 1
give @a[scores={dlsign.signing=1,dlsign.sign_days=2..}] minecraft:golden_apple 1

#添加总人数
execute as @a[scores={dlsign.signing=1}] run scoreboard players add dlsign dlsign.total_signd_players 1

#授予成就
advancement grant @a[scores={dlsign.signing=1,dlsign.sign_days=1}] only dlsign:fitst_sign
advancement grant @a[scores={dlsign.signing=1,dlsign.sign_days=10}] only dlsign:sign_10

#播放音效
playsound minecraft:entity.experience_orb.pickup master @a[scores={dlsign.signing=1}] ~ ~ ~ 10 1 0

#输出成功消息
tellraw @a[scores={dlsign.signing=1}] [{text:"[DailySign] ",color:light_purple},{text:"签到成功！",color:green},{text:"您已签到 ",color:gold},{score:{"name":"*", "objective":"dlsign.sign_days"},color:gold,bold:true},{text:" 天",color:gold}]

#结束签到操作
scoreboard players set @a[scores={dlsign.signing=1}] dlsign.signing 2