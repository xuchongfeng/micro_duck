# GTX 1060 训练调参手册

在 [microduck-rl](../02-simulation/microduck-rl.md) 冒烟通过后，用本章优化 **速度、稳定性、显存**。

---

## 一、num-envs 选择流程

```text
从 64 冒烟成功
    → 试 128（1060 默认日常值）
    → nvidia-smi 显存 < 5.5G 且稳定 → 可试 256
    → OOM 则退回 64 或 96
```

| num-envs | 显存（粗估） | 速度 | 建议 |
|----------|--------------|------|------|
| 32 | 低 | 很慢 | 仅调试 |
| 64 | 安全 | 慢 | 冒烟、排错 |
| **128** | 中 | **1060 推荐** | 日常训练 |
| 256 | 高 | 较快 | 有余量再用 |
| 512+ | 极易 OOM | — | ❌ |

监控命令（另开终端）：

```bash
watch -n 1 nvidia-smi
```

---

## 二、完整训练命令模板

```bash
cd ~/robot/vendor/microduck_rl

uv run train Mjlab-Velocity-Flat-MicroDuck \
  --env.scene.num-envs 128 \
  --agent.run-name walk-1060-v1 \
  --agent.max_iterations 30000
```

> `max_iterations` 可与官方默认一致；1060 上整跑可能需 **数小时到一天**。可先试 `500` 看曲线是否上升。

---

## 三、训练前检查清单

- [ ] 关闭 Windows 游戏、浏览器大量标签
- [ ] WSL 内仅跑训练，勿同时开第二个 train
- [ ] 笔记本插电、高性能电源
- [ ] `df -h` 磁盘 > 10GB 可用
- [ ] 已 `wandb login`（若用 wandb）

---

## 四、如何判断「训得还行」

打开 wandb 网页或日志：

| 信号 | 含义 |
|------|------|
| mean reward 总体上升 | 正常学习 |
| 长期平坦 | 可能欠训或 reward 设计问题 |
| NaN / 爆炸 | 降学习率或减 num-envs |
| 频繁 OOM | 减 num-envs |

初学 **不必调 reward**，先用默认任务训到能 export 再在 `infer_policy.py` 看步态。

---

## 五、中断与恢复

Ctrl+C 停止后，若 checkpoint 已保存：

```bash
uv run train Mjlab-Velocity-Flat-MicroDuck \
  --env.scene.num-envs 128 \
  --agent.run-name walk-1060-v1 \
  --agent.load-checkpoint model_XXXXX.pt \
  --agent.resume True
```

`model_XXXXX.pt` 以你 wandb/日志目录实际文件名为准。

---

## 六、1060 vs 云端

| 场景 | 建议 |
|------|------|
| 学习、改 MJCF、调试 | 1060 本地 64–128 env |
| 苦工整机最终策略、4096 env | [hf-jobs.md](hf-jobs.md) 或 AutoDL |
| 3GB 显存 | 仅云端 |

---

## 七、训练后下一步

→ [export-onnx.md](export-onnx.md)
