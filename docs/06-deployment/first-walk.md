# 首次行走（First Walk）

目标：机器人站在地上，用 **官方或自训 ONNX** 走几步。

---

## 安全准备

1. 机器人放在 **软垫/地毯** 上
2. **一只手** 随时准备扶住或断电
3. 周围 2 米无人无易碎物
4. 舵机电源、Pi 电源 接线复查

---

## 第 1 步：获取 ONNX

### 方案 A — 官方预训练（推荐首走）

在 **电脑** 上下载：

https://github.com/apirrone/Open_Duck_Mini/raw/v2/BEST_WALK_ONNX_2.onnx

### 方案 B — 自己训练的

见 [05-training/export-onnx.md](../05-training/export-onnx.md)

---

## 第 2 步：复制到树莓派

在 **Windows PowerShell**（改 IP）：

```powershell
scp D:\robot\BEST_WALK_ONNX_2.onnx pi@duck-bot.local:~/
```

或在 Pi 上 `wget` 上述 URL（若网络可达 GitHub）。

---

## 第 3 步：运行行走脚本

SSH 到 Pi：

```bash
workon open-duck-mini-runtime
cd ~/Open_Duck_Mini_Runtime/scripts

python v2_rl_walk_mujoco.py --onnx_model_path ~/BEST_WALK_ONNX_2.onnx
```

（脚本名以 Runtime v2 为准，若不同请 `ls scripts/*.py`）

---

## 第 4 步：手柄操作（若已配对）

常见按键（以 Runtime 文档为准）：

| 键 | 功能 |
|----|------|
| A | 暂停/继续 |
| LB 长按 | 加速走 |
| 摇杆 | 转向/速度 |

---

## 第 5 步：预期现象

| 正常 | 异常 |
|------|------|
| 几秒后站起尝试步态 | 剧烈抖动 → 断电，查 ID/偏置 |
| 可慢速前进 | 腿反弯 → hip_pitch 装反或零位错 |
| 摔落后可手动扶起再试 | 完全不动 → check_motors |

---

## 第 6 步：记录

在 [07-community/build-log.md](../07-community/build-log.md) 记下：

- 日期、ONNX 文件名
- 现象、视频链接
- `duck_config.json` 是否改偏置

---

## 下一步

调 sim2real：[sim2real-tuning.md](sim2real-tuning.md)  
苦工：[04-peon](../04-peon/index.md)
