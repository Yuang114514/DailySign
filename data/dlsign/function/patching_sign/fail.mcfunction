#补签失败

#等待重新补签
scoreboard players enable @s dlsign.patching_sign

#输出失败消息
execute \
    if score @s dlsign.lang matches 0 \
    run function dlsign:lang/zh_cn/patching_sign_fail
execute \
    if score @s dlsign.lang matches 1 \
    run function dlsign:lang/en_us/patching_sign_fail