# 总落地路线

本文档整合项目全流程：**仿真优先 → 标准鸭子硬件 → 苦工改造 → 真机部署**，并标注每阶段交付物与依赖。

---

## 原则

1. **仿真先行**：GTX 1060 上跑通 smoke test 与短训，再花钱采购舵机。
2. **基座不变**：首台真机按 **Open Duck Mini v2** 标准建，确保能走，再改苦工外形。
3. **策略不可复用**：苦工改比例后必须 **新建 MJCF + 重训**，鸭子 ONNX 不能直接上苦工机身。
4. **文档即产品**：本仓库 GitHub Pages 同步记录过程，供爱好者复现。

---

## 阶段总览

```
Phase 0  项目初始化（本仓库、Pages、目录）     ← 当前
   ↓
Phase 1  仿真环境（Windows + GTX 1060 6GB）
   ↓
Phase 2  硬件规划（BOM 锁定、A1 试打、采购清单）
   ↓
Phase 3  标准鸭组装（Open Duck Mini 原版）
   ↓
Phase 4  苦工改造（外壳 → 机械 → MJCF → 重训）
   ↓
Phase 5  Sim2Real 与角色表现（语音、NFC、内容）
   ↓
Phase 6  可选：套件/教程/社群变现
```

---

## Phase 0：项目初始化

| 项 | 内容 | 交付物 |
|----|------|--------|
| 0.1 | GitHub 仓库 + Pages 从 `/docs` 发布 | 本站点可访问 |
| 0.2 | 文档目录骨架 | `docs/**/index.md` |
| 0.3 | 设备清单确认 | A1、1060 6GB、Windows |

**完成标准：** 访问 GitHub Pages 能看到首页与路线图。

---

## Phase 1：仿真环境（当前重点）

| 项 | 内容 | 交付物 | 文档 |
|----|------|--------|------|
| 1.1 | Windows 开发环境（WSL2 推荐） | 可 `nvidia-smi` | [02-simulation/windows-setup](../02-simulation/windows-setup.md) |
| 1.2 | PyTorch 2.7.1+cu126（Pascal 1060） | `torch.cuda` 可用 | [02-simulation/gtx1060-pytorch](../02-simulation/gtx1060-pytorch.md) |
| 1.3 | 克隆 `microduck_rl` + `uv sync` | 依赖安装成功 | [02-simulation/microduck-rl](../02-simulation/microduck-rl.md) |
| 1.4 | 冒烟测试 `num-envs=64, iter=5` | 无 CUDA OOM | 同上 |
| 1.5 | HF Spaces 浏览器模拟器体验 | 理解策略接口 | [02-simulation/hf-simulator](../02-simulation/hf-simulator.md) |
| 1.6 | 短训 walk `num-envs=128` | 得到首个 checkpoint | [05-training/gtx1060-tuning](../05-training/gtx1060-tuning.md) |
| 1.7 | `export.py` → ONNX + `infer_policy.py` | CPU 仿真里能走 | [05-training/export-onnx](../05-training/export-onnx.md) |

**完成标准：** 不依赖真机，在电脑上完成功能性 walk 策略的训练→导出→回放。

**1060 注意：** 不用 4096 env；长跑可挂机过夜或 Phase 1.6 后用 HF Jobs / 云 GPU。

---

## Phase 2：硬件规划与试制

| 项 | 内容 | 交付物 | 文档 |
|----|------|--------|------|
| 2.1 | 锁定 BOM（STS3215 ×14，非低价假舵机） | `bom/cn-bom.csv` | [03-hardware/bom-cn](../03-hardware/bom-cn.md) |
| 2.2 | 按关节分组打印清单 | 打印批次表 | [03-hardware/print-by-joint](../03-hardware/print-by-joint.md) |
| 2.3 | A1 试打（`foot_top` + `leg_spacer`） | 验证孔位 | [03-hardware/bambu-a1](../03-hardware/bambu-a1.md) |
| 2.4 | 采购舵机 + 电子件 | 到货清单 | BOM |
| 2.5 | 舵机预标定（ID + 零位） | 配置记录 | [03-hardware/motor-config](../03-hardware/motor-config.md) |

