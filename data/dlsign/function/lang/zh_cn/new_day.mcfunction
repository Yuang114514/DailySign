tellraw @s \
    [\
        {\
            text:"[DailySign] ",\
            color:light_purple\
        },\
        {\
            text:"又是新的一天，欢迎回来！",\
            color:yellow \
        },\
        {\
            text:"[点我签到]",\
            color:aqua,\
            underlined:1b,\
            hover_event:{\
                action:show_text,\
                value:{\
                    text:"不要错过奖励！",\
                    color:gold,\
                    bold:1b\
                }\
            },\
            click_event:{\
            action:run_command,\
            command:"trigger dlsign.sign"\
            }\
        }\
    ]