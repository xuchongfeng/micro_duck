# 常见问题 FAQ

---

## 项目选择

**Q: 买 Microduck 成品还是 DIY Open Duck Mini？**  
A: 本教程走 **Open Duck Mini**（硬件开源可打可改）。Microduck 硬件闭源，不适合「从 0 构建」内容。

**Q: 必须先仿真再买硬件吗？**  
A: 强烈建议。仿真通过再花 ¥1500+ 买舵机。

**Q: 苦工第一步做什么？**  
A: 标准鸭首走 → 路线 A 外皮。

---

## 电脑

**Q: GTX 1060 3GB 能训吗？**  
A: 非常勉强，建议云端或 HF Jobs。

**Q: 只用 Windows 不用 WSL 行吗？**  
A: 不推荐。训练请在 WSL2 Ubuntu 完成。

**Q: 没有 NVIDIA 显卡？**  
A: 浏览器 [HF 模拟器](../02-simulation/hf-simulator.md) + [云端训练](../05-training/hf-jobs.md)。

---

## 打印

**Q: 没有 A1 用别的打印机？**  
A: 成型尺寸 ≥220mm 即可；需 PLA+TPU、近程挤出更好。

**Q: 能找淘宝代打吗？**  
A: 可以，提供 `print/` 下全部 STL 和 [bambu-a1](../03-hardware/bambu-a1.md) 参数给商家。

---

## 组装

**Q: 不会焊接怎么办？**  
A: 需学基础焊接接电源；或请朋友/创客空间代焊电池部分。

**Q: 组装最难在哪？**  
A: **舵机零位 + hip_pitch 方向**。

---

## 法律

**Q: 能卖「魔兽世界苦工机器人」吗？**  
A: 商用有 IP 风险，见 [ip-notice.md](ip-notice.md)。

---

## 训练

**Q: 训练要多久？**  
A: 1060 上 128 env 常需 **一夜到一天** 量级。

**Q: 官方 ONNX 和自己训的哪个好？**  
A: 首走用官方；自训用于定制步态或苦工 MJCF。
