# Changelog

本仓库文档与项目进展记录。

## [Unreleased]

### Added — 完整零基础落地文档（全章节）

- `00-start-here.md`、`glossary.md` 零基础入口与术语
- **01-getting-started**：prerequisites、repo-structure、upstream-repos、github-pages
- **02-simulation**：windows-setup、gtx1060-pytorch、microduck-rl、hf-simulator（逐步命令）
- **03-hardware**：design、bom、print-by-joint、bambu-a1、servo、motor、assembly、**wiring-detail**、**tools-and-safety**
- **04-peon**：路线 A/B/C、MJCF、重训清单、音效、手臂
- **05-training**：1060 调参、export-onnx、hf-jobs、wandb、policy-inventory
- **06-deployment**：烧 SD、Runtime、duck-config、首走、sim2real
- **07-community**：FAQ、troubleshooting、build-log、monetization、ip-notice
- `scripts/check-gpu.ps1` Windows 显卡检查脚本

### Planned
- [ ] Phase 1：Windows + GTX 1060 仿真环境完整文档
- [ ] Phase 4：苦工路线 A 外皮 demo
