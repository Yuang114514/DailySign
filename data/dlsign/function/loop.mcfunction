#启用记分板
scoreboard players enable @a dlsign.sign

#执行签到处理函数
execute as @a[scores={dlsign.sign=1..}] run function dlsign:sign