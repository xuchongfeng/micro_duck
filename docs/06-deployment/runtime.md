# 安装 Open Duck Mini Runtime

在树莓派上安装控制程序，连接 14 个舵机与 IMU。

---

## 第 1 步：克隆 Runtime

SSH 登录树莓派后：

```bash
cd ~
git clone -b v2 https://github.com/apirrone/Open_Duck_Mini_Runtime.git
cd Open_Duck_Mini_Runtime
```

---

## 第 2 步：虚拟环境

```bash
sudo apt install -y python3-virtualenvwrapper
echo 'export WORKON_HOME=$HOME/.virtualenvs' >> ~/.bashrc
echo 'source /usr/share/virtualenvwrapper/virtualenvwrapper.sh' >> ~/.bashrc
source ~/.bashrc

mkvirtualenv -p python3 open-duck-mini-runtime
workon open-duck-mini-runtime
pip install -e .
```

---

## 第 3 步：连接舵机驱动板

- Waveshare 板 USB 接 Pi Zero
- 舵机总线按菊花链连接 ID 10–14、20–24、30–33
- 电源：**先不要** 给舵机上大电流，除非已确认接线极性

详细线序见 [03-hardware/wiring-detail.md](../03-hardware/wiring-detail.md)。

---

## 第 4 步：测试 IMU

```bash
workon open-duck-mini-runtime
cd ~/Open_Duck_Mini_Runtime
python3 mini_bdx_runtime/mini_bdx_runtime/raw_imu.py
```

转动 Pi，终端数值应变化。

---

## 第 5 步：测试全部舵机

```bash
python3 scripts/check_motors.py
```

按提示逐个关节应响应。若某个 ID 超时 → 查线、查 ID 配置。

---

## 第 6 步：手柄配对（可选）

Xbox 手柄蓝牙配对见 [Runtime README](https://github.com/apirrone/Open_Duck_Mini_Runtime/blob/v2/README.md#setup-xbox-one-controller-over-bluetooth)。

测试：

```bash
python3 mini_bdx_runtime/mini_bdx_runtime/xbox_controller.py
```

---

## 第 7 步：安装到机器人头部后

将已烧录系统的 Pi 装入 `head.stl` 内，注意：

- USB 舵机线从头部穿出
- 天线不要卡死
- SD 卡插好、不易震松

---

## 故障

| 现象 | 检查 |
|------|------|
| check_motors 全失败 | 舵机电源、USB 线、驱动板 |
| 单个不动 | 该 ID 线插反或未配置 |
| IMU 无数据 | I2C 接线、地址冲突 |

→ [duck-config.md](duck-config.md)
