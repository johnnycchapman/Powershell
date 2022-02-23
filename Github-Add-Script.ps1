#https://education.github.com/git-cheat-sheet-education.pdf
#git config –global user.email "chapmancjohnny@gmail.com"
git remote add origin https://github.com/johnnycchapman/Powershell.git
git add "C:\Users\Johnny C\Desktop\Projects\Kubernetes\Install-Chocolatey.ps1"
git commit -m "add choco script"
git push -u origin main

<#
echo "# Powershell" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/johnnycchapman/Powershell.git
git push -u origin main
#>