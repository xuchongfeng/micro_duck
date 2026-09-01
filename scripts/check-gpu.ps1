# Windows GPU 快速检查

在 **PowerShell** 中运行（仿真环境搭建前后各测一次）：

```powershell
# 若已保存为 scripts/check-gpu.ps1：
# powershell -ExecutionPolicy Bypass -File scripts\check-gpu.ps1

Write-Host "=== NVIDIA Driver ===" -ForegroundColor Cyan
nvidia-smi

Write-Host "`n=== WSL ===" -ForegroundColor Cyan
wsl --status 2>$null
wsl -l -v

Write-Host "`n=== WSL nvidia-smi (if Ubuntu installed) ===" -ForegroundColor Cyan
wsl -e nvidia-smi 2>$null

Write-Host "`nDone. If both Windows and WSL show GTX 1060, proceed to docs/02-simulation/windows-setup.md" -ForegroundColor Green
```

保存为 `scripts/check-gpu.ps1` 后双击或在项目根目录执行。

WSL 内 PyTorch 检查见 [docs/02-simulation/gtx1060-pytorch.md](../docs/02-simulation/gtx1060-pytorch.md)。
