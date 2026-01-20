#补签

#检查是否可以签到
execute \
    if score @s dlsign.xp_levels < #dlsign dlsign.patching_sign_cost \
    run function dlsign:patching_sign/fail
execute \
    if score @s dlsign.xp_levels >= #dlsign dlsign.patching_sign_cost \
    run function dlsign:patching_sign/success

#等待再次触发
scoreboard players enable @s dlsign.patching_sign
scoreboard players set @s dlsign.patching_sign 0