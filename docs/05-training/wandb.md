# Weights & Biases 实验记录

wandb 用于记录每次训练的曲线、超参、checkpoint，强烈建议使用。

---

## 注册与登录

1. 打开 https://wandb.ai 注册
2. WSL 终端：

```bash
cd ~/robot/vendor/microduck_rl
uv run wandb login
```

粘贴 API Key。

---

## 训练时自动上传

`uv run train ...` 默认可能创建 wandb run。浏览器打开项目页可看：

- reward 曲线
- episode length
- 系统 GPU 使用率

---

## 命名规范建议

```bash
--agent.run-name walk-1060-128env-v1
--agent.run-name peon-walk-v1-mjcf-0.1
```

便于一个月后仍能分辨。

---

## 从 wandb 导出 ONNX

export 时需要：

```text
--wandb-run-path <entity>/<project>/<run_id>
```

在 wandb 网页 run 概览右侧可复制 path。

---

## 离线 / 不用 wandb

若坚持离线，查 `microduck_rl` 文档是否支持 `--agent.logger none` 等 flags；checkpoint 路径在本地 `logs/` 或 `outputs/`（以仓库为准）。

初学 **建议开启 wandb**，排错容易得多。
