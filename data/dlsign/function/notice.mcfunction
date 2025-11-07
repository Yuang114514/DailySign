#签到提醒
execute \
    if \
        score #dlsign dlsign.total_signed_players matches 0 \
    run \
        tellraw @a[scores={dlsign.sign_status=0}] \
            [{text:"[DailySign] ",color:light_purple},\
            {text:"早起的鸟儿有虫吃，你是今天第一个签到的！",color:yellow},\
            {text:"[点我签到]",color:blue,\
                hover_event:{action:show_text,\
                    value:{text:"抢占先机！",color:gold,bold:1b}},\
                click_event:{action:run_command,command:"trigger dlsign.sign"}}]

execute \
    if \
        score #dlsign dlsign.total_signed_players matches 1.. \
    run \
        tellraw @a[scores={dlsign.sign_status=0}] \
            [{text:"[DailySign] ",color:light_purple},\
            {text:"已有 ",color:yellow},\
            {color:gold,bold:1b,\
                score:{name:"#dlsign",objective:"dlsign.total_signed_players"}},\
            {text:" 位玩家今天已签到，你也签一个吧！",color:yellow},\
            {text:"[点我签到]",color:aqua,\
                hover_event:{action:show_text,\
                    value:{text:"不要错过奖励！",color:gold,bold:1b}},\
                click_event:{action:run_command,command:"trigger dlsign.sign"}}]

schedule function dlsign:notice 100t