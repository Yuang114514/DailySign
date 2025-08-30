#输出开始消息
tellraw @a [{text:"[DailySign] ",color:light_purple},{text:"正在重置签到信息......",color:aqua}]

#重置签到状态
scoreboard players reset @a dlsign.signing
scoreboard players set #dlsign dlsign.total_signd_players 0

#日历加一
scoreboard players add #dlsign dlsign.calendar 1

#输出成功消息
tellraw @a [{text:"[DailySign] ",color:light_purple},{text:"签到信息重置成功！又是新的一天～",color:aqua}]

#启动下一循环
schedule function dlsign:reset_status 72d