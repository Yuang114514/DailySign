#新的一天
tellraw @a \
    [{text:"[DailySign] ",color:light_purple},\
    {text:"准备迎接新的一天......",color:aqua}]

#重置签到状态
scoreboard players set #dlsign dlsign.total_signed_players 0

#日历翻页
scoreboard players add #dlsign dlsign.calendar 1

#输出成功消息
tellraw @a \
    [{text:"[DailySign] ",color:light_purple},\
    {text:"每日自动复位成功，新的一天开始了！",color:aqua}]

schedule function dlsign:resign/new_day 72d