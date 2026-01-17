tellraw @s \
    [\
        {\
            text:"[DailySign] ",\
            color:light_purple\
        },\
        {\
            text:"你有未签到的天数！你的天数被清零了！",\
            color:red\
        },\
        {\
            text:"您可以通过花费",\
            color:yellow\
        },\
        {\
            type:"nbt",\
            nbt:Config.Value.PatchSignCostXP,\
            interpret:false,\
            source:"storage",\
            storage:"dlsign:storage"\
        },\
        {\
            text:"级经验来补签",\
            color:yellow\
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