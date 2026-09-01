# 策略清单：要训练哪些 ONNX

Open Duck / Microduck 体系在机载 **热切换** 多个策略（走、站、起、坐等）。初学可分批完成。

---

## 标准鸭首走（最低集）

| 优先级 | 策略 | 是否必须 | 来源 |
|--------|------|----------|------|
| P0 | **walk** 行走 | ✅ | 官方 `BEST_WALK_ONNX_2.onnx` 或自训 |
| P1 | stand 站立 | 推荐 | 官方/自训 |
| P2 | get_up 起身 | 推荐 | 官方/自训 |

**第一台机器：** 只需 **walk** 即可手柄走起来。

---

## microduck_rl 任务名（以 `list-envs` 为准）

```bash
uv run list-envs
```

常见包含 `Mjlab-Velocity-Flat-MicroDuck` 等；具体 stand/recover 任务名随仓库更新，**以你克隆的版本为准**。

---

## 训练顺序建议

```text
1. walk（flat 平地）
2. stand / idle
3. recover / get_up
4. （可选）带障碍、斜坡 — 进阶
```

每完成一个：

```bash
uv run scripts/export.py <TASK_ID> --wandb-run-path ...
```

---

## 机载如何使用多 ONNX

Runtime 按名称加载多个文件，运行时切换（walk / stand / trick）。仿真阶段用 `infer_policy.py` 可 rehearsal 多策略：

```bash
uv run scripts/infer_policy.py \
  --walking walk.onnx \
  --standing stand.onnx
```

参数以仓库 `infer_policy.py --help` 为准。

---

## 苦工改造后

改 MJCF 后 **上述全部需重训**，不能复用鸭子 ONNX。见 [04-peon/retrain-checklist.md](../04-peon/retrain-checklist.md)。
