# 苦工 MJCF 仿真模型

MJCF 是 MuJoCo 里描述机器人质量、关节、碰撞的文件。改机械后 **必须** 更新。

---

## 第 1 步：从哪复制

1. `microduck_rl` 仓库内 Microduck 相关 MJCF（路径以仓库为准，常见在 `tasks/` 或 assets）
2. 或 `Open_Duck_Mini` 仿真相关文件

```bash
cd ~/robot/vendor/microduck_rl
find . -name "*.xml" | head -20
```

复制一份到 `~/robot/peon/mjcf/robot_peon.xml`。

---

## 第 2 步：必须改的参数

| 参数 | 说明 |
|------|------|
| `body` pos/quat | 连杆相对位置 |
| `joint` range | 关节限位 |
| `geom` size/mass | 碰撞与质量 |
| `actuator` | 仍对应 STS3215 力矩范围 |

质量错误 → sim2real 必失败。

---

## 第 3 步：执行器 BAM

STS3215 使用 Rhoban [BAM](https://github.com/Rhoban/bam) 参数。改机械若仍用同款舵机，执行器模型可复用；连杆惯量要改。

---

## 第 4 步：注册新任务

在 `microduck_rl` 中按仓库 `AGENTS.md` 添加新 task id，例如 `Mjlab-Velocity-Flat-Peon`（名称自定义）。

具体步骤随上游变化 — 改完后：

```bash
uv run list-envs   # 应能看到新任务
```

---

## 第 5 步：验证 MJCF

```bash
uv run train <你的Peon任务> --env.scene.num-envs 64 --agent.max_iterations 5
```

能跑通再长训。

---

## 第 6 步：保存版本

```bash
git -C ~/robot/peon init
git add mjcf/
git commit -m "peon mjcf v0.1"
```

---

## 下一步

[retrain-checklist.md](retrain-checklist.md)
