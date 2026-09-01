# 树莓派 SD 卡烧录（从零）

树莓派 Zero 2 W 需要一张烧录好 **Raspberry Pi OS** 的 microSD 卡。

---

## 你需要

| 物品 | 说明 |
|------|------|
| microSD 32GB | High Endurance 推荐 |
| 读卡器 | USB-C 或 USB-A |
| Windows 电脑 | 安装 Raspberry Pi Imager |

---

## 第 1 步：下载 Imager

https://www.raspberrypi.com/software/

安装 **Raspberry Pi Imager**。

---

## 第 2 步：选择系统

1. 打开 Imager → **Choose Device** → **Raspberry Pi Zero 2 W**
2. **Choose OS** → **Raspberry Pi OS (other)** → **Raspberry Pi OS Lite (64-bit)**  
   （无桌面，省资源；需要桌面可选带 Desktop 版）

---

## 第 3 步：预配置（重要，省掉接屏幕）

点击 **Next** 或齿轮 **Advanced options**：

| 选项 | 设置 |
|------|------|
| Set hostname | `duck-bot`（随意） |
| Enable SSH | ✅ Use password authentication |
| Set username and password | 用户名 `pi`，强密码 |
| Configure wireless LAN | 填家里 WiFi 名和密码 |
| Set locale settings | Timezone: Asia/Shanghai |

插入 SD 卡 → **Write**，等待完成 → 安全弹出。

---

## 第 4 步：上电启动

1. SD 卡插入 Pi Zero 2W
2. **先不要** 装到机器人头上，桌面单独供电测试
3. 用 **Micro USB** 供电（5V 2A+），或后续机器人电池经 UBEC 供电

---

## 第 5 步：SSH 连接

确保电脑与 Pi 在同一 WiFi。

### 查找 IP

路由器管理页查看 `duck-bot`，或：

```powershell
ping duck-bot.local
```

### SSH 登录（Windows PowerShell）

```powershell
ssh pi@duck-bot.local
```

首次问 `yes`，输入密码。

---

## 第 6 步：基础配置

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install -y git python3-pip python3-venv
```

### 启用 I2C（给 BNO055）

```bash
sudo raspi-config
```

→ `Interface Options` → `I2C` → Enable → Finish → Reboot

```bash
sudo reboot
```

重连 SSH 后验证：

```bash
ls /dev/i2c-*
```

应有 `/dev/i2c-1`。

---

## 第 7 步：USB 串口延迟（舵机通信）

按 [Runtime README](https://github.com/apirrone/Open_Duck_Mini_Runtime/blob/v2/README.md)：

```bash
sudo nano /etc/udev/rules.d/99-usb-serial.rules
```

写入：

```text
SUBSYSTEM=="usb-serial", DRIVER=="ftdi_sio", ATTR{latency_timer}="1"
```

保存后：

```bash
sudo udevadm control --reload-rules
```

---

## 完成检查

- [ ] `ssh pi@...` 能登录
- [ ] I2C 已启用
- [ ] 系统已 update

→ [runtime.md](runtime.md)
