# 苦工策略重训清单

复制本页为检查表，逐项打勾。

---

## 准备

- [ ] 路线 B 机械组装完成，无干涉
- [ ] MJCF 已提交版本管理
- [ ] `list-envs` 可见 Peon 任务
- [ ] WSL `nvidia-smi` 正常

---

## 训练（1060）

- [ ] 冒烟 `64 env × 5 iter`
- [ ] walk：`128 env`，wandb 命名 `peon-walk-v1`
- [ ] stand / get_up：按 [policy-inventory](../05-training/policy-inventory.md)
- [ ] 曲线 reward 上升

---

## 导出

- [ ] `scripts/export.py` 每个策略一个 onnx
- [ ] `infer_policy.py` 仿真验证
- [ ] 复制到 `peon/policies/`

---

## 真机

- [ ] `find_soft_offsets.py` 重新做（机械变了）
- [ ] 软垫上单手扶住首走
- [ ] [sim2real-tuning](../06-deployment/sim2real-tuning.md)

---

## 云端（可选）

若 1060 训不满意：

- [ ] [hf-jobs](../05-training/hf-jobs.md) `4096 env` 重训 walk
- [ ] 下载 export 覆盖本地

---

## 路线 A 跳过

仅外皮 **不需要** 本清单。
