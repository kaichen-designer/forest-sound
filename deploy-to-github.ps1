# GitHub 部署腳本
# 使用前請先在 GitHub 上創建新倉庫

Write-Host "=== GitHub 部署腳本 ===" -ForegroundColor Green
Write-Host ""

# 檢查是否已設置 remote
$remoteExists = git remote get-url origin 2>$null
if ($remoteExists) {
    Write-Host "已檢測到 remote: $remoteExists" -ForegroundColor Yellow
    $useExisting = Read-Host "是否使用現有的 remote? (y/n)"
    if ($useExisting -ne "y") {
        Write-Host "請先執行: git remote remove origin" -ForegroundColor Red
        exit
    }
} else {
    Write-Host "請先在 GitHub 上創建新倉庫" -ForegroundColor Yellow
    Write-Host "訪問: https://github.com/new" -ForegroundColor Cyan
    Write-Host ""
    $username = Read-Host "輸入你的 GitHub 用戶名"
    $repoName = Read-Host "輸入倉庫名稱 (例如: forest-sound)"
    
    if ($username -and $repoName) {
        Write-Host "設置 remote..." -ForegroundColor Green
        git remote add origin "https://github.com/$username/$repoName.git"
        Write-Host "Remote 已設置: https://github.com/$username/$repoName.git" -ForegroundColor Green
    } else {
        Write-Host "用戶名或倉庫名不能為空" -ForegroundColor Red
        exit
    }
}

# 檢查當前分支
$currentBranch = git branch --show-current
if ($currentBranch -ne "main" -and $currentBranch -ne "master") {
    Write-Host "當前分支: $currentBranch" -ForegroundColor Yellow
    $renameBranch = Read-Host "是否重命名為 main? (y/n)"
    if ($renameBranch -eq "y") {
        git branch -M main
    }
}

# 推送代碼
Write-Host ""
Write-Host "準備推送代碼到 GitHub..." -ForegroundColor Green
Write-Host "如果提示需要認證，請使用 Personal Access Token" -ForegroundColor Yellow
Write-Host "獲取 Token: https://github.com/settings/tokens" -ForegroundColor Cyan
Write-Host ""

$push = Read-Host "是否現在推送? (y/n)"
if ($push -eq "y") {
    git push -u origin main
    if ($LASTEXITCODE -eq 0) {
        Write-Host ""
        Write-Host "✅ 成功上傳到 GitHub!" -ForegroundColor Green
        Write-Host ""
        Write-Host "下一步: 部署到 Netlify" -ForegroundColor Cyan
        Write-Host "1. 訪問 https://app.netlify.com" -ForegroundColor White
        Write-Host "2. 登入並選擇 'Import an existing project'" -ForegroundColor White
        Write-Host "3. 選擇你的 GitHub 倉庫" -ForegroundColor White
        Write-Host "4. 點擊 'Deploy site'" -ForegroundColor White
    } else {
        Write-Host ""
        Write-Host "❌ 推送失敗，請檢查:" -ForegroundColor Red
        Write-Host "1. 是否已在 GitHub 上創建倉庫" -ForegroundColor Yellow
        Write-Host "2. 是否正確設置了 remote URL" -ForegroundColor Yellow
        Write-Host "3. 是否使用了正確的認證方式" -ForegroundColor Yellow
    }
} else {
    Write-Host "已取消推送" -ForegroundColor Yellow
}
