#玩家初始化
scoreboard players set @s dlsign.sign_status 0
scoreboard players set @s player_signed_days 0
scoreboard players operation #dlsign dlsign.calendar = @s dlsign.calendar

tag @s add dlsign.initialized

return 0