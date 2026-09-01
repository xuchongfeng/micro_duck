# 故障排查百科

按现象查找。仍无法解决 → Discord + 提 Issue（附 `nvidia-smi`、完整报错、已做步骤）。

---

## 仿真 / 训练

### nvidia-smi 在 WSL 失败

| 检查 | 操作 |
|------|------|
| Windows 驱动 | 重装 NVIDIA 驱动，重启 |
| WSL 版本 | `wsl -l -v` 为 Version 2 |
| 更新 WSL | `wsl --update` && `wsl --shutdown` |

### PyTorch CUDA False

→ [gtx1060-pytorch.md](../02-simulation/gtx1060-pytorch.md) 重装 `torch 2.7.1+cu126`

### no kernel image is available

PyTorch 版本不支持 Pascal → 必须用 **cu126** 的 2.7.1，勿用 cu128+。

### CUDA out of memory

减小 `--env.scene.num-envs`：4096→128→64。

### CUDA error 700

- 先 `num-envs 64` 冒烟
- 升级/锁定 `microduck_rl` 依赖版本
- 见 [mjlab#1108](https://github.com/mujocolab/mjlab/issues/1108)

### uv sync 超时

```bash
export UV_HTTP_TIMEOUT=600
uv sync
```

### train 找不到任务名

```bash
uv run list-envs
```

任务名以输出为准，区分大小写。

---

## 3D 打印

| 现象 | 处理 |
|------|------|
| 翘边 | Brim、擦酒精、升床温 |
| 舵机槽紧 | 砂纸修 0.2mm |
| TPU 堵头 | 减速、烘料、清理喷嘴 |
| 孔径小 | 勿强行拧，重打或略扩孔 |

→ [bambu-a1.md](../03-hardware/bambu-a1.md)

---

## 舵机 / 电气

| 现象 | 处理 |
|------|------|
| 全不动 | 舵机电源、USB 驱动板、总线 GND |
| 单个不动 | 该 ID 线、重新 configure_motor |
| 剧烈抖动 | 电压不足、ID 冲突、偏置错 |
| 腿反弯 | hip_pitch 装反、零位错 |
| 某 ID 超时 | 菊花链插头松动 |

→ [motor-config.md](../03-hardware/motor-config.md)

---

## 树莓派

| 现象 | 处理 |
|------|------|
| SSH 连不上 | IP、WiFi、Imager 预配置 |
| I2C 无设备 | `raspi-config` 启用 I2C |
| IMU 无数据 | 接线 3.3V、SDA/SCL |

---

## 首走

| 现象 | 处理 |
|------|------|
| 站不住 | 官方 ONNX 先试；偏置；地面 |
| 仿真好真机差 | [sim2real-tuning.md](../06-deployment/sim2real-tuning.md) |
| ONNX 乱扭 | 必须 `export.py` 导出 |

---

## 采购

| 现象 | 处理 |
|------|------|
| ¥8 舵机 | 假货/虚拟，退货 |
| 扭矩不够 | 确认 C001 7.4V 版 |

→ [servo-buying-guide.md](../03-hardware/servo-buying-guide.md)
