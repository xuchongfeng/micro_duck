# Microduck 官方文档总结：实现路径与仿真前置

依据 [pollen-robotics/microduck](https://github.com/pollen-robotics/microduck) README 及其关联文档（[docs 索引](https://github.com/pollen-robotics/microduck/blob/main/docs/README.md)、[microduck_rl](https://github.com/pollen-robotics/microduck_rl)、[AGENTS.md](https://github.com/pollen-robotics/microduck_rl/blob/main/AGENTS.md)）整理。**读完本文再动手装环境。**

---

## 一、先分清两条路

| | **官方 Microduck** | **本仓库 DIY（Open Duck Mini）** |
|--|--------------------|----------------------------------|
| 硬件 | **闭源**，约 $399 买成品 | **开源** STL，自打自装 |
| 机载程序 | `microduck`（Rust，7 个 daemon） | `Open_Duck_Mini_Runtime`（Python） |
| 舵机 | Dynamixel **XL330 ×15** | Feetech **STS3215 ×14** |
| 训练 | **`microduck_rl`** | 同一方法论 + 或旧栈 Playground |
| 仿真模型 | Onshape 导出的 MJCF | Open Duck 的 MJCF/URDF |

官方 README 的「everything you need to run a Microduck」指的是：**买成品机 + Rust 运行时**。**不能**用同一套 STL 1:1 自造 Microduck 硬件。

**共性在软件链路：** 训练都在 `microduck_rl` → ONNX → 机载约 50Hz 策略循环。

---

## 二、官方端到端实现路径

```
A. 训练线（microduck_rl）
   MJCF → mjlab + MuJoCo Warp → PPO → checkpoint
        → scripts/export.py → ONNX（含 obs 归一化）
        → scripts/infer_policy.py 键盘试走

B. 机载线（microduck）
   robotd @ 50Hz：IMU/关节 → 61 维 obs → ONNX → 舵机
   热切换：walk / stand / recover / trick…
   其它 daemon：updaterd / configd / btd / padd / mediad / tofd
```

| 阶段 | 做什么 | 入口 |
|------|--------|------|
| 0 | 零硬件，浏览器理解「策略驱动」 | [HF Sandbox](https://huggingface.co/spaces/pollen-robotics/microduck-simulator) |
| 1 | 仿真训练 → 导出 ONNX | 下文第六节 + [microduck-rl.md](microduck-rl.md) |
| 2 | 买 Microduck 或刷开发板 | [install-dev.md](https://github.com/pollen-robotics/microduck/blob/main/docs/robot/install-dev.md) |
| 3 | 机载使用 / 改代码 | [cheatsheet](https://github.com/pollen-robotics/microduck/blob/main/docs/robot/cheatsheet.md)、[architecture](https://github.com/pollen-robotics/microduck/blob/main/docs/design/architecture.md) |
| 4 | 自训新行为 | `microduck_rl` AGENTS.md → 冒烟 → 长训 → export → 上机 |

任务族（`uv run list-envs`）：Velocity、VelStand、StandUp、SitStand、GroundPick、BallKick、Roulade、Rollers 等；机载热切换时共享 **61 维观测契约**。

---

## 三、官方文档强调的技术要点

| 要点 | 说明 |
|------|------|
| Sim2real | BAM 执行器模型 + 域随机化 |
| 观测 61 维 | 48 本体 + 13 命令；多策略必须一致才能热切换 |
| 导出 ONNX | **必须**用 `scripts/export.py`，手写易缺 obs 归一化 |
| 机载架构 | 仅 `robotd` 碰电机；50Hz；安全层拦截危险 intent |

---

## 四、自己构建要掌握的知识（按层）

### 层 1：只做仿真 + 训练

Linux 命令行、Python/`uv`、GPU/CUDA 基础、RL 入门概念（PPO/reward）、MJCF 是什么、wandb 看曲线。

### 层 2：买 Microduck 用官方栈

层 1 + ONNX 部署；改机载可选读 Rust / JSON-RPC / systemd。

### 层 3：完全 DIY（Open Duck + 苦工）

层 1 + 3D 打印装配、焊接供电、STS3215 标定、树莓派；改外形/连杆后还需 MJCF + **全量重训**；苦工路线 B+ 需 CAD。

**不必一开始就学：** Rust 全栈、WebRTC、BLE（除非改 microduck 本体）。

---

## 五、前置基础学习路线（业余约 8–12 周）

```
Week 1–2   Python + 终端 + 浏览器模拟器
Week 3–4   WSL2 + microduck_rl 冒烟 + infer_policy
Week 5–6   读 AGENTS.md；1060 上 128 env 短训；export
Week 7–8   （DIY）打印试件、BOM、舵机标定、组装
Week 9+    苦工路线 A（外壳）或 B（改 MJCF + 重训）
```

**原则：仿真冒烟不通过，不要买 14 个舵机。**

---

## 六、仿真环境搭建（Windows + GTX 1060 6GB）

官方栈要 **CUDA GPU** + [uv](https://docs.astral.sh/uv/)。1060 可用，但 **禁止** 默认 `num-envs=4096`。

推荐架构：Windows NVIDIA 驱动 → **WSL2 Ubuntu 22.04** 内训练。逐步命令见：

1. [windows-setup.md](windows-setup.md)
2. [gtx1060-pytorch.md](gtx1060-pytorch.md)（固定 **PyTorch 2.7.1+cu126**）
3. [microduck-rl.md](microduck-rl.md)

### 关键命令速查

```bash
# 安装后冒烟（必做）
cd ~/robot/vendor/microduck_rl
uv run train Mjlab-Velocity-Flat-MicroDuck \
  --env.scene.num-envs 64 \
  --agent.max_iterations 5

# 1060 日常训练
uv run train Mjlab-Velocity-Flat-MicroDuck \
  --env.scene.num-envs 128 \
  --agent.run-name walk-1060-v1

# 要 4096 env → 云端
uv run train Mjlab-Velocity-Flat-MicroDuck \
  --env.scene.num-envs 4096 \
  --hf-jobs
```

| 项目 | 官方默认 | 本机 1060 |
|------|----------|-----------|
| num-envs | 4096 | **128**（可试 256） |
| PyTorch | 最新 CUDA | **2.7.1+cu126** |
| 训练时长 | ~1–2h | 约 8–20h |

检查清单与云备选见本章 [index.md](index.md)。

---

## 七、与本仓库（苦工 / Open Duck）的衔接

| 目标 | 用官方什么 | 注意 |
|------|------------|------|
| 学 sim2real | 全套 `microduck_rl` | 与是否买 Microduck 无关 |
| 首台能走 | Open Duck + 现成 walk ONNX | 不必先自训 |
| 苦工外皮 | [04-peon 路线 A](../04-peon/index.md) | 不重训 |
| 苦工改身形 | 改 MJCF + 新 task | **不能**复用现有 ONNX |

---

## 八、一句话

- **官方路径：** `microduck_rl` 训策略 → ONNX → `microduck` 上机；硬件建议购买。
- **自建路径：** 同一训练方法论，硬件走 Open Duck Mini；改苦工外形后必须重训。
- **仿真前置：** WSL2 + uv + `microduck_rl`；1060 用 **128 env + cu126**；冒烟通过再采购。
