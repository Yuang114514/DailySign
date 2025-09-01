#重置自己的签到状态
execute if score @s dlsign.signing matches 2.. run scoreboard players set @s dlsign.signing 0

#同步日历
scoreboard players operation @s dlsign.calendar = #dlsign dlsign.calendar
#fuck mojang
#why cant use /execute if score
#just support fake player hard???
#输出成功消息
tellraw @s [{text:"[DailySign] ",color:light_purple},{text:"成功同步签到状态，欢迎回来！",color:aqua},{text:"[点我签到]",color:"#7a7aff",click_event:{command:"trigger dlsign.signing",action:"run_command"}}]