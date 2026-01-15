tellraw @s \
    [{text:"[DailySign] ",color:light_purple},\
    {text:"签到成功！你已连续签到 ",color:yellow},\
    {color:gold,bold:1b,\
        score:{name:"*",objective:"dlsign.player_signed_days"}},\
    {text:" 天，奖励已发放！",color:yellow}]