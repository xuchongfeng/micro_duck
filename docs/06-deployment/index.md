# 06 · 真机部署

硬件组装完成后，把 **树莓派 + Runtime + ONNX** 跑起来，完成 **首走**。

## 文档（按顺序）

| 顺序 | 文档 | 内容 |
|------|------|------|
| 1 | [flash-sd.md](flash-sd.md) | 烧录 Raspberry Pi OS |
| 2 | [runtime.md](runtime.md) | 安装 Open_Duck_Mini_Runtime |
| 3 | [duck-config.md](duck-config.md) | 配置文件与关节偏置 |
| 4 | [first-walk.md](first-walk.md) | 加载 ONNX、手柄走 |
| 5 | [sim2real-tuning.md](sim2real-tuning.md) | 仿真策略上机微调 |

## 前置条件

- [03-hardware/assembly](../03-hardware/assembly.md) 完成
- [03-hardware/motor-config](../03-hardware/motor-config.md) 14 舵机 ID 已设
- 至少有一个 `BEST_WALK_ONNX_2.onnx` 或自训 `walk.onnx`

## 安全

首次上电 **用手扶住机器人**，手指远离舵机夹缝，旁边放 **急停断电开关**。
