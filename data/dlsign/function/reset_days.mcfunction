#输出状态消息
tellraw @a [{text:"[DailySign] ",color:light_purple},{text:"正在清除签到天数......",color:aqua}]

#重新添加签到天数计分板
scoreboard objectives remove dlsign.sign_days
scoreboard objectives add dlsign.sign_days dummy {text:"签到天数",color:aqua}
scoreboard objectives setdisplay sidebar dlsign.sign_days

#重置成就
advancement revoke @a through dlsign:sign_root

#输出状态消息
tellraw @a [{text:"[DailySign] ",color:light_purple},{text:"正在清除签到状态......",color:aqua}]

#重置签到状态
scoreboard players reset @a dlsign.signing
scoreboard players set #total_signd_players dlsign.total_signd_players 0

#输出成功消息
tellraw @a [{text:"[DailySign] ",color:light_purple},{text:"清除签到数据成功！这一世，我要夺回属于我的一切！",color:aqua}]