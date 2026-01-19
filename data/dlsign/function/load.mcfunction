#输出开始消息
tellraw @a \
    [\
        {\
            text:"[DailySign] ",\
            color:light_purple\
        },\
        {\
            text:"加载中......",\
            color:aqua\
        }\
    ]

#注册记分板
scoreboard objectives add dlsign.player_signed_days dummy \
    {\
        text:"签到天数榜",\
        color:"aqua"\
    }
scoreboard objectives add dlsign.sign_status dummy
scoreboard objectives add dlsign.calendar dummy
scoreboard objectives add dlsign.sign trigger
scoreboard objectives add dlsign.patching_sign trigger
scoreboard objectives add dlsign.total_signed_players dummy
scoreboard objectives add dlsign.lang trigger
#语言对照：0=zh_cn 1=en_us
scoreboard objectives add dlsign.player_sync_stat dummy
scoreboard objectives add dlsign.xp_levels level
scoreboard objectives add dlsign.patching_level_operation dummy
scoreboard objectives add dlsign.saved_patching_signed_days dummy

#显示计分板
scoreboard objectives setdisplay sidebar dlsign.player_signed_days
scoreboard players set #dlsign dlsign.total_signed_players 0

#启动周期性函数
schedule function dlsign:notice 100t
schedule function dlsign:day_after_day/new_day 72d

#输出成功消息
tellraw @a \
    [\
        {\
            text:"[DailySign] ",\
            color:light_purple\
        },\
        {\
            text:"签到数据包加载成功！欢迎使用～",\
            color:aqua\
        }\
    ]