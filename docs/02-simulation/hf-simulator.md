# Hugging Face 浏览器模拟器

**不需要安装任何软件**，就能在浏览器里看 RL 策略驱动的鸭子走路。适合：

- 仿真环境还没装好之前，先建立直观认识
- 给非技术人员演示
- 对照自训策略和官方策略的差异

---

## 第 1 步：打开页面

链接：**https://huggingface.co/spaces/pollen-robotics/microduck-simulator**

推荐浏览器：**Chrome** 或 **Edge**（Firefox 可能卡顿）。

---

## 第 2 步：等待加载

首次打开需下载 WASM 资源，可能 **1–3 分钟**。看到 3D 场景和鸭子即成功。

---

## 第 3 步：操作方式

| 操作 | 键盘 | 说明 |
|------|------|------|
| 移动 | `W A S D` | 与 AZERTY 布局文档可能写 ZQSD，QWERTY 用 WASD |
| 切换轮滑模式 | 按住 `M` 或菜单 | 第二种策略 |
| 游戏手柄 | 连接后按提示 | 与真机手柄逻辑接近 |

---

## 第 4 步：理解你在看什么

- **MuJoCo** 在浏览器里用 WebAssembly 跑物理
- **ONNX** 策略在本地 `onnxruntime-web` 推理，50 Hz
- 与 `microduck_rl/scripts/infer_policy.py` 同一套观测维度（61 维）

这不是「视频」，是 **实时仿真 + 神经网络控制**。

---

## 第 5 步：和本项目的联系

| 你在浏览器玩的 | 你在 1060 上训练的 |
|----------------|-------------------|
| 预置 ONNX 策略 | 自己的 checkpoint → export ONNX |
| Microduck 外形 MJCF | 同系列仿真（Open Duck 相近） |
| 无需 GPU | 需要 CUDA |

---

## 故障

| 现象 | 处理 |
|------|------|
| 一直 Loading | 换 Chrome；关广告拦截 |
| 极卡 | 关其他标签；降低系统负载 |
| 黑屏 | 刷新；检查 WebGL 是否被禁用 |

---

## 下一步

本地训练：[microduck-rl.md](microduck-rl.md)  
总索引：[02-simulation/index.md](index.md)
