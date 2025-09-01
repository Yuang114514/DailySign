#检查是否漏签
execute as @a[scores={dlsign.need_sync=..-1,dlsign.signing=0}] run function dlsign:new_day_player_join_run/missing_sign
execute as @a[scores={dlsign.need_sync=..-1,dlsign.signing=2..}] run function dlsign:new_day_player_join_run/sync_status

#启动下一循环
schedule function dlsign:new_day_player_join_run/day_join_check 100t