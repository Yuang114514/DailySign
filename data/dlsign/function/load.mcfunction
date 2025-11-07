#输出开始消息
tellraw @a \
    [{text:"[DailySign] ",color:light_purple},\
    {text:"加载中......",color:aqua}]

#注册记分板
scoreboard objectives add dlsign.player_signed_days dummy \
    {text:"已签到天数",color:"aqua"}
scoreboard objectives add dlsign.sign_status dummy
scoreboard objectives add dlsign.calendar dummy
scoreboard objectives add dlsign.sign trigger
scoreboard objectives add dlsign.total_signed_players dummy
scoreboard objectives add dlsign.player_sync_stat dummy

#显示计分板
scoreboard players set #dlsign dlsign.total_signed_players 0

#启动周期性函数
schedule function dlsign:notice 100t replace
schedule function dlsign:resign/new_day 72d

#输出成功消息
tellraw @a \
    [{text:"[DailySign] ",color:light_purple},\
    {text:"签到数据包加载成功！欢迎使用～",color:aqua}]

return 0