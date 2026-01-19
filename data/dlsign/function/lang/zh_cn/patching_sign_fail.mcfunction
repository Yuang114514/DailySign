tellraw @s \
    [\
        {\
            text:"[DailySign] ",\
            color:light_purple\
        },\
        {\
            text:"补签失败！你的经验等级不足！",\
            color:red\
        },\
        {\
            text:" [点我补签]",\
            color:aqua,\
            hover_event:{\
                action:"show_text",\
                value:{\
                    text:"补签后将恢复你的签到天数",\
                    color:gold,\
                    bold:1b\
                }\
            },\
            click_event:{\
                action:"run_command",\
                command:"trigger dlsign.patching_sign"\
            }\
        }\
    ]