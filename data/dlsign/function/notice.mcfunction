#判断输出哪一条签到提醒消息
execute if score #dlsign dlsign.total_signd_players matches 0 run tellraw @a[scores={dlsign.signing=0}] [{text:"[DailySign] ",color:light_purple},{text:"很幸运，你将是今天第一个签到的！",color:yellow},{text:"[点我签到]",color:blue,click_event:{command:"trigger dlsign.signing",action:"run_command"}}]
execute unless score #dlsign dlsign.total_signd_players matches 0 run tellraw @a[scores={dlsign.signing=0}] [{text:"[DailySign] ",color:light_purple},{text:"今天已经有 ",color:yellow},{score:{name:"#total_signd_players",objective:"dlsign.total_signd_players"},color:yellow,bold:true},{text:" 个人签到了，",color:yellow},{text:"而你还没有！",color:red,bold:true},{text:"[点我签到]",color:blue,click_event:{command:"trigger dlsign.signing",action:"run_command"}}]

#开始下一周期
schedule function dlsign:notice 100t