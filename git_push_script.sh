#!/bin/bash

# Navigate to your Git repository
#cd /path/to/your/repo

# Prompt the user for the branch name
read -p "Enter the branch name: " branch_name

# Add all changes
git add .

# Commit changes with a message
git commit -m "Automated commit message"

# Push changes to the remote repository
git push origin "$branch_name"

