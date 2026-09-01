# 03 · 硬件

Open Duck Mini v2：**采购、拓竹 A1 打印、舵机标定、组装**。建议在 [Phase 1 仿真](../02-simulation/index.md) 冒烟通过后再大规模采购舵机。

---

## 文档索引（已撰写）

| 文档 | 说明 |
|------|------|
| **[design-overview.md](design-overview.md)** | 要设计什么、什么用官方 |
| **[bom-cn.md](bom-cn.md)** | 国内完整采购清单与费用 |
| **[print-by-joint.md](print-by-joint.md)** | 51 件 STL 按关节分组 |
| **[bambu-a1.md](bambu-a1.md)** | A1 打印参数（PLA 15% / TPU 40%） |
| **[servo-buying-guide.md](servo-buying-guide.md)** | STS3215 避坑 |
| **[motor-config.md](motor-config.md)** | 14 舵机 ID 标定 |
| **[assembly.md](assembly.md)** | 组装顺序 |
| **[wiring-detail.md](wiring-detail.md)** | 树莓派 GPIO、电源、总线 |
| **[tools-and-safety.md](tools-and-safety.md)** | 工具、锂电池、急停 |

## 数据文件

- [bom/cn-bom.csv](../../bom/cn-bom.csv) — 可编辑采购表

## 你的硬件配置（已确认）

| 项目 | 选择 |
|------|------|
| 平台 | Open Duck Mini v2（非 Microduck 闭源硬件） |
| 舵机 | Feetech STS3215 ×14 + 9g ×2 |
| 打印机 | 拓竹 Bambu Lab A1 |
| 耗材 | PLA ~700g + TPU ~40g |

## 快速路径

```
1. 读 design-overview → 明确不用自研标准鸭 CAD
2. 读 bambu-a1 → 试打 foot_top + leg_spacer
3. 读 bom-cn + servo-buying-guide → 下单 STS3215
4. motor-config → 组装前标定 14 ID
5. assembly → 按顺序组装
6. 06-deployment → 首走
```

## 预算一览

| 类别 | 人民币 |
|------|--------|
| 舵机+电子+电源 | ¥1600–2200 |
| 打印耗材 | ¥65–110 |
| 工具（若无） | ¥0–300 |
| **合计** | **约 ¥1900–2900** |

## 下一步

- 仿真仍在进行 → [02-simulation](../02-simulation/index.md)
- 规划苦工 → [04-peon](../04-peon/index.md)