**完成标准：** 物料到齐前，打印件已试装通过；14 个舵机 ID 配置完毕。

**预算参考：** ¥2000–2900（不含 A1 打印机）。

---

## Phase 3：标准 Open Duck Mini 组装

| 项 | 内容 | 交付物 | 文档 |
|----|------|--------|------|
| 3.1 | 按官方顺序组装（躯干→腿→头→电控） | 机械完成 | [03-hardware/assembly](../03-hardware/assembly.md) |
| 3.2 | 树莓派 Zero 2W + Runtime | `duck_config.json` | [06-deployment/runtime](../06-deployment/runtime.md) |
| 3.3 | 加载 `BEST_WALK_ONNX_2.onnx` | **首走** | [06-deployment/first-walk](../06-deployment/first-walk.md) |
| 3.4 | 记录翻车与调参 | 故障库条目 | [07-community/troubleshooting](../07-community/troubleshooting.md) |

**完成标准：** 标准外形鸭子能手柄控制行走、摔倒后能恢复（官方策略）。

---

## Phase 4：苦工改造（增量工作）

在 Phase 3 **走稳之后** 进行。详见 [04-peon](../04-peon/index.md)。

| 项 | 难度 | 说明 |
|----|------|------|
| 4.1 外观壳（路线 A） | ★☆☆ | 鸭身 + 苦工头/涂装 + 语音，策略不改 |
| 4.2 比例 CAD（路线 B） | ★★★ | 矮胖、驼背、脚板加大 |
| 4.3 新建 MJCF | ★★★★ | 质量/惯量/连杆长度 |
| 4.4 全量重训策略 | ★★★★ | walk / stand / get_up，1060 或云端 |
| 4.5 手臂 + 镐（路线 C） | ★★★★★ | 建议二期，腿稳后再加 |

**苦工额外交付物：**

- `peon/` 目录：STL 外壳、MJCF、ONNX 策略
- 语音包与触发逻辑
- 「虚拟→真机」对比视频/文档

---

## Phase 5：Sim2Real 与角色化

| 项 | 内容 |
|----|------|
| 5.1 | 苦工策略烧录真机，域随机化微调 |
| 5.2 | 语音（Work work / Okie dokie 等，注意 IP） |
| 5.3 | NFC / 手柄触发行为 |
| 5.4 | 构建日志连载（B站/公众号 ↔ 链到 Pages） |

---

## Phase 6：可选商业化

| 方向 | 说明 |
|------|------|
| 付费构建手册 | 本 Pages 免费章 + 付费完整版 |
| BOM 代购 / 打印套件 | 预标定舵机服务 |
| 定制策略 | 云端训练 + ONNX 交付 |

见 [07-community/monetization](../07-community/monetization.md)、[ip-notice](../07-community/ip-notice.md)。

---

## 里程碑时间（建议）

| 里程碑 | 目标时间 | 依赖 |
|--------|----------|------|
| M0 Pages 上线 | 第 1 周 | Phase 0 |
| M1 仿真 smoke 通过 | 第 2–3 周 | Phase 1 |
| M2 首版 walk ONNX 本地回放 | 第 4–6 周 | Phase 1.6–1.7 |
| M3 BOM 下单 + A1 试打 | 第 6–8 周 | Phase 2 |
| M4 标准鸭首走 | 第 10–14 周 | Phase 3 |
| M5 苦工外观 demo | 第 14–16 周 | Phase 4.1 |
| M6 苦工自训策略上机 | 第 18–24 周 | Phase 4.3–4.4 |

时间为业余节奏估算，可按进度调整。

---

## 风险登记

| 风险 | 缓解 |
|------|------|
| 1060 PyTorch 不支持 Pascal | 固定 `torch 2.7.1+cu126` |
| 6GB OOM | `num-envs=128`，必要时 64 |
| 假 STS3215 | 只买 ST-3215-C001，¥70+ |
| 苦工头重摔机 | 电池放低、仿真写实质量 |
| 暴雪 IP | 商用避开「魔兽世界」「Peon」商标 |

---

## 下一步

👉 [02-simulation 开始仿真环境搭建](../02-simulation/index.md)
