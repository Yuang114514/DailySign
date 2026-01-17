##签到奖励配置
#配置签到奖励
#将下方give命令的参数修改为你想要的奖励物品ID和数量
#第一行是首次签到的奖励，第二行是非首次签到的奖励
#你还可以添加更多的奖励，记得调整条件
xp add @s 20 points
give @s[scores={dlsign.player_signed_days=0}] minecraft:enchanted_golden_apple 1
give @s[scores={dlsign.player_signed_days=1..}] minecraft:golden_apple 1