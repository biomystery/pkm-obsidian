# Icloud sync and git version control

Below is one common method to “lift” your Git repository out of your iCloud‐synced vault so that only a tiny pointer file remains inside your vault. This keeps the bulky Git metadata out of your mobile device’s sync, improving Obsidian’s startup time.

### Overview

Instead of having the full `.git` folder inside your vault (which iCloud syncs), you can:

1. **Rename and move the `.git` folder** to a location outside of your iCloud‑synced folder (for example, into your home directory).

2. **Create a new plain text file named `.git` inside your vault** that tells Git where to find the actual repository metadata via a single line:
   ```
   gitdir: /absolute/path/to/your/new/git-directory
   ```

### Step-by-Step Instructions

1. **Enable Git plugin**

2. **Move the .git Outside the iCloud Folder**

   Move the “.git” folder to a location that isn’t synced by iCloud. For example, on macOS you might move it to your home directory:

   ```sh
   cd /path/to/your/ObsidianVault
   mv .git ~/.obsidian-git
   ```

3. **Create a New .git Pointer File in Your Vault**

   In your vault folder, create a new file called “.git” (note that this is a plain text file, not a directory) whose only content is a reference to your relocated Git directory. For example:

   ```sh
   echo "gitdir: /Users/yourusername/.obsidian-git" > .git
   ```

   Make sure you use the absolute path to the new location of your Git metadata.

4. **Verify Your Setup**

   - Run a Git command (e.g. `git status`) from within your vault to confirm that Git is now reading from the external directory.
   - On your mobile device, the tiny `.git` file will sync instead of the entire repository, helping to keep startup fast.

5. **Update .git Path in git Plugin Settings**

   In the Git plugin settings (`Custom Git directory path:`), update the path to your `.git` file to point to the new location (e.g. `/Users/yourusername/.obsidian-git`).

6. **Repeat on All Devices**

   Ensure that any device on which you run Git commands for this vault uses the same setup (i.e. the same external Git directory and pointer file).

---

By setting up your repository in this way, you keep the heavy Git data out of the iCloud-synced folder while still allowing you to version-control your notes. This approach is recommended by several Obsidian users who use cloud storage alongside Git.
