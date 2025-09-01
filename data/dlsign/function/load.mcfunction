#输出开始消息
tellraw @a [{text:"[DailySign] ",color:light_purple},{text:"加载中......",color:aqua}]

#注册计分板
scoreboard objectives add dlsign.signing trigger
scoreboard objectives add dlsign.resigning trigger
scoreboard objectives add dlsign.calendar dummy
scoreboard objectives add dlsign.total_signd_players dummy {text:"今日签到总人数",color:aqua}
scoreboard objectives add dlsign.sign_days dummy {text:"签到天数",color:aqua}
scoreboard objectives add dlsign.need_sync dummy
scoreboard objectives add dlsign.reset_count dummy
scoreboard objectives add dlsign.syncd_reset dummy
scoreboard objectives add dlsign.missing_signd_days dummy
scoreboard objectives add dlsign.xp level

#显示计分板
scoreboard objectives setdisplay sidebar dlsign.sign_days
scoreboard players set #dlsign dlsign.total_signd_players 0
scoreboard players set #dlsign dlsign.calendar 0

#启动周期性函数
schedule function dlsign:notice 100t
schedule function dlsign:new_day_player_join_run/day_join_check 100t
schedule function dlsign:new_day 72d

#输出成功消息
tellraw @a [{text:"[DailySign] ",color:light_purple},{text:"签到数据包加载成功！欢迎使用～",color:aqua}]