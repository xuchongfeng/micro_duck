# 按关节分组的 3D 打印清单

STL 来源：[`Open_Duck_Mini/print`](https://github.com/apirrone/Open_Duck_Mini/tree/v2/print)（`v2` 分支）

**官方规则：** 除 `foot_bottom_tpu.stl` 外，全部 **PLA 15% 填充**；脚垫 **TPU 40% 填充**。

---

## 总览

| 统计项 | 数量 |
|--------|------|
| STL 种类 | 36 种 |
| 打印件总数 | **51 件** |
| PLA 件 | 49 |
| TPU 件 | 2 |
| 不可打印（必买） | 14× STS3215 + 2× 9g + 轴承等 |

---

## 1. 躯干中心（neck_pitch ID:30）

| STL | 数量 | 材料 | 关联硬件 |
|-----|------|------|----------|
| `trunk_bottom.stl` | 1 | PLA | 608ZZ ×2~3、M3 热熔螺母、ID:30 舵机 |
| `trunk_top.stl` | 1 | PLA | M3×10 与 bottom 合盖 |
| `roll_motor_bottom.stl` | 2 | PLA | 髋 yaw 下支架（左右） |
| `roll_motor_top.stl` | 2 | PLA | 髋 yaw 上支架 |

**必买：** STS3215 ×1（ID:30）+ 608ZZ 轴承 ×3（髋被动轴）

**组装要点：** 先压入轴承和热熔螺母，再装 ID:30 舵机；躯干是整机中心。

---

## 2. 右腿（舵机 ID: 10–14）

| STL | 数量 | 材料 | 关节 |
|-----|------|------|------|
| `right_roll_to_pitch.stl` | 1 | PLA | 髋 roll/pitch 连接 |
| `knee_to_ankle_right_sheet.stl` | 2 | PLA | 小腿侧板 |
| `knee_to_ankle_left_sheet.stl` | 2 | PLA | 小腿另一侧板（与左 sheet 配对） |
| `leg_spacer.stl` | 2 | PLA | 膝/大腿间距 |
| `foot_top.stl` | 1 | PLA | 右脚顶 |
| `foot_side.stl` | 1 | PLA | 右脚侧 |
| `foot_bottom_pla.stl` | 1 | PLA | 脚底硬层 |
| `foot_bottom_tpu.stl` | 1 | **TPU** | 脚底防滑 |

**必买：** STS3215 ×5（ID:10,11,12,13,14）+ SS-10 微动开关 ×2

| ID | 关节 |
|----|------|
| 10 | right_hip_yaw |
| 11 | right_hip_roll |
| 12 | right_hip_pitch |
| 13 | right_knee |
| 14 | right_ankle |

---

## 3. 左腿（舵机 ID: 20–24）

| STL | 数量 | 材料 | 说明 |
|-----|------|------|------|
| `left_roll_to_pitch.stl` | 1 | PLA | 左髋（镜像，勿与 right 混用） |
| `knee_to_ankle_right_sheet.stl` | 2 | PLA | 同右腿文件名 |
| `knee_to_ankle_left_sheet.stl` | 2 | PLA | 同右腿文件名 |
| `leg_spacer.stl` | 2 | PLA | |
| `foot_top.stl` | 1 | PLA | 左脚 |
| `foot_side.stl` | 1 | PLA | |
| `foot_bottom_pla.stl` | 1 | PLA | |
| `foot_bottom_tpu.stl` | 1 | **TPU** | |

**必买：** STS3215 ×5（ID:20–24）+ SS-10 ×2

---

## 4. 颈部

| STL | 数量 | 材料 | 舵机 |
|-----|------|------|------|
| `neck_left_sheet.stl` | 1 | PLA | 已含在躯干 ID:30 |
| `neck_right_sheet.stl` | 1 | PLA | |

> `neck_pitch` 舵机装在躯干上，颈片连接头与躯干。

---

## 5. 头部（舵机 ID: 31–33 + 天线）

| STL | 数量 | 材料 | 说明 |
|-----|------|------|------|
| `head.stl` | 1 | PLA | **最大件**，打印时间最长 |
| `head_pitch_to_yaw.stl` | 1 | PLA | ID:31 |
| `head_yaw_to_roll.stl` | 1 | PLA | ID:32 |
| `head_roll_mount.stl` | 1 | PLA | ID:33 |
| `head_bot_sheet.stl` | 1 | PLA | 头底板 |
| `left_antenna_holder.stl` | 1 | PLA | 9g 舵机 |
| `right_antenna_holder.stl` | 1 | PLA | 9g 舵机 |
| `left_cache.stl` | 1 | PLA | 装饰/走线盖 |
| `right_cache.stl` | 1 | PLA | |

**必买：** STS3215 ×3（31–33）+ 9g ×2 + 608ZZ ×1（头内）+ Pi Zero 2W

### 表情件（可选，不影响行走）

| STL | 数量 | 功能 |
|-----|------|------|
| `left_eye.stl` | 1 | LED 眼 |
| `right_eye.stl` | 1 | LED 眼 |
| `bulb.stl` | 1 | 投影灯 |
| `flash_light_module.stl` | 1 | 投影壳 |
| `flash_reflector_interface.stl` | 1 | 反光镜座 |
| `speaker_interface.stl` | 1 | 喇叭 |
| `speaker_stand.stl` | 1 | 喇叭架 |

---

## 6. 机身外壳 + 电池仓

| STL | 数量 | 材料 | 内容物 |
|-----|------|------|--------|
| `body_front.stl` | 1 | PLA | 前壳 |
| `body_middle_bottom.stl` | 1 | PLA | 电池仓下 |
| `body_middle_top.stl` | 1 | PLA | 电池仓上 |
| `body_back.stl` | 1 | PLA | 后壳 |
| `battery_pack_lid.stl` | 1 | PLA | 电池盖 |

**仓内：** 2S 18650、BMS、UBEC、Waveshare 舵机板、走线

---

## 7. 打印批次计划（拓竹 A1）

建议分 **4 批**，先小后大、先功能后装饰：

| 批次 | 文件 | 目的 | 预估时间* |
|------|------|------|-----------|
| **1 试打** | `foot_top`, `leg_spacer`, `trunk_bottom` | 验孔位、热熔螺母 | 4–6 h |
| **2 下肢** | 全部 foot_*、knee_*、leg_spacer、roll_*、left/right_roll_to_pitch | 试装舵机 | 12–18 h |
| **3 躯干头身** | trunk_top、neck_*、head_*（无表情）、body_*、battery_lid | 大件 | 18–28 h |
| **4 装饰** | eye、speaker、flash、antenna、cache | 可选 | 8–12 h |

\*单台 A1、0.2mm 层厚估算。

---

## 8. 完整 STL 对照表（官方 print_guide）

| # | STL 文件 | 数量 | 材料 |
|---|----------|------|------|
| 1 | foot_top.stl | 2 | PLA |
| 2 | foot_side.stl | 2 | PLA |
| 3 | foot_bottom_pla.stl | 2 | PLA |
| 4 | foot_bottom_tpu.stl | 2 | TPU |
| 5 | knee_to_ankle_left_sheet.stl | 4 | PLA |
| 6 | knee_to_ankle_right_sheet.stl | 4 | PLA |
| 7 | leg_spacer.stl | 4 | PLA |
| 8 | left_roll_to_pitch.stl | 1 | PLA |
| 9 | right_roll_to_pitch.stl | 1 | PLA |
| 10 | roll_motor_bottom.stl | 2 | PLA |
| 11 | roll_motor_top.stl | 2 | PLA |
| 12 | trunk_bottom.stl | 1 | PLA |
| 13 | trunk_top.stl | 1 | PLA |
| 14 | neck_left_sheet.stl | 1 | PLA |
| 15 | neck_right_sheet.stl | 1 | PLA |
| 16 | head_pitch_to_yaw.stl | 1 | PLA |
| 17 | head_yaw_to_roll.stl | 1 | PLA |
| 18 | head_roll_mount.stl | 1 | PLA |
| 19 | head.stl | 1 | PLA |
| 20 | head_bot_sheet.stl | 1 | PLA |
| 21 | left_antenna_holder.stl | 1 | PLA |
| 22 | right_antenna_holder.stl | 1 | PLA |
| 23 | left_cache.stl | 1 | PLA |
| 24 | right_cache.stl | 1 | PLA |
| 25 | body_front.stl | 1 | PLA |
| 26 | body_middle_bottom.stl | 1 | PLA |
| 27 | body_middle_top.stl | 1 | PLA |
| 28 | body_back.stl | 1 | PLA |
| 29 | battery_pack_lid.stl | 1 | PLA |
| 30–36 | 表情 7 件 | 各 1 | PLA |

详细打印参数见 [bambu-a1.md](bambu-a1.md)。
