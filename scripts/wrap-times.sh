#!/bin/zsh

# Navigate to your Obsidian vault directory
# cd /path/to/your/obsidian/vault

# Create backup files first (safety precaution)
find . -name "*.md" -exec cp {} {}.bak \;

# Find and replace HH:mm times with styled spans
find . -name "*.md" -print0 | xargs -0 sed -i '' -E 's/(2[0-3]|[01]?[0-9]):([0-5][0-9])/<span class="custom-time">&<\/span>/g'
