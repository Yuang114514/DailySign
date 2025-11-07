#开始签到
scoreboard players set @s dlsign.sign_status 1
scoreboard players set @s dlsign.sign 2

#增加签到天数
scoreboard players add @s dlsign.player_signed_days 1

#给予奖励
give @s[scores={dlsign.old_fish=1}] minecraft:golden_apple 1
give @s[scores={dlsign.old_fish=0}] minecraft:enchanted_golden_apple 1

#输出签到成功消息
tellraw @s \
    [{text:"[DailySign] ",color:light_purple},\
    {text:"签到成功！你已连续签到 ",color:yellow},\
    {color:gold,bold:1b,\
        score:{name:"*",objective:"dlsign.player_signed_days"}},\
    {text:" 天，奖励已发放！",color:yellow}]

#标记为已签到
scoreboard players set @s dlsign.sign_status 2