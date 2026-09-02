# 02 · 仿真环境

在 **Windows + WSL2 + GTX 1060 6GB** 上跑通 RL 训练全流程。**不买硬件也能完成本章。**

---

## 本章文档（按顺序读）

| 顺序 | 文档 | 预计耗时 |
|------|------|----------|
| 0 | [microduck-official-path.md](microduck-official-path.md) | 15 min（总览，先读） |
| 1 | [hf-simulator.md](hf-simulator.md) | 10 min（零安装） |
| 2 | [windows-setup.md](windows-setup.md) | 1–2 h |
| 3 | [gtx1060-pytorch.md](gtx1060-pytorch.md) | 30 min |
| 4 | [microduck-rl.md](microduck-rl.md) | 30 min + 挂机训练 |
| 5 | [../05-training/gtx1060-tuning.md](../05-training/gtx1060-tuning.md) | 参考 |
| 6 | [../05-training/export-onnx.md](../05-training/export-onnx.md) | 训练完成后 |

## 阶段目标

- [ ] 浏览器模拟器玩过
- [ ] WSL `nvidia-smi` 见 1060
- [ ] PyTorch CUDA True
- [ ] 冒烟 `64×5` 通过
- [ ] `128 env` 训练完成至少 1 次
- [ ] 导出 ONNX 并在 `infer_policy.py` 试过

## 1060 铁律

| 参数 | 值 |
|------|-----|
| PyTorch | 2.7.1+cu126 |
| 冒烟 | num-envs=64, max_iterations=5 |
| 日常 | num-envs=128 |
| 禁止 | num-envs=4096 |

## 仿真通过后

👉 [03-hardware 采购与打印](../03-hardware/index.md)

## 云端备选

本地太慢或失败 → [05-training/hf-jobs.md](../05-training/hf-jobs.md)
