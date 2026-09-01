# 本仓库目录说明

仓库名建议：`micro_duck` 或 `peon-bot`。下面是每个路径的作用。

```
micro_duck/
├── README.md              # GitHub 仓库首页简介
├── LICENSE                # 文档 MIT 许可
├── CHANGELOG.md           # 更新记录
├── .gitignore
│
├── docs/                  # ★ GitHub Pages 网站根目录（所有教程在这）
│   ├── 00-start-here.md   # 零基础入口
│   ├── glossary.md        # 术语表
│   ├── index.md           # 网站首页
│   ├── roadmap/           # 总路线
│   ├── 01-getting-started/
│   ├── 02-simulation/
│   ├── 03-hardware/
│   ├── 04-peon/
│   ├── 05-training/
│   ├── 06-deployment/
│   └── 07-community/
│
├── bom/                   # 采购 CSV，可导入 Excel
├── peon/                  # 苦工自研 STL、MJCF、音频（后期）
├── configs/               # duck_config 等配置模板
├── scripts/               # 一键检查 GPU 等辅助脚本
└── assets/                # 图片、示意图（文档引用）
```

## 不在本仓库里的东西（故意不放）

| 内容 | 放哪 |
|------|------|
| 官方鸭子 STL | 克隆 `Open_Duck_Mini` 到 `vendor/` |
| 训练代码 | 克隆 `microduck_rl` 到 `vendor/` |
| 树莓派 Runtime | 克隆 `Open_Duck_Mini_Runtime` |
| 训练出的 ONNX | 体积大 → `vendor/` 或 GitHub Releases |

`vendor/` 已在 `.gitignore`，避免把几个 G 的依赖提交上去。

## 推荐阅读方式

- **在线**：GitHub Pages 站点
- **离线**：克隆本仓库，用 VS Code 打开 `docs/` 预览 Markdown

## 如何贡献某一章

1. 编辑对应 `docs/xx-xxx/*.md`
2. 更新该章 `index.md` 里的状态表
3. 在 `CHANGELOG.md` 写一条 Added/Changed
