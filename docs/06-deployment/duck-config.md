# duck_config.json 配置

机器人个体差异（IMU 方向、关节偏置、功能开关）写在用户目录 `~/duck_config.json`。

---

## 第 1 步：复制模板

```bash
cd ~/Open_Duck_Mini_Runtime
cp example_config.json ~/duck_config.json
nano ~/duck_config.json
```

---

## 第 2 步：常见字段（以 example 为准）

| 字段含义 | 何时改 |
|----------|--------|
| IMU 倒置标志 | IMU 装反时 |
| 表情功能开关 | 装/不装 LED、喇叭 |
| **joint offsets** | `find_soft_offsets.py` 输出后填入 |

具体键名以 `example_config.json` 为准，升级 Runtime 时 diff 对比。

---

## 第 3 步：自动找关节偏置

组装后、首走前：

```bash
workon open-duck-mini-runtime
cd ~/Open_Duck_Mini_Runtime/scripts
python find_soft_offsets.py
```

按屏幕提示移动关节，脚本会给出偏置值，**抄进** `~/duck_config.json`。

---

## 第 4 步：备份

```bash
cp ~/duck_config.json ~/duck_config.json.bak
```

换机身或重装系统后可恢复。

---

## 下一步

[first-walk.md](first-walk.md)
