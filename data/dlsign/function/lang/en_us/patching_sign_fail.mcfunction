tellraw @s \
    [\
        {\
            text:"[DailySign] ",\
            color:light_purple\
        },\
        {\
            text:"Sign Patching Failed! You Don't Have Enough XP!",\
            color:red\
        },\
        {\
            text:" [Click to Patch Sign]",\
            color:aqua,\
            hover_event:{\
                action:"show_text",\
                value:{\
                    text:"Your Signed Days Will Recover After Your Patching!",\
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