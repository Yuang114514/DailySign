#劝退经验不够的玩家
tellraw @a[scores={dlsign.resigning=-1,dlsign.xp=..29}] [{text:"[DailySign] ",color:light_purple},{text:"你的经验等级不足哦！快去打经验吧！",color:aqua,bold:true}]
#有经验的玩家可以补签
#消耗经验
execute as @a[scores={dlsign.resigning=-1,dlsign.xp=30..}] if score @s dlsign.xp matches 30.. run xp add @s -30 levels

#补全签到天数
execute as @a[scores={dlsign.resigning=-1,dlsign.xp=30..}] run scoreboard players operation @s dlsign.sign_days += @s dlsign.missing_signd_days
execute as @a[scores={dlsign.resigning=-1,dlsign.xp=30..}] run scoreboard players operation @s dlsign.calendar = #dlsign dlsign.calendar

#输出成功消息
tellraw @a[scores={dlsign.resigning=-1,dlsign.xp=30..}] [{text:"[DailySign] ",color:light_purple},{text:"补签成功！",color:green},{text:"下次别漏签了！",color:yellow}]

#结束补签操作
execute as @a[scores={dlsign.resigning=-1,dlsign.xp=30..}] run trigger dlsign.resigning set 0