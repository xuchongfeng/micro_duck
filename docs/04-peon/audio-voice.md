# 苦工音效与触发

---

## 音效来源

| 来源 | 商用 |
|------|------|
| 自己录音 | ✅ 注意环境噪音 |
| 可商用音效库（Freesound 等，看许可） | 按许可 |
| 游戏原声截取 | ❌ 产品商用风险 |

建议短语（灵感）：劳动号子、咕哝声，**不要** 1:1 复制「Work work」官声用于卖套件。

---

## 文件格式

- WAV 16bit 44.1kHz 或 22kHz mono
- 放 `peon/audio/`，同步到 Pi `~/peon/audio/`

---

## 树莓派播放

```bash
sudo apt install -y alsa-utils
aplay ~/peon/audio/grunt_01.wav
```

---

## 触发方式

| 方式 | 难度 | 说明 |
|------|------|------|
| 手柄按键 | 低 | 改 Runtime 或并行 Python 读手柄 |
| NFC 标签 | 中 | 官方支持 NFC 天线，可映射行为 |
| 定时 idle | 低 | cron 或主循环随机播放 |
| 语音唤醒 | 高 | 需 ASR，Pi Zero 吃力 |

初学：**手柄 B 键** 播放一条 wav。

---

## 与路线 A 集成

完成 [route-a-cosmetic.md](route-a-cosmetic.md) 后录一条 demo 视频，音效同步。

---

## IP

[ip-notice.md](../07-community/ip-notice.md)
