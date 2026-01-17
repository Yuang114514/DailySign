#开始签到
scoreboard players set @s dlsign.sign_status 1
scoreboard players set @s dlsign.sign 2

#给予奖励
function dlsign:config/sign_reward

#增加签到天数
scoreboard players add @s dlsign.player_signed_days 1
scoreboard players add #dlsign dlsign.total_signed_players 1

#输出签到成功消息
execute \
    if score @s dlsign.lang matches 0 \
    run function dlsign:lang/zh_cn/sign
execute \
    if score @s dlsign.lang matches 1 \
    run function dlsign:lang/en_us/sign

#标记为已签到
scoreboard players set @s dlsign.sign_status 2

return 0