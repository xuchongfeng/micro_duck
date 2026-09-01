# 05 · RL 训练

从「会冒烟」到「有可部署的 ONNX」。

## 文档

| 文档 | 内容 |
|------|------|
| [gtx1060-tuning.md](gtx1060-tuning.md) | 1060 num-envs、挂机、恢复训练 |
| [export-onnx.md](export-onnx.md) | export.py、infer_policy 验证 |
| [hf-jobs.md](hf-jobs.md) | 云端 / HF Jobs / AutoDL |
| [policy-inventory.md](policy-inventory.md) | 需要训哪些策略 |
| [wandb.md](wandb.md) | 实验记录 |

## 流程图

```text
train (GPU) → wandb 曲线 → export.py → walk.onnx
                ↓
         infer_policy.py 仿真试走
                ↓
         复制到树莓派 → Runtime 加载
```

## 前置

[02-simulation](../02-simulation/index.md) 冒烟已通过。

## 后续

[06-deployment](../06-deployment/index.md)
