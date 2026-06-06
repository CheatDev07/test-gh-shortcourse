
#!/bin/bash

# Navigate to the script's directory (ensures it runs in the correct folder)
cd "$(dirname "$0")"

# Check if the directory is a git repository
if [ ! -d ".git" ]; then
    echo "❌ Error: This directory is not a Git repository."
    exit 1
fi

# Stage all changes (new, modified, and deleted files)
echo "📦 Staging changes..."
git add .

# Prompt user for a commit message
echo "📝 Enter your commit message:"
read -r commit_msg

# If the user enters an empty message, use a default fallback
if [ -z "$commit_msg" ]; then
    commit_msg="Auto-commit updates on $(date +'%Y-%m-%d %H:%M:%S')"
fi

# Commit the staged changes
git commit -m "$commit_msg"

# Get the active branch name dynamically
current_branch=$(git branch --show-current)

# Push changes to the remote repository
echo "🚀 Pushing changes to remote branch: $current_branch..."
git push origin "$current_branch"

echo "✅ Code successfully pushed!"
