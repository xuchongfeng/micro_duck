# microduck_rl 从零到冒烟测试

本文：**第一次** 在电脑上跑通训练命令。假设已完成 [windows-setup](windows-setup.md) 和 [gtx1060-pytorch](gtx1060-pytorch.md)。

---

## 你将完成什么

运行一条训练命令，在几分钟内看到 **loss 下降、迭代计数增加**，证明仿真 + GPU + PPO 全链路正常。这叫做 **冒烟测试（smoke test）**。

---

## 第 1 步：进入项目目录

```bash
cd ~/robot/vendor/microduck_rl
```

确认有 `pyproject.toml`：

```bash
ls pyproject.toml
```

---

## 第 2 步：查看可训练任务

```bash
uv run list-envs
```

应列出包含 `Mjlab-Velocity-Flat-MicroDuck` 的任务（名称以仓库当前为准）。

---

## 第 3 步：冒烟训练（必做）

**完整复制** 以下命令（64 并行环境，只跑 5 次迭代，约 2–10 分钟）：

```bash
uv run train Mjlab-Velocity-Flat-MicroDuck \
  --env.scene.num-envs 64 \
  --agent.max_iterations 5
```

### 正常时你会看到

- 终端滚动日志，含 `iteration`、`reward` 等
- 另一终端 `watch -n 1 nvidia-smi` 可见 GPU 利用率上升
- 最终 **正常退出**（exit code 0），无 `CUDA out of memory`

### 若报错 OOM（显存不足）

```bash
uv run train Mjlab-Velocity-Flat-MicroDuck \
  --env.scene.num-envs 32 \
  --agent.max_iterations 5
```

仍 OOM → 试 `num-envs 16`。

### 若 CUDA error 700

多为 `num-envs` 过大或依赖版本问题。先坚持 `64`；仍失败查 [troubleshooting](../07-community/troubleshooting.md#cuda-error-700)。

---

## 第 4 步：可选 — 可视化播放（需 wandb 或本地 checkpoint）

冒烟不产生好策略。完整训练后会用：

```bash
uv run play Mjlab-Velocity-Flat-MicroDuck --wandb-run-path <entity/project/run_id>
```

初学可跳过，先完成第 5 步短训。

---

## 第 5 步：1060 短训（第一次「真」训练）

冒烟通过后，开始较短的全量训练（仍比官方 4096 env 小）：

```bash
uv run train Mjlab-Velocity-Flat-MicroDuck \
  --env.scene.num-envs 128 \
  --agent.run-name my-first-walk-1060
```

### 时间预期

| num-envs | GTX 1060 6GB 粗估 |
|----------|-------------------|
| 128 | 8–20 小时（可挂机过夜） |
| 256 | 4–12 小时（若显存够） |

### 挂机建议

- 笔记本请插电，电源选 **高性能**
- 防止 Ubuntu/WSL 睡眠：Windows 电源选项 → 从不休眠
- 使用 `tmux` 防 SSH 断线（可选）：

```bash
sudo apt install -y tmux
tmux new -s train
# 在 tmux 里运行 train 命令
# 断开会话：Ctrl+B 然后 D
# 恢复：tmux attach -t train
```

---

## 第 6 步：训练产物在哪

- 默认可能用 **Weights & Biases (wandb)** 记录；首次运行会提示登录
- 也可在终端日志里找 checkpoint 路径

注册 wandb（可选但推荐）：

1. https://wandb.ai 注册
2. 终端 `wandb login`，粘贴 API key

---

## 第 7 步：列出训练相关脚本

```bash
ls scripts/
```

重要文件：

| 文件 | 作用 |
|------|------|
| `scripts/export.py` | checkpoint → ONNX |
| `scripts/infer_policy.py` | 键盘试走路 |
| `scripts/hf/` | Hugging Face Jobs 云端训练 |

---

## 第 8 步：与真机的关系

| 阶段 | 你有的 | 还没有 |
|------|--------|--------|
| 现在 | 仿真里会走的策略（训练足够后） | 实体机器人 |
| 导出 ONNX 后 | 可在 CPU MuJoCo 键盘试 | 树莓派部署 |
| 买完硬件后 | 同一 ONNX 可烧进 Pi | — |

训练用的是 **Microduck 仿真模型**，与 Open Duck Mini **几何相近**；首台真机仍建议先用官方 `BEST_WALK_ONNX_2.onnx` 走通，再换自训策略。

---

## 完成检查

- [ ] 冒烟 `64 env × 5 iter` 成功
- [ ] 已启动或计划 `128 env` 完整训练
- [ ] 知道如何用 `nvidia-smi` 看显存

→ [hf-simulator.md](hf-simulator.md)（无需 GPU）  
→ [05-training/export-onnx.md](../05-training/export-onnx.md)（训练完成后）
