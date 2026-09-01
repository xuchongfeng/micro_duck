# GTX 1060 安装 PyTorch（Pascal 专用）

GTX 1060 架构代号 **Pascal（sm_61）**。2025 年后很多 PyTorch 新版本 **不再支持** 这块卡，装错会报：

```text
CUDA error: no kernel image is available for execution on the device
```

**必须用带 CUDA 12.6 且包含 sm_61 的 PyTorch 2.7.x 轮子。**

---

## 第 1 步：在 WSL Ubuntu 里操作

打开 **Ubuntu 22.04** 终端（不是 PowerShell）。

---

## 第 2 步：克隆 microduck_rl（若尚未）

```bash
cd ~/robot/vendor
git clone --depth 1 https://github.com/pollen-robotics/microduck_rl.git
cd microduck_rl
```

---

## 第 3 步：用 uv 同步依赖

```bash
uv sync
```

首次可能下载 **数 GB** CUDA 相关包，需 10–30 分钟，请保持网络畅通。

若 HTTP 超时：

```bash
export UV_HTTP_TIMEOUT=600
uv sync
```

---

## 第 4 步：验证 PyTorch 与 GPU

```bash
uv run python -c "
import torch
print('PyTorch:', torch.__version__)
print('CUDA available:', torch.cuda.is_available())
if torch.cuda.is_available():
    print('GPU:', torch.cuda.get_device_name(0))
    print('VRAM GB:', round(torch.cuda.get_device_properties(0).total_memory/1e9, 2))
"
```

### 期望输出（示例）

```text
PyTorch: 2.7.1+cu126
CUDA available: True
GPU: NVIDIA GeForce GTX 1060 6GB
VRAM GB: 6.44
```

### 若 CUDA available: False

1. WSL 里 `nvidia-smi` 是否正常
2. 是否误装 CPU 版 torch：

```bash
uv run python -c "import torch; print(torch.version.cuda)"
```

应显示 `12.6` 一类，不是 `None`。

### 手动固定 PyTorch（仅当 uv sync 装错时）

```bash
uv pip install torch==2.7.1 torchvision==0.22.1 --index-url https://download.pytorch.org/whl/cu126
```

然后重新运行验证命令。

---

## 第 5 步：显存占用基线

```bash
nvidia-smi
```

记下 **Memory-Usage**。训练前关闭 Windows 上占用 GPU 的程序（浏览器硬件加速、游戏等）。

1060 6GB 实际可用约 **5.5–5.8 GB**。

---

## 第 6 步：不支持的情形

| 显卡 | 能否本地训 microduck_rl |
|------|-------------------------|
| GTX 1060 6GB | ✅ 降 num-envs |
| GTX 1060 3GB | ❌ 建议 HF Jobs / 云 GPU |
| 仅 Intel 核显 / AMD | ❌ 用云端 |
| 笔记本 MUX 未切独显 | 修 BIOS/控制中心后再测 |

---

## 完成检查

- [ ] `torch.cuda.is_available()` 为 `True`
- [ ] GPU 名称为 GTX 1060
- [ ] `torch.version.cuda` 非空

→ [microduck-rl.md](microduck-rl.md)
