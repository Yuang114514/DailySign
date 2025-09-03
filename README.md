# 热烈庆祝中国人民抗日战争胜利80周年！
# DailySign

Minecraft服务端签到插件，但是数据包

网上有很多给Minecraft服务端开发的签到插件，但是它们都有一个大问题：用Java写成！这无法让它们跨平台运行：Fabric、Forge、NeoForge、Quilt、Paper、Bukkit、Velocity......你能找到一个能跨全平台运行的插件算我输

正好Mojang在1.13版本加入了“数据包”，可以让游戏的命令执行自动化。而计分板、标签可以当作变量、/scoreboard players operation运算......完完全全的一门全新的编程语言，专为Minecraft设计！

这么嵌入式的编程语言怎么能不用呢？于是就有了DailySign。

# 功能

- 每日提醒玩家签到

- 首次签到奖励附魔金苹果

- 非首次签到奖励金苹果

- 完（fei）善（gan）的成就系统

- 一键恢复出厂设置

- 基于/schedule的自动复位

# TODO

- [ ] 断签和补签（写一半了）

- [ ] 简单的聊天栏交互式配置（根本没写）

- [ ] 本地化（招人）

# 使用

下载后解压到服务器的world/datapacks目录（存档的datapacks目录）下，在后台或者让在线的管理员执行/reload命令即可。
