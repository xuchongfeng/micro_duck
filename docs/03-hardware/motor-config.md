# 舵机标定（组装前必做）

> **在组装整机之前**，逐个配置 14 个 STS3215 的 **总线 ID** 和 **零位**。  
> 官方说明：[configure_motors.md](https://github.com/apirrone/Open_Duck_Mini/blob/v2/docs/configure_motors.md)

---

## 一、为什么必须先标定

| 若跳过 | 后果 |
|--------|------|
| ID 全为默认 1 | 总线冲突，只动一个或乱动 |
| 零位装错 | 腿反弯、站不起来 |
| 后期再拆 | 重装工作量翻倍 |

标定后可在 `duck_config.json` 里写 **关节偏置** 微调，但大方向必须在装舵盘时对齐。

---

## 二、准备工具

| 物品 | 用途 |
|------|------|
| STS3215 ×14 | 待配置 |
| 7.4V 舵机电源 | 2S 电池包或可调电源 **6–8.4V** |
| Waveshare 驱动板 + USB 转 TTL | 连电脑 |
| 或 | 已装 Runtime 的树莓派 + 电池 |
| 笔记本电脑 | 运行 `configure_motor.py` |

### 软件

```bash
git clone -b v2 https://github.com/apirrone/Open_Duck_Mini_Runtime.git
cd Open_Duck_Mini_Runtime
pip install -e .
```

---

## 三、ID 分配表（背下来）

```python
# 右腿
"right_hip_yaw":    10
"right_hip_roll":   11
"right_hip_pitch":  12
"right_knee":       13
"right_ankle":      14

# 左腿
"left_hip_yaw":     20
"left_hip_roll":    21
"left_hip_pitch":   22
"left_knee":        23
"left_ankle":       24

# 躯干 / 头
"neck_pitch":       30
"head_pitch":       31
"head_yaw":         32
"head_roll":        33
```

**建议：** 在舵机纸上用马克笔写 ID，贴胶布标签。

---

## 四、逐个配置步骤

**每次只接 1 个舵机到驱动板**（避免总线上多个默认 ID:1 冲突）。

```bash
cd Open_Duck_Mini_Runtime/scripts   # 或仓库内 scripts 路径
python configure_motor.py --id <目标ID>
```

示例 — 配置右髋 yaw：

```bash
python configure_motor.py --id 10
```

脚本会：

1. 解锁 EEPROM
2. 写入新 ID
3. 设置 PID 等默认参数（P=32, I=0, D=0）
4. **舵机转到零位** — 此时安装舵盘，尽量与官方图对齐

重复 14 次，ID 从 10–14、20–24、30–33。

### 批量 PID（可选，装完后）

```bash
python configure_all_motors.py
```

---

## 五、零位与舵盘安装

标定脚本让电机转到 **电气零位** 时：

1. 将塑料舵盘装到输出轴上，方向对照 [官方配图](https://github.com/apirrone/Open_Duck_Mini/blob/v2/docs/configure_motors.md)
2. 不必完美，后续 `find_soft_offsets.py` 可补偿小误差
3. **hip_pitch** 安装方向错误影响最大 — 见 [assembly.md](assembly.md) 大腿章节

---

## 六、装完后的软件偏置

整机装好后，在树莓派上：

```bash
cp example_config.json ~/duck_config.json
cd scripts
python find_soft_offsets.py
```

将输出的偏置写入 `~/duck_config.json`。

---

## 七、验证

```bash
python scripts/check_motors.py
```

应能按名称逐个驱动 14 个关节，无超时、无 ID 冲突。

---

## 八、天线 9g 舵机（非总线）

| 项目 | 说明 |
|------|------|
| 数量 | 2 |
| 控制 | Pi GPIO PWM（GPIO 12 / 13） |
| ID 配置 | **不需要** `configure_motor.py` |

---

相关：[assembly.md](assembly.md) · [06-deployment/runtime.md](../06-deployment/runtime.md)
