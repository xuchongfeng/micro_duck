# 04 · 苦工改造（完整指南）

在标准鸭 **能走** 之后，做成兽人苦工风格。本章假设读者零基础，分路线说明。

---

## 文档

| 文档 | 内容 |
|------|------|
| [design-goals.md](design-goals.md) | 外形目标与约束 |
| [route-a-cosmetic.md](route-a-cosmetic.md) | 只换外壳+语音（推荐先做） |
| [route-b-mechanical.md](route-b-mechanical.md) | 改比例 CAD |
| [mjcf-model.md](mjcf-model.md) | 仿真模型怎么建 |
| [retrain-checklist.md](retrain-checklist.md) | 重训步骤清单 |
| [audio-voice.md](audio-voice.md) | 音效与触发 |
| [arms-pickaxe.md](arms-pickaxe.md) | 手臂与镐（二期） |

## 三条路线对比

| | 路线 A | 路线 B | 路线 C |
|--|--------|--------|--------|
| 时间 | 1–2 周 | 2–3 月 | 4+ 月 |
| 改 CAD | 外壳 | 全身比例 | B+手臂 |
| 重训 RL | 否 | 是 | 是 |
| 适合 | 视频/demo | 正经苦工步态 | 研究向 |

## IP

商用见 [07-community/ip-notice.md](../07-community/ip-notice.md)。

## 前置

[06-deployment/first-walk.md](../06-deployment/first-walk.md) 已完成。
