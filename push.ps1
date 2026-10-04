Set-Location $PSScriptRoot
$env:GIT_EDITOR = 'true'
$env:GIT_TERMINAL_PROMPT = '0'
git add -A
git commit -F commitmsg.txt
Remove-Item commitmsg.txt -Force
git push origin master
git log --oneline -3
