#同步

#准备重新签到
scoreboard players set @s dlsign.sign 0
scoreboard players set @s dlsign.sign_status 0

#输出消息
execute \
    if score @s dlsign.lang matches 0 \
    run function dlsign:lang/zh_cn/new_day
execute \
    if score @s dlsign.lang matches 1 \
    run function dlsign:lang/en_us/new_day

#同步日历
scoreboard players operation @s dlsign.calendar = #dlsign dlsign.calendar