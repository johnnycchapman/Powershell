# Change directory
cd C:\Users\Johnny C\Desktop <# folder to go into or full path of to folder. 
    Note: You will need full path if you are running as Administrator#>

# Change directory back to previous folder
cd ..

ls # list items in current directory

# Copy folders and files
# cp "<path to folder/file>" "<path to destination directory>"
cp "C:\Users\Johnny C\Desktop\testfolder" "C:\Users\Johnny C\"

# Create file with bash
ni test.txt

# Create file with Powershell
New-Item -Path . -Name "test.txt" -ItemType "file" # The "." puts file in the current directory

# Write to file
echo "test" > test.txt
echo "test line 2" >> test.txt # append to same file a new line of text

# Use Out-File to write to file
$text = "test"
$text | Out-File -FilePath ".\test.txt"

# Make folder
# Using bash 
mkdir testfolder # mkdir <name-of-folder> to create dolder in current directory
mkdir C:\Users\Johnny C\Desktop\testfolder # mkdir <path-to-folder> Use full path to make folder without changing directories

# Using Powershell
# New-Item -Path <full-path> -Name <name-of-folder> -ItemType "directory"
New-Item -Path "C:\Users\Johnny C\Desktop" -Name "testfolder" -ItemType "directory"

# Remove folders/ files with bash
rmdir testfolder # rmdir <name-of-directory> if folder is in current directory
rmdir C:\Users\Johnny C\Desktop\testfolder # rmdir <path-to-folder> Use full path to remove folder without changing directories

# Remove folders/files with Powershell
Remove-Item -Path "C:\Users\Johnny C\Desktop\testfolder"
Remove-Item -Path "C:\Users\Johnny C\Desktop\testfolder\test.txt"
Remove-Item * -Include *.docx # Remove all files with a specific extensions (docx,xlsx,txt,csv,etc.)