execute \
    as @a \
    if score @s dlsign.lang matches 0 \
    run function dlsign:lang/zh_cn/notice
execute \
    as @a \
    if score @s dlsign.lang matches 1 \
    run function dlsign:lang/en_us/notice

schedule function dlsign:notice 100t