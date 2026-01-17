#签到提醒
execute \
    if score #dlsign dlsign.total_signed_players matches 0 \
    run \
        tellraw @s[scores={dlsign.sign_status=0}] \
            [\
                {text:"[DailySign] ",\
                color:light_purple\
                },\
                {\
                    text:"Luckly, You Will Be the First Signer Today!",\
                    color:yellow\
                },\
                {\
                    text:"[Click to Sign]",\
                    color:blue,\
                    underlined:1b,\
                    hover_event:{\
                        action:show_text,\
                        value:{\
                            text:"Get the First!",\
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

execute \
    if score #dlsign dlsign.total_signed_players matches 1.. \
    run tellraw @s[scores={dlsign.sign_status=0}] \
        [\
            {text:"[DailySign] ",\
            color:light_purple\
            },\
            {\
                text:"There are ",\
                color:yellow\
            },\
            {\
                color:gold,\
                bold:1b,\
                score:{\
                    name:"#dlsign",\
                    objective:"dlsign.total_signed_players"\
                }\
            },\
            {\
                text:" Players Signed Today, Join Them!",\
                color:yellow\
            },\
            {\
                text:"[Click to Sign]",\
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