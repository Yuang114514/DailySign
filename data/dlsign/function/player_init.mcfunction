#玩家初始化
scoreboard players set @s dlsign.sign_status 0
scoreboard players set @s dlsign.player_signed_days 0
scoreboard players set @s dlsign.calendar 0
scoreboard players set @s dlsign.lang 114514
tellraw @s \
    [\
        {\
            text:"[DailySign] ",\
            color:light_purple\
        },\
        {\
            text:"Please Select Your Language 请选择语言 ",\
            color:aqua\
        },\
        {\
            text:"简体中文 ",\
            underlined:1b,\
            color:yellow,\
            click_event:{\
                action:"run_command",\
                command:"trigger dlsign.lang set 0"\
            }\
        },\
        {\
            text:"English",\
            underlined:1b,\
            color:yellow,\
            click_event:{\
                action:"run_command",\
                command:"trigger dlsign.lang set 1"\
            }\
        }\
    ]

tag @s add dlsign.initialized