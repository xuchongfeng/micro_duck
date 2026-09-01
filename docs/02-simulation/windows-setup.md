# Windows 环境搭建（WSL2 + NVIDIA）

`microduck_rl` 官方在 **Linux + NVIDIA CUDA** 上训练。Windows 用户推荐：**Windows 装驱动 + WSL2 里跑训练**。

> 全程约 1–2 小时。每一步做完再进下一步。

---

## 第 0 步：确认显卡驱动（Windows）

1. `Win + X` → **终端（管理员）** 或 PowerShell
2. 输入：

```powershell
nvidia-smi
```

3. 记录输出中的：
   - GPU 名称：`GeForce GTX 1060 6GB`
   - Driver Version：例如 `535.xx` 或更高
   - CUDA Version：例如 `12.x`（这是驱动支持的上限，不是已安装的 Toolkit）

若失败 → 去 NVIDIA 官网重装驱动，**重启**后再试。

---

## 第 1 步：启用 WSL2

在 **PowerShell（管理员）** 中逐行执行：

```powershell
wsl --install
```

若已装过 WSL，执行：

```powershell
wsl --set-default-version 2
wsl --install -d Ubuntu-22.04
```

重启电脑（若系统提示）。

### 首次打开 Ubuntu

1. 开始菜单搜索 **Ubuntu 22.04**，打开
2. 等待解压，设置 **用户名**（小写英文，如 `xpeng`）和 **密码**（输入时不显示，正常）
3. 进入后提示符类似：`xpeng@DESKTOP-XXX:~$`

### 更新系统

```bash
sudo apt update && sudo apt upgrade -y
```

输入密码。等待完成。

---

## 第 2 步：WSL 内识别 GPU

在 Ubuntu 终端：

```bash
nvidia-smi
```

应同样看到 GTX 1060。若 **找不到命令** 或 **No devices**：

1. 确认 Windows 侧 `nvidia-smi` 正常
2. Windows PowerShell（管理员）：

```powershell
wsl --update
wsl --shutdown
```

3. 重新打开 Ubuntu，再试 `nvidia-smi`

---

## 第 3 步：安装基础工具（WSL）

```bash
sudo apt install -y build-essential git curl wget vim
```

### 安装 uv（Python 包管理，microduck_rl 官方用）

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

关闭并重新打开 Ubuntu 终端，然后：

```bash
uv --version
```

应显示版本号。

---

## 第 4 步：不要把项目放在 `/mnt/c` 训练

WSL 访问 Windows 盘 `C:\...` 路径为 `/mnt/c/...`，**IO 慢且偶发权限问题**。

推荐放在 Linux 家目录：

```bash
mkdir -p ~/robot/vendor
cd ~/robot/vendor
```

---

## 第 5 步：Windows 与 WSL 文件互访

| 从哪 | 访问哪 | 路径 |
|------|--------|------|
| WSL | Windows C 盘 | `/mnt/c/Users/你的用户名/` |
| Windows 资源管理器 | WSL 家目录 | 地址栏输入 `\\wsl$\Ubuntu-22.04\home\xpeng` |

Bambu Studio 在 Windows 打开 STL：从 `\\wsl$\...` 或把 STL 复制到 `D:\robot\stl\`。

---

## 第 6 步：可选 — VS Code 远程 WSL

1. Windows 安装 [VS Code](https://code.visualstudio.com/)
2. 安装扩展 **WSL**
3. Ubuntu 里进入项目目录，执行 `code .` 用 VS Code 编辑

---

## 第 7 步：磁盘空间

```bash
df -h ~
```

确保 **Avail** 大于 **30G**。

清理 WSL 垃圾（可选）：

```bash
sudo apt autoremove -y
```

---

## 常见问题

| 问题 | 处理 |
|------|------|
| `wsl --install` 失败 | 控制面板 → 启用「虚拟机平台」「适用于 Linux 的 Windows 子系统」 |
| Ubuntu 打不开 | `wsl -l -v` 看状态，应为 Running / Version 2 |
| WSL 里无 GPU | 更新 WSL 内核、`wsl --shutdown` 重启 |
| 中文乱码 | `sudo apt install locales && sudo locale-gen zh_CN.UTF-8` |

---

## 完成检查

- [ ] Windows `nvidia-smi` 正常
- [ ] Ubuntu `nvidia-smi` 正常
- [ ] `uv --version` 有输出
- [ ] `~/robot/vendor` 目录已建

全部打勾 → [gtx1060-pytorch.md](gtx1060-pytorch.md)
