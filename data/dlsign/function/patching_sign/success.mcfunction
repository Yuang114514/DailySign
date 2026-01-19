#补签成功

#恢复天数
scoreboard players operation @s dlsign.player_signed_days += @s dlsign.saved_patching_signed_days
scoreboard players set @s dlsign.saved_patching_signed_days 0

#扣除经验
function dlsign:config/patching_sign_cost

#输出成功消息
execute \
    if score @s dlsign.lang matches 0 \
    run function dlsign:lang/zh_cn/patching_sign_success
execute \
    if score @s dlsign.lang matches 1 \
    run function dlsign:lang/en_us/patching_sign_success

scoreboard players operation @s dlsign.calendar = #dlsign dlsign.calendar
scoreboard players set @s dlsign.patching_sign 0