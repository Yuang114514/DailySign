#漏签

#可以补签
scoreboard players enable @s dlsign.patching_sign

#转移天数
scoreboard players operation @s dlsign.saved_patching_signed_days >< @s dlsign.player_signed_days
scoreboard players set @s dlsign.player_signed_days 0

#输出消息
execute \
    if score @s dlsign.lang matches 0 \
    run function dlsign:lang/zh_cn/missing_sign
execute \
    if score @s dlsign.lang matches 1 \
    run function dlsign:lang/en_us/missing_sign