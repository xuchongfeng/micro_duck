# 导出 ONNX 与本地验证

训练得到 checkpoint 后，**必须** 用官方 `export.py` 导出 ONNX。不要手转权重，否则观测归一化错误，真机必摔。

---

## 第 1 步：确认有 wandb run

训练时若用了 `--agent.run-name xxx`，在 https://wandb.ai 找到对应 run，记下：

```text
entity/project/run_id
```

示例：`myuser/microduck_rl/abc123xyz`

---

## 第 2 步：导出

```bash
cd ~/robot/vendor/microduck_rl

uv run scripts/export.py Mjlab-Velocity-Flat-MicroDuck \
  --wandb-run-path myuser/microduck_rl/abc123xyz
```

成功后在当前目录或脚本提示路径生成 `*.onnx`。

复制到安全位置：

```bash
mkdir -p ~/robot/policies
cp output.onnx ~/robot/policies/walk_v1.onnx
```

---

## 第 3 步：CPU MuJoCo 键盘验证

```bash
uv run scripts/infer_policy.py --walking ~/robot/policies/walk_v1.onnx
```

应弹出或终端提示键盘控制仿真机器人行走。

### 常见问题

| 现象 | 原因 |
|------|------|
| 站不住 | 训练不足或 export 路径错 |
| 动作抽搐 | 用了非 export.py 的 onnx |
| 无法打开窗口 | WSL 需 X11/WSLg；或仅在无头模式看日志 |

WSL2 Win11 一般自带 **WSLg** 可弹窗；若不行，在 Windows 装 VcXsrv 或先在云端 play。

---

## 第 4 步：复制到树莓派（有硬件后）

```bash
# 在 WSL 或 Windows，替换 IP
scp ~/robot/policies/walk_v1.onnx pi@192.168.1.100:~/
```

树莓派上使用方式见 [06-deployment/first-walk.md](../06-deployment/first-walk.md)。

---

## 第 5 步：与官方预训练对比

Open Duck 官方预训练：

https://github.com/apirrone/Open_Duck_Mini/blob/v2/BEST_WALK_ONNX_2.onnx

建议 **首台真机先用官方 ONNX 走通**，再换自训文件。

---

## 检查清单

- [ ] ONNX 由 `scripts/export.py` 生成
- [ ] `infer_policy.py` 仿真里能走
- [ ] 文件已备份

→ [06-deployment](../06-deployment/index.md)
