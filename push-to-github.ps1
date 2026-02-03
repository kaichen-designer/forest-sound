# 快速推送腳本
# 請先在 GitHub 上創建名為 "forest-sound" 的倉庫

Write-Host "=== 推送到 GitHub ===" -ForegroundColor Green
Write-Host ""

# 獲取 GitHub 用戶名
$username = Read-Host "請輸入你的 GitHub 用戶名 (例如: kaichen-designer)"

if (-not $username) {
    Write-Host "用戶名不能為空" -ForegroundColor Red
    exit
}

# 設置 remote
Write-Host "設置 remote..." -ForegroundColor Yellow
git remote remove origin 2>$null
git remote add origin "https://github.com/$username/forest-sound.git"

Write-Host "Remote 已設置: https://github.com/$username/forest-sound.git" -ForegroundColor Green
Write-Host ""

# 重命名分支為 main（如果當前是 master）
$currentBranch = git branch --show-current
if ($currentBranch -eq "master") {
    Write-Host "重命名分支為 main..." -ForegroundColor Yellow
    git branch -M main
}

# 推送代碼
Write-Host "準備推送代碼..." -ForegroundColor Yellow
Write-Host "如果提示需要認證，請使用 Personal Access Token" -ForegroundColor Cyan
Write-Host "獲取 Token: https://github.com/settings/tokens" -ForegroundColor Cyan
Write-Host ""

git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "✅ 成功！代碼已推送到 GitHub" -ForegroundColor Green
    Write-Host "查看倉庫: https://github.com/$username/forest-sound" -ForegroundColor Cyan
} else {
    Write-Host ""
    Write-Host "❌ 推送失敗" -ForegroundColor Red
    Write-Host "請確認:" -ForegroundColor Yellow
    Write-Host "1. 已在 GitHub 上創建名為 'forest-sound' 的倉庫" -ForegroundColor White
    Write-Host "2. 使用了正確的用戶名" -ForegroundColor White
    Write-Host "3. 使用了 Personal Access Token 作為密碼" -ForegroundColor White
}
