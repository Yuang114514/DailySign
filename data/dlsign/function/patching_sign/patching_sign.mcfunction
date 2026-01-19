#补签

#检查是否可以签到
scoreboard players operation @s dlsign.patching_level_operation = @s dlsign.xp_levels
scoreboard players operation @s dlsign.patching_level_operation -= #dlsign dlsign.xp_levels
execute \
    if score @s dlsign.patching_level_operation matches ..-1 \
    run function dlsign:patching_sign/fail
execute \
    if score @s dlsign.patching_level_operation matches 0.. \
    run function dlsign:patching_sign/success