## GitHub Remote Setup
1. Open Command Prompt and use command cd to navigate to where you want the repository to go
2. Use git clone to clone the repo to your local machine
3. Make your changes to files (or add new files)
4. Stage those changes by running: git add "<filename>" to add one file. 
	You can also use: git add . to stage all changes
5. Then to commit changes run: git commit -m "message for commit"
6. Push those changes by running: git push origin <branch-name> (usually main/master)

### GitHub Commands
[GitHub Command Cheat Sheet](https://education.github.com/git-cheat-sheet-education.pdf)

#### Clone GitHub repository
```Git
git clone [repository URL] # get from code button
```
#### Stage changes
```Git
git add "<filename>" # add one file at a time
git add . # adds all files
```
#### Commit changes and add message
```Git
git commit -m "update file"
```
#### Push changes back to GitHub
```Git
git push origin main # replace main with branch you are working in
```

**Check GitHub to see if file(s) were added**