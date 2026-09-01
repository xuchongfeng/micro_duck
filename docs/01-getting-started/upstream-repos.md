# 上游开源仓库

本项目 **站在巨人肩膀上**：机械、训练、机载程序都来自以下仓库。你需要 **单独克隆** 它们（不要 fork 后改上游核心，除非你要贡献 PR）。

---

## 仓库一览

| 仓库 | 分支 | 用途 | 何时需要 |
|------|------|------|----------|
| [apirrone/Open_Duck_Mini](https://github.com/apirrone/Open_Duck_Mini) | `v2` | STL、组装文档、预训练 ONNX | 打印 + 首走 |
| [apirrone/Open_Duck_Mini_Runtime](https://github.com/apirrone/Open_Duck_Mini_Runtime) | `v2` | 树莓派控制、舵机标定 | 组装 + 部署 |
| [pollen-robotics/microduck_rl](https://github.com/pollen-robotics/microduck_rl) | `main` | RL 训练 MuJoCo Warp | **仿真第一天** |
| [pollen-robotics/microduck](https://github.com/pollen-robotics/microduck) | `main` | Microduck 机载 Runtime（Rust） | 可选参考 |
| [apirrone/Open_Duck_Playground](https://github.com/apirrone/Open_Duck_Playground) | — | 旧版训练栈 | 可选 |

---

## 推荐存放位置

在电脑上建一个总目录，例如 `D:\robot\` 或 `~/robot/`：

```text
robot/
├── micro_duck/          ← 本教程仓库（你正在读的）
└── vendor/
    ├── Open_Duck_Mini/
    ├── Open_Duck_Mini_Runtime/
    └── microduck_rl/
```

### Windows PowerShell 克隆命令

```powershell
mkdir D:\robot\vendor -Force
cd D:\robot\vendor

git clone -b v2 --depth 1 https://github.com/apirrone/Open_Duck_Mini.git
git clone -b v2 --depth 1 https://github.com/apirrone/Open_Duck_Mini_Runtime.git
git clone --depth 1 https://github.com/pollen-robotics/microduck_rl.git
```

### WSL Ubuntu 内（训练用）

```bash
mkdir -p ~/robot/vendor && cd ~/robot/vendor
git clone --depth 1 https://github.com/pollen-robotics/microduck_rl.git
cd microduck_rl
```

> **训练在 WSL 里做**；STL 可在 Windows 下载给 Bambu Studio 用。

---

## 各仓库你要打开哪些路径

### Open_Duck_Mini

| 路径 | 内容 |
|------|------|
| `print/*.stl` | 全部打印件 |
| `docs/assembly_guide.md` | 官方组装 |
| `docs/configure_motors.md` | 舵机 ID |
| `BEST_WALK_ONNX_2.onnx` | 预训练走路策略（首走用） |

### microduck_rl

| 路径 | 内容 |
|------|------|
| `train_cli.py` / `uv run train` | 训练入口 |
| `scripts/export.py` | 导出 ONNX |
| `scripts/infer_policy.py` | 键盘试策略 |
| `AGENTS.md` | 给 AI/开发者看的约束 |

### Open_Duck_Mini_Runtime

| 路径 | 内容 |
|------|------|
| `scripts/configure_motor.py` | 舵机 ID |
| `scripts/check_motors.py` | 测 14 舵机 |
| `scripts/v2_rl_walk_mujoco.py` | 真机/仿真走 |
| `example_config.json` | 配置模板 |

---

## 版本锁定建议

记录在笔记本上，升级前备份：

```text
Open_Duck_Mini:     v2 @ <git log -1 --oneline>
microduck_rl:       main @ <commit>
Runtime:            v2 @ <commit>
PyTorch:            2.7.1+cu126
```

---

## 下一步

仿真：[02-simulation/microduck-rl](../02-simulation/microduck-rl.md)  
硬件 STL：`vendor/Open_Duck_Mini/print/`
