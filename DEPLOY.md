# GitHub 部署指南

## 步驟 1: 在 GitHub 上創建新倉庫

1. 訪問 https://github.com/new
2. 填寫倉庫信息：
   - **Repository name**: `forest-sound` (或你喜歡的名稱)
   - **Description**: `WebAR application for scanning markers to play forest sounds`
   - **Visibility**: 選擇 Public 或 Private
   - **不要**勾選 "Initialize this repository with a README"（因為我們已經有文件了）
3. 點擊 "Create repository"

## 步驟 2: 連接本地倉庫到 GitHub

在終端中執行以下命令（將 `YOUR_USERNAME` 替換為你的 GitHub 用戶名）：

```bash
cd "d:\vibe coding\forest-sound"
git remote add origin https://github.com/YOUR_USERNAME/forest-sound.git
git branch -M main
git push -u origin main
```

## 步驟 3: 如果遇到認證問題

如果提示需要認證，你可以：

### 方法 A: 使用 Personal Access Token (推薦)

1. 訪問 https://github.com/settings/tokens
2. 點擊 "Generate new token" → "Generate new token (classic)"
3. 設置權限：勾選 `repo` 權限
4. 生成後複製 token
5. 推送時使用 token 作為密碼：
   ```bash
   git push -u origin main
   # Username: 你的 GitHub 用戶名
   # Password: 貼上剛才複製的 token
   ```

### 方法 B: 使用 SSH (如果已設置)

```bash
git remote set-url origin git@github.com:YOUR_USERNAME/forest-sound.git
git push -u origin main
```

## 步驟 4: 部署到 Netlify

1. 訪問 https://app.netlify.com
2. 登入 GitHub 帳號
3. 點擊 "Add new site" → "Import an existing project"
4. 選擇你剛才創建的 GitHub 倉庫
5. 部署設置保持默認（不需要構建命令）
6. 點擊 "Deploy site"
7. 等待部署完成，獲得 `https://xxx.netlify.app` 網址

## 完成！

現在你的項目已經：
- ✅ 上傳到 GitHub
- ✅ 可以部署到 Netlify
- ✅ 可以在手機上使用
