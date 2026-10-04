Set-Location $PSScriptRoot
$env:GIT_EDITOR = 'true'
$env:GIT_TERMINAL_PROMPT = '0'
git add -A
git commit -m "Serve at darknight-007.github.io: drop CNAME until jnaneshwar.com DNS is pointed"
git push -u origin master
