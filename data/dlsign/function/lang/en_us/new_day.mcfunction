tellraw @s \
    [\
        {\
            text:"[DailySign] ",\
            color:light_purple\
        },\
        {\
            text:"Another Day Again, Welcome Back! ",\
            color:yellow \
        },\
        {\
            text:"[Click to sign]",\
            color:aqua,\
            underlined:1b,\
            hover_event:{\
                action:show_text,\
                value:{\
                    text:"Never Miss the Reward!",\
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