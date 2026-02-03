# WebAR - Forest Sound

使用 AR.js 和 A-Frame 開發的 WebAR 應用，可以掃描 Barcode Marker 來播放對應的音訊。

## 功能

- 掃描 Marker 6：播放鳥叫聲 (bird.mp3)
- 掃描 Marker 12：播放河流聲 (river.mp3)
- 音訊淡入淡出效果
- 視覺回饋（半透明方塊）

## 使用方法

### ⚠️ 重要：必須使用 HTTP 服務器運行

**不要直接用瀏覽器打開 `index.html` 文件（file:// 協議）**，因為瀏覽器的安全政策會阻止載入本地音訊文件。

### 方法 1：使用 Python（推薦）

```bash
# Python 3
python -m http.server 8000

# Python 2
python -m SimpleHTTPServer 8000
```

然後在瀏覽器中訪問：`http://localhost:8000`

### 方法 2：使用 Node.js

```bash
# 安裝 http-server（如果還沒安裝）
npm install -g http-server

# 運行服務器
http-server

# 或指定端口
http-server -p 8000
```

然後在瀏覽器中訪問：`http://localhost:8080` 或 `http://localhost:8000`

### 方法 3：使用 VS Code Live Server

1. 安裝 VS Code 擴展 "Live Server"
2. 右鍵點擊 `index.html`
3. 選擇 "Open with Live Server"

### 方法 4：部署到 Netlify（手機使用推薦）📱

這是**在手機上使用的最佳方式**，因為 Netlify 提供免費的 HTTPS，完全符合 AR.js 的需求。

#### 方式 A：拖放部署（最簡單）

1. 訪問 [Netlify Drop](https://app.netlify.com/drop)
2. 將整個 `forest-sound` 資料夾拖放到頁面上
3. 等待部署完成
4. 獲得一個 `https://xxx.netlify.app` 的網址
5. 在手機瀏覽器中打開這個網址即可使用

#### 方式 B：GitHub 部署

1. 將項目上傳到 GitHub
2. 訪問 [Netlify](https://www.netlify.com/)
3. 登入後點擊 "Add new site" → "Import an existing project"
4. 選擇你的 GitHub 倉庫
5. 部署設置：
   - Build command: （留空，這是靜態網站）
   - Publish directory: `.` 或留空
6. 點擊 "Deploy site"
7. 等待部署完成

#### 方式 C：使用 Netlify CLI

```bash
# 安裝 Netlify CLI
npm install -g netlify-cli

# 登入
netlify login

# 部署
netlify deploy --prod
```

### 方法 5：使用其他工具

- **PHP**: `php -S localhost:8000`
- **Ruby**: `ruby -run -e httpd . -p 8000`

## 文件結構

```
forest-sound/
├── index.html      # 主 HTML 文件
├── bird.mp3        # 鳥叫聲音訊
├── river.mp3       # 河流聲音訊
├── marker-6.svg    # Marker 6 圖案
├── marker-12.svg   # Marker 12 圖案
├── netlify.toml    # Netlify 配置文件（可選）
└── README.md       # 說明文件
```

## 使用步驟

### 本地使用

1. 啟動本地 HTTP 服務器（見上方方法）
2. 在瀏覽器中打開對應的 localhost 地址
3. 點擊「點擊開始」按鈕
4. 允許瀏覽器存取相機權限
5. 將攝像頭對準 Marker 6 或 Marker 12
6. 聽到對應的音訊播放

### 手機使用（推薦）

1. 將項目部署到 Netlify（見上方方法 4）
2. 在手機瀏覽器中打開 Netlify 提供的網址
3. 點擊「點擊開始」按鈕
4. 允許瀏覽器存取相機權限
5. 將攝像頭對準 Marker 6 或 Marker 12
6. 聽到對應的音訊播放

> 💡 **提示**：Netlify 提供免費的 HTTPS，這是手機使用 AR 功能所必需的。

## 技術棧

- **A-Frame**: 3D/AR 框架
- **AR.js**: WebAR 庫
- **Tone.js**: 音訊處理庫

## 故障排除

### 音訊無法載入

- 確認使用 HTTP 服務器運行，不是直接打開文件
- 確認 `bird.mp3` 和 `river.mp3` 文件存在於同一目錄
- 檢查瀏覽器控制台的錯誤訊息

### 相機無法啟動

- 確認允許了瀏覽器存取相機權限
- 確認使用 HTTPS 或 localhost（AR.js 需要安全連接）
- 檢查瀏覽器是否支援 WebRTC

### Marker 無法檢測

- 確認使用正確的 Marker（4x4 barcode）
- 確保光線充足
- 確保 Marker 完整顯示在畫面中
- 嘗試調整攝像頭距離和角度

## 瀏覽器支援

- Chrome（推薦）
- Firefox
- Edge
- Safari（iOS 11+）

## 授權

MIT License
