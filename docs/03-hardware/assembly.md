# 组装指南

基于 [Open Duck Mini v2 官方 assembly_guide](https://github.com/apirrone/Open_Duck_Mini/blob/v2/docs/assembly_guide.md)，补充顺序、扭矩与常见错误。

**前置：** [舵机已标定 ID](motor-config.md) · [打印件质检通过](bambu-a1.md#六打印后质检清单)

---

## 一、工具与耗材

| 物品 | 用途 |
|------|------|
| 内六角 M2/M3 | 结构螺丝 |
| 乐泰 243 螺纹胶 | **金属螺丝拧入舵机金属孔** |
| 电烙铁 | 脚开关、电源线 |
| 热熔螺母工具 | 已压入的孔复核 |
| 塑料螺丝 | 舵机附带 — **禁用螺纹胶** |

> 官方提示：凡 **金属螺丝进舵机金属壳** 必须少量螺纹胶，防行走振动松脱。

---

## 二、推荐组装顺序

```
0. 14 舵机 ID 标定（已完成）
1. 躯干 trunk（轴承 + ID:30）
2. 双脚 foot（各含踝舵机 + 微动开关）
3. 双小腿 shin（膝 + 踝连杆）
4. 双大腿 thigh（注意 hip_pitch 朝向）
5. 双髋 hip（roll_motor_top/bottom + roll_to_pitch）
6. 双腿挂到躯干
7. 颈部 neck
8. 头机构 head（ID 31–33）+ Pi + IMU
9. 舵机驱动板 + 布线
10. 电池 pack + body 外壳合盖
11. 表情件（可选）
```

预计耗时：**熟练 8–12 h，首次 15–20 h**。

---

## 三、分步说明

### 3.1 躯干 `trunk_bottom` + `trunk_top`

1. 在 `trunk_bottom` 压入 **608ZZ 轴承**
2. 压入 **M3 热熔螺母**（底部 4 孔用于后续装 body）
3. `trunk_bottom` + `trunk_top` 用 **2× M3×10** 合盖
4. 安装 **neck_pitch 舵机 ID:30**（塑料螺丝）
5. 插入 `roll_motor_bottom` ×2 导向座

**检查：** 轴承转动顺滑，无塑料屑。

---

### 3.2 脚 `foot_*`

每只脚相同，**共 2 只**（左/右各一，结构镜像）。

1. `foot_bottom_tpu` + `foot_bottom_pla` 合体，**M3×6 ×2**
2. `foot_top` 压热熔螺母
3. 安装 **踝舵机 ID:14 或 24**（driver 面朝 `foot_top` 侧）
4. 装入 **SS-10 微动开关** — 压入，脚着地时触发

**检查：** 开关按下有清脆咔哒；舵机线从 sheet 孔穿出。

---

### 3.3 小腿 `shin`

1. `leg_spacer` 两侧各压 **2 个 M3 螺母**（共 4）
2. 踝舵机线穿过 `knee_to_ankle_*_sheet`
3. 按官方图组装膝-踝连杆

---

### 3.4 大腿 `thigh`

⚠️ **关键：** `hip_pitch` 舵机（ID:12 / 22）安装方向必须与官方图一致，否则零位错误腿向后弯。

对照 Onshape CAD 或 assembly_guide 大图。

---

### 3.5 髋 `hip`

1. 装 `left/right_roll_to_pitch`（**左右件不可混用**）
2. `roll_motor_top` 固定到 **hip_yaw 舵机**（ID:10 或 20），从底部拧螺丝
3. 装 `hip_roll` 舵机（ID:11 或 21）
4. 整体插入躯干 `roll_motor_bottom` 槽
5. 塑料螺丝锁紧

重复另一侧。

---

### 3.6 挂腿

将完整腿装到躯干髋 pitch 轴上，重复双腿。

此时机器人应能 **站立扶持**（电源未开）。

---

### 3.7 颈 + 头

1. `neck_left/right_sheet` 与躯干 ID:30 连接
2. 头机构：`head_pitch_to_yaw` → `head_yaw_to_roll` → `head_roll_mount`
3. 可提前插入 `head_bot_sheet`、`body_middle_top` 避免后期拆头
4. `head.stl` 外壳内：压螺母、**608ZZ**、装 Pi Zero 2W、9g 天线舵机

---

### 3.8 电控

#### 舵机驱动板

按官方接线图连接 **14 舵机菊花链** → Waveshare 板 → Pi UART。

#### IMU BNO055

| BNO055 | Pi Zero |
|--------|---------|
| VIN | 3.3V (pin 1) |
| GND | GND (pin 9) |
| SDA | GPIO2 (pin 3) |
| SCL | GPIO3 (pin 5) |

> 尽量按自然方向安装；装反可在 `duck_config.json` 配置。

#### 脚开关

| 脚 | Pi GPIO |
|----|---------|
| 左 | GPIO 22 (pin 15) |
| 右 | GPIO 27 (pin 13) |

#### 天线 PWM

| 天线 | GPIO |
|------|------|
| 左 | GPIO 12 |
| 右 | GPIO 13 |

完整引脚表见 [官方 assembly_guide 电子章节](https://github.com/apirrone/Open_Duck_Mini/blob/v2/docs/assembly_guide.md#electronics)。

---

### 3.9 电池与机身

1. 2S 18650 + BMS 焊接（**同电压入盒**）
2. XT30 / 开关 / UBEC 5V → Pi
3. 主电源 → 舵机总线（注意极性）
4. 安装 `body_middle_bottom` → `body_middle_top` → `body_front` → `battery_pack` → `body_back`
5. `battery_pack_lid` 盖上

---

## 四、上电前检查清单

- [ ] 无金属屑、无短路
- [ ] 电池极性正确
- [ ] 14 舵机 ID 唯一
- [ ] 脚开关未常闭短路
- [ ] Pi SD 已刷系统 + Runtime
- [ ] 首次上电 **手扶机身**，随时准备断电

---

## 五、首次软件

见 [06-deployment/first-walk.md](../06-deployment/first-walk.md)：

```bash
python scripts/check_motors.py
python scripts/v2_rl_walk_mujoco.py --onnx_model_path ~/BEST_WALK_ONNX_2.onnx
```

---

## 六、常见组装错误

| 现象 | 可能原因 |
|------|----------|
| 腿反向弯曲 | hip_pitch 装反 / 零位错 |
| 某个关节不动 | ID 重复 / 线松 |
| 一上电剧烈抖动 | 电源不足 / 舵机相位错 |
| 站不稳 | IMU 未校准 / 策略未加载 |
| 螺丝很快松 | 金属接金属未用螺纹胶 |

---

## 七、苦工改造时的组装注意

| 路线 | 组装影响 |
|------|----------|
| A 外皮 | 标准组装完成后再套外壳 |
| B 改比例 | 新 CAD 件替换对应段，**重新标定零位** |
| 头加重 | 电池尽量放低，先测站立再训策略 |

---

相关：[design-overview.md](design-overview.md) · [motor-config.md](motor-config.md) · [04-peon](../04-peon/index.md)
