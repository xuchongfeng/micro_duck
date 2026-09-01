# Hugging Face Jobs 云端训练

当 GTX 1060 太慢、OOM、或需要 `num-envs=4096` 时，用 Hugging Face Jobs 在云端 GPU 训练。

---

## 何时使用

| 情况 | 用 Jobs |
|------|---------|
| 1060 训一夜仍不够好 | ✅ |
| 苦工新 MJCF 需大量试验 | ✅ |
| 只是冒烟测试 | ❌ 本地 64 env 即可 |
| 无 NVIDIA 显卡 | ✅ |

---

## 第 1 步：Hugging Face 账号

1. 注册 https://huggingface.co
2. 创建 Access Token（Settings → Access Tokens，权限含 write）

```bash
pip install huggingface_hub
huggingface-cli login
```

粘贴 token。

---

## 第 2 步：在 microduck_rl 使用 --hf-jobs

阅读仓库内说明：

```bash
cd ~/robot/vendor/microduck_rl
cat scripts/hf/README.md
```

典型命令形式（以仓库最新文档为准）：

```bash
uv run train Mjlab-Velocity-Flat-MicroDuck \
  --env.scene.num-envs 4096 \
  --hf-jobs
```

首次会提示配置 HF Jobs 相关参数。

---

## 第 3 步：费用与额度

- HF 可能有免费额度；超额按 GPU 时长计费
- Microduck Dev Pack 含部分 HF 额度（若购买官方 Dev Pack）
- 国内也可选 **AutoDL / 恒源云** 租 3090，按小时付费，手动 SSH 跑同样 `uv run train` 命令

---

## 第 4 步：云端训完

1. 从 wandb 或 HF 作业日志拿到 run path
2. 本地 `scripts/export.py` 导出 ONNX（可在本机 export，不必在云端）

---

## AutoDL 简易流程（替代 HF Jobs）

1. 注册 AutoDL，租 **RTX 3090 / 4090** 实例，选 Ubuntu 22.04 + CUDA 镜像
2. SSH 登录，克隆 `microduck_rl`，`uv sync`
3. 运行 `uv run train ... --env.scene.num-envs 4096`
4. 下载 checkpoint / onnx 到本机

---

## 下一步

导出：[export-onnx.md](export-onnx.md)
