# 前置条件清单

打勾表示你已具备或愿意购买。**仿真阶段**只需「电脑」部分；**硬件阶段**再准备其余。

---

## 一、电脑（仿真 Phase 1 必需）

| 项目 | 最低要求 | 你的配置 | 说明 |
|------|----------|----------|------|
| 操作系统 | Windows 10/11 64 位 | Windows | 建议专业版，家庭版也可 |
| CPU | 4 核以上 | — | 训练时 CPU 也会忙 |
| 内存 | **16 GB** 推荐 | — | 8 GB 可试，易卡 |
| 硬盘空余 | **50 GB+** | — | 含 WSL、Python、仿真数据 |
| 显卡 | NVIDIA，支持 CUDA | **GTX 1060 6GB** | 见下方驱动说明 |
| 网络 | 能访问 GitHub、Hugging Face | — | 下载代码与模型 |

### 显卡驱动（必做）

1. 打开 https://www.nvidia.cn/Download/index.aspx
2. 选择 **GeForce GTX 1060 6GB**、你的 Windows 版本
3. 下载并安装 **Game Ready 或 Studio 驱动**（建议 **535 或更新**）
4. 安装后重启电脑
5. 验证：按 `Win+R`，输入 `cmd`，回车，输入：

```text
nvidia-smi
```

应看到 GTX 1060 和驱动版本号。若提示不是命令，说明驱动未装好。

---

## 二、软件（按章节安装，不必一次装完）

| 软件 | 何时需要 | 安装文档 |
|------|----------|----------|
| Git for Windows | 第 1 天 | 下文 |
| WSL2 + Ubuntu 22.04 | 仿真训练 | [02-simulation/windows-setup](../02-simulation/windows-setup.md) |
| PyTorch 2.7.1+cu126 | 仿真训练 | [02-simulation/gtx1060-pytorch](../02-simulation/gtx1060-pytorch.md) |
| Python 3.10+（在 WSL 内） | 随 microduck_rl | [02-simulation/microduck-rl](../02-simulation/microduck-rl.md) |
| 浏览器 Chrome/Edge | 第 1 天 | 玩 HF 模拟器 |
| Bambu Studio | 买打印机后 | [03-hardware/bambu-a1](../03-hardware/bambu-a1.md) |

### Git 安装（Windows）

1. 打开 https://git-scm.com/download/win
2. 下载 64-bit 安装包，一路 **Next**（默认即可）
3. 安装完成后打开 **PowerShell**，输入：

```powershell
git --version
```

应显示 `git version 2.x.x`。

---

## 三、3D 打印（硬件 Phase 2）

| 项目 | 要求 |
|------|------|
| 打印机 | 拓竹 **Bambu Lab A1**（256×256×256 mm） |
| 耗材 | PLA 1kg + TPU 95A 250g |
| 摆放空间 | 通风、稳固桌面 |

**仿真阶段不需要打印机。**

---

## 四、机器人硬件（硬件 Phase 2–3）

完整表见 [03-hardware/bom-cn.md](../03-hardware/bom-cn.md)。

**最低采购集（能走起来）：**

- STS3215 ×14
- Pi Zero 2W + 32GB SD
- Waveshare 舵机板 + BNO055
- 电源、轴承、开关、螺丝、线材
- 自打或代打全部 STL

预算约 **¥1900–2900**（不含打印机）。

---

## 五、工具（组装时）

| 工具 | 必需？ |
|------|--------|
| 电烙铁 + 焊锡 | ✅ 接线 |
| M2/M3 内六角 | ✅ |
| 热熔螺母烙铁头 | ✅ 强烈推荐 |
| 万用表 | 强烈推荐 |
| 游标卡尺 | 推荐（验打印孔） |
| 螺纹胶乐泰 243 | ✅ |
| Xbox/PS 蓝牙手柄 | 推荐（遥控走） |

---

## 六、技能预期（不会也可以学）

| 技能 | 难度 | 本教程是否覆盖 |
|------|------|----------------|
| 复制粘贴命令行 | ★☆☆ | ✅ 逐步给出 |
| 3D 打印切片 | ★★☆ | ✅ bambu-a1 |
| 基础焊接 | ★★☆ | ✅ assembly + wiring |
| Python 编程 | ★★☆ | 仿真阶段会用到少量 |
| RL 理论 | ★★★★ | 不必须；按命令训练即可 |

---

## 七、时间预算（业余）

| 阶段 | 小时级估算 |
|------|------------|
| 环境搭建 | 4–8 h |
| 首次冒烟训练 | 2–4 h |
| 首次完整 walk 训练 | 8–24 h（含挂机） |
| 打印全部零件 | 60–80 h 打印机时间 |
| 首次组装 | 15–25 h |
| 首走调试 | 4–10 h |

---

## 八、检查：我可以开始仿真了吗？

- [ ] Windows 10/11 64 位
- [ ] 16 GB 内存（或接受较慢）
- [ ] `nvidia-smi` 能看到 GTX 1060
- [ ] 能打开 GitHub 和 Hugging Face
- [ ] 已读 [glossary](../glossary.md) 基本术语

全部打勾 → [02-simulation/windows-setup](../02-simulation/windows-setup.md)
