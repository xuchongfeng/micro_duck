# 从这里开始（零基础读者）

如果你从未做过机器人、没写过命令行、不清楚「仿真」「舵机」「ONNX」是什么，**按本页顺序阅读并动手**，不要跳章。

---

## 你将做出什么

一台约 42cm 高的 **双足机器人**（开源版叫 Open Duck Mini），能走路、摔倒后站起来；后期可改成 **兽人苦工** 外形。

整个项目分三大块：

| 块 | 做什么 | 需要什么 | 大约多久 |
|----|--------|----------|----------|
| **仿真** | 在电脑里训练「怎么走路」 | GTX 1060 电脑 | 2–6 周（业余） |
| **硬件** | 买零件、3D 打印、组装 | 约 ¥2000–2900 + 拓竹 A1 | 4–8 周 |
| **苦工** | 换外形、语音、可选重训 | 在硬件走稳之后 | 4+ 周 |

**当前推荐顺序：先仿真，再买舵机。**

---

## 阅读路线图（按顺序）

```
第 0 步  本页 + glossary 术语表
    ↓
第 1 步  01-getting-started/prerequisites   买/准备什么软件硬件
    ↓
第 1.5 步 02-simulation/microduck-official-path  官方路径总览（必读）
    ↓
第 2 步  02-simulation/windows-setup         装 WSL2、驱动
    ↓
第 3 步  02-simulation/gtx1060-pytorch       装 PyTorch（1060 专用版本）
    ↓
第 4 步  02-simulation/microduck-rl          第一次训练冒烟测试
    ↓
第 5 步  02-simulation/hf-simulator            浏览器玩鸭子（无需安装）
    ↓
（仿真通过后）
    ↓
第 6 步  03-hardware 整章                    采购、打印、组装
    ↓
第 7 步  06-deployment 整章                    树莓派、首走
    ↓
第 8 步  04-peon 整章                        苦工改造
```

完整里程碑见 [roadmap](roadmap/index.md)。

---

## 你的已确认配置

| 项目 | 你的选择 |
|------|----------|
| 电脑 GPU | NVIDIA GTX 1060 **6GB** |
| 电脑系统 | **Windows** |
| 3D 打印机 | 拓竹 **Bambu Lab A1** |
| 机器人平台 | **Open Duck Mini v2**（非 Microduck 成品） |

---

## 每天建议投入

| 阶段 | 建议 |
|------|------|
| 仿真 | 每天 1–2 小时，或周末集中半天 |
| 打印 | 挂机打印，人盯着首层 5 分钟 |
| 组装 | 连续 2–3 天各 3–4 小时比零散更有效 |

---

## 遇到困难时

1. 先看 [07-community/troubleshooting](07-community/troubleshooting.md)
2. 看 [07-community/faq](07-community/faq.md)
3. 官方 Discord：https://discord.gg/UtJZsgfQGe
4. 在本仓库提 Issue（附上报错全文截图）

---

## 下一步

👉 [术语表 glossary](glossary.md) → [01 前置条件](01-getting-started/prerequisites.md)
