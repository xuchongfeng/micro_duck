# PeonBot / Micro Duck 文档站

> **零基础读者请从 [00-start-here.md](00-start-here.md) 开始。**

从 **Open Duck Mini** 开源双足平台出发，在 **Windows + GTX 1060** 上完成 RL 仿真，再用 **拓竹 A1** 打印组装，最终做成可行走的 **兽人苦工风格** 机器人。

---

## 快速导航

| 我是谁 | 从这里开始 |
|--------|--------------|
| 完全零基础 | [00-start-here](00-start-here.md) → [术语表](glossary.md) |
| 准备买材料 | [03-hardware/bom-cn](03-hardware/bom-cn.md) |
| 正在装环境 | [02-simulation/windows-setup](02-simulation/windows-setup.md) |
| 正在打印 | [03-hardware/bambu-a1](03-hardware/bambu-a1.md) |
| 正在组装 | [03-hardware/assembly](03-hardware/assembly.md) |
| 树莓派首走 | [06-deployment/first-walk](06-deployment/first-walk.md) |
| 做苦工 | [04-peon](04-peon/index.md) |
| 出问题了 | [07-community/troubleshooting](07-community/troubleshooting.md) |

---

## 当前阶段

**Phase 1：仿真** — GTX 1060 6GB · Windows · WSL2

👉 [02-simulation 完整步骤](02-simulation/index.md)

---

## 文档地图

| 章节 | 说明 | 状态 |
|------|------|------|
| [00 从这里开始](00-start-here.md) | 零基础路线图 | ✅ |
| [术语表](glossary.md) | 名词解释 | ✅ |
| [总路线](roadmap/index.md) | 阶段与里程碑 | ✅ |
| [01 开始](01-getting-started/index.md) | 前置、仓库、Pages | ✅ |
| [02 仿真](02-simulation/index.md) | Windows、1060、训练 | ✅ |
| [03 硬件](03-hardware/index.md) | BOM、打印、组装、接线 | ✅ |
| [04 苦工](04-peon/index.md) | 改造路线 A/B/C | ✅ |
| [05 训练](05-training/index.md) | 调参、ONNX、云端 | ✅ |
| [06 部署](06-deployment/index.md) | 树莓派、首走 | ✅ |
| [07 社区](07-community/index.md) | FAQ、排障、日志 | ✅ |

---

## 你的配置

| 项目 | 选择 |
|------|------|
| GPU | GTX 1060 6GB |
| OS | Windows + WSL2 Ubuntu |
| 打印机 | 拓竹 Bambu Lab A1 |
| 平台 | Open Duck Mini v2 |

---

## 技术栈

```
角色层：苦工外壳 / 语音（Phase 4）
RL：microduck_rl · PPO · ONNX @ 50Hz
硬件：14× STS3215 · Pi Zero 2W
制造：A1 · PLA 15% + TPU 40%
```

---

## 上游项目

- [Open Duck Mini](https://github.com/apirrone/Open_Duck_Mini) · [Runtime](https://github.com/apirrone/Open_Duck_Mini_Runtime)
- [microduck_rl](https://github.com/pollen-robotics/microduck_rl)
- [HF 模拟器](https://huggingface.co/spaces/pollen-robotics/microduck-simulator)

---

[CHANGELOG](../CHANGELOG.md)
