tellraw @s \
    [\
        {\
            text:"[DailySign] ",\
            color:light_purple\
        },\
        {\
            text:"You Got Unsigned Days! Your Signed Days Are Got Cleared!",\
            color:red\
        },\
        {\
            text:" You Can Cost ",\
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
            text:"Levels of XP to Patch Your Sign Days",\
            color:yellow\
        },\
        {\
            text:" [点我补签]",\
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