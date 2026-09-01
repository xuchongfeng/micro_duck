# 路线 A：外皮 + 语音（不改策略）

**最快出效果**，适合拍视频、验证受众。

---

## 第 1 步：保持标准鸭机械不变

不重训、不改舵机位置。只在 **外观** 动手。

---

## 第 2 步：设计头壳（Fusion 360 / Blender）

1. 导入或参照官方 `head.stl` 外形尺寸（游标卡尺测真机）
2. 设计 **薄壁空心** 外壳（壁厚 2–3mm）
3. 留孔：相机、USB、散热
4. 导出 STL → A1 打印（PLA，15% 填充）

打印参数同 [bambu-a1.md](../03-hardware/bambu-a1.md)。

---

## 第 3 步：涂装

| 方法 | 说明 |
|------|------|
| 双色 PLA | 绿 + 棕，分件打印 |
| 喷漆 | 底漆 + 绿 + 哑光保护漆 |
| 丙烯 | 手工涂装，适合细节 |

---

## 第 4 步：镐子道具

1. 设计轻量空心镐，`peon/cad/pickaxe.stl`
2. 用 M3 螺丝固定肩侧 **不拧进舵机壳**
3. 质量 < 30g

---

## 第 5 步：语音（树莓派）

1. 准备 **可商用** 或自录 wav 文件，放 `peon/audio/`
2. Runtime 或自写 Python：按钮/NFC/GPIO 触发 `aplay`
3. 示例逻辑：

```python
# 伪代码 — 实际集成到 Runtime 或独立脚本
import subprocess
subprocess.run(["aplay", "/home/pi/peon/audio/work.wav"])
```

3. 手柄某键触发「劳动」音效

**勿** 直接分发暴雪游戏提取音频用于商用产品。

---

## 第 6 步：验证

- [ ] 外壳不影响头转动
- [ ] 镐子不碰地、不卡腿
- [ ] 仍用 `BEST_WALK_ONNX_2.onnx` 能走
- [ ] 录像发 build-log

---

## 完成标准

外观像苦工、行为仍是鸭子策略 — **可接受**，这就是路线 A。

要驼背步态 → [route-b-mechanical.md](route-b-mechanical.md)
