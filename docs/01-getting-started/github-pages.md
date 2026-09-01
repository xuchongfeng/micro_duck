# GitHub Pages 发布（逐步）

把本仓库文档发布为 **免费网站**，方便手机/他人阅读。

---

## 第 1 步：注册 GitHub

1. 打开 https://github.com 注册账号
2. 验证邮箱

---

## 第 2 步：创建远程仓库

1. GitHub 右上角 **+** → **New repository**
2. Repository name: `micro_duck`（或你喜欢的名字）
3. Public
4. **不要** 勾选 "Add a README"（本地已有）
5. Create repository

记下页面上的 URL，例如 `https://github.com/你的用户名/micro_duck.git`

---

## 第 3 步：本地提交并推送

在 **PowerShell**：

```powershell
cd D:\robot\micro_duck   # 改成你的实际路径

git status
git add .
git commit -m "docs: complete beginner-friendly guide"

git branch -M main
git remote add origin https://github.com/你的用户名/micro_duck.git
git push -u origin main
```

首次 push 会要求 GitHub 登录（浏览器或 Personal Access Token）。

### 若尚未 git init

```powershell
cd 你的项目目录
git init
git add .
git commit -m "docs: initial"
# 再接 remote 和 push
```

---

## 第 4 步：启用 GitHub Pages

1. 打开仓库网页 → **Settings**
2. 左侧 **Pages**
3. **Build and deployment**
   - Source: **Deploy from a branch**
   - Branch: **main**
   - Folder: **/docs**
4. **Save**

等待 1–5 分钟，页面顶部出现绿色链接：

```text
https://你的用户名.github.io/micro_duck/
```

---

## 第 5 步：验证

浏览器打开上述 URL，应看到 [index.md](index.md) 渲染后的首页。

若 404：

- 再等几分钟
- 确认 `/docs` 内有 `index.md`
- Settings → Pages 是否显示 build 成功

---

## 第 6 步：后续更新文档

```powershell
# 编辑 docs 下 md 文件后
git add .
git commit -m "docs: update simulation chapter"
git push
```

Pages 会自动重新构建（约 1–3 分钟）。

---

## 可选：本地预览

需安装 Ruby + Jekyll（进阶用户）。多数情况 **直接 push 看线上** 即可。

---

## 自定义域名（可选）

Settings → Pages → Custom domain，并在 `docs/CNAME` 写你的域名。

---

## 下一步

读者从 [00-start-here.md](../00-start-here.md) 进入你的站点。
