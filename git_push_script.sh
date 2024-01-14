#!/bin/bash

# Navigate to your Git repository
# cd /path/to/your/repo

# Get the current branch name
branch_name=$(git rev-parse --abbrev-ref HEAD)

# Add all changes
git add .

# Commit changes with a message
git commit -m "Automated commit message"

# Push changes to the remote repository
git push origin "$branch_name"
