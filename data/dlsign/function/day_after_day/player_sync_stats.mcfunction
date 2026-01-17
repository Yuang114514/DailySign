#同步

#准备重新签到
scoreboard players set @s dlsign.sign 0
scoreboard players set @s dlsign.sign_status 0

#输出消息
execute \
    if score @s dlsign.lang matches 0 \
    run function dlsign:lang/zh_cn/new_day