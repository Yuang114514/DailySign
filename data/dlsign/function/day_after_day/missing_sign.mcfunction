#漏签

#可以补签
scoreboard players enable @s dlsign.patching_sign

#输出消息
execute \
    if score @s dlsign.lang matches 0 \
    run function dlsign:lang/zh_cn/missing_sign
execute \
    if score @s dlsign.lang matches 1 \
    run function dlsign:lang/en_us/missing_sign