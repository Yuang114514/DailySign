#启用记分板
scoreboard players enable @a dlsign.sign

#执行签到处理函数
scoreboard players set @a[scores={sign_status=2}] dlsign.sign 2
execute as @a[scores={dlsign.sign=1}] run function dlsign:sign