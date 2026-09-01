# 完整接线说明

本文补充 [assembly.md](assembly.md) 的电子细节。**焊接前务必断电**，电池不接舵机测试时用 USB 5V 仅给 Pi 供电。

---

## 一、系统框图

```text
[2S 18650 + BMS] ──→ XT30 ──→ 舵机总线电源（7.4V）
                    │
                    └──→ UBEC 5V ──→ Raspberry Pi Zero 2W
                                    │
                    [Waveshare 舵机板] ←USB/UART→ Pi
                           │
                    STS3215 菊花链 ×14

[BNO055] ──I2C──→ Pi
[脚开关 ×4] ──GPIO──→ Pi
[9g 天线 ×2] ──PWM GPIO──→ Pi
[MAX98357A + 喇叭] ──I2S──→ Pi（可选）
[LED 眼] ──GPIO──→ Pi（可选）
```

---

## 二、树莓派 Zero 2W 引脚（40PIN）

官方 assembly_guide 摘录：

### 脚着地开关

| 功能 | GPIO | 物理 Pin |
|------|------|----------|
| 左脚 | GPIO 22 | 15 |
| 右脚 | GPIO 27 | 13 |
| GND | GND | 9 |

开关一脚接 GPIO，一脚接 GND；脚着地时 **闭合**（具体以你 SS-10 安装方向为准，装后万用表蜂鸣档测）。

### BNO055 IMU

| BNO055 | Pi |
|--------|-----|
| VIN | 3.3V (pin 1) |
| GND | GND (pin 9) |
| SDA | GPIO2 (pin 3) |
| SCL | GPIO3 (pin 5) |

3.3V 供电，**不要接 5V 到 VIN**（视模块丝印，多数 GY-BNO055 用 3.3V）。

### 天线 9g 舵机（PWM）

| 天线 | GPIO | Pin |
|------|------|-----|
| 左 PWM | GPIO 12 | 32 |
| 右 PWM | GPIO 13 | 33 |
| 5V | 5V | 2 |
| GND | GND | 6 |

### 眼睛 LED（可选）

| LED | GPIO | Pin |
|-----|------|-----|
| 左眼+ | GPIO 23 | 16 |
| 右眼+ | GPIO 24 | 18 |
| 公共阴极 | GND | 6 |

限流电阻建议 220Ω–1kΩ 串联。

### MAX98357A 喇叭（可选）

| MAX98357A | GPIO | Pin |
|-----------|------|-----|
| LRC | GPIO 19 | 35 |
| BCLK | GPIO 18 | 12 |
| DIN | GPIO 21 | 40 |
| VIN | 5V | 2 |
| GND | GND | 6 |

教程：https://learn.adafruit.com/adafruit-max98357-i2s-class-d-mono-amp

---

## 三、舵机总线

1. **Waveshare 半双工舵机驱动板** USB 接 Pi
2. 板子 **TTL 半双工** 口接 **第一只舵机** 的信号线
3. 14 只舵机 **菊花链** 串联（注意插头方向，参照板子说明书）
4. **共地**：舵机电源 GND 与 Pi GND 最终在电源处共地，避免地环路噪声

### 电源

- 2S 满电约 8.4V，在 STS3215 允许范围内
- **不要** 用 Pi 的 5V 引脚直接带 14 个舵机
- 上电顺序建议：先 Pi，后舵机大电流（或通过开关）

---

## 四、电池焊接安全

1. 电芯 **同品牌同容量**，入库电压一致
2. BMS 焊点牢固，绝缘热缩管包好
3. 极性反接会烧毁设备 — 用万用表测 XT30 输出后再接舵机
4. 首次上电 **冒烟/发热** 立即断电

---

## 五、线材整理

- 关节活动处留 **活动余量**，用尼龙扎带固定到静止结构
- 避免线卡在齿轮间
- 头内 Pi 与舵机线分层固定

---

## 六、上电前万用表检查

| 测量点 | 期望 |
|--------|------|
| UBEC 输出 | 5.0V ±0.2 |
| 舵机总线（未负载） | 7.4–8.4V |
| Pi 3.3V 脚 | 3.3V |
| 电池两极短路 | **绝不可短路** |

---

## 七、官方图

克隆 `Open_Duck_Mini` 后查看：

- `docs/open_duck_mini_v2_wiring_diagram.png`
- `docs/wiring.png`

与本文冲突时 **以官方图为准**。

---

## 下一步

[06-deployment/runtime.md](../06-deployment/runtime.md)
