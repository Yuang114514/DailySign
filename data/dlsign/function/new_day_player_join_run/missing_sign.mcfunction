#记录漏签天数
scoreboard players operation @s dlsign.missing_signd_days = @s dlsign.sign_days

#漏签惩罚：重置签到天数
scoreboard players reset @s dlsign.sign_days

#重置补签计分板
trigger dlsign.resigning set -2