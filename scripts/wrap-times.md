Here's a macOS shell script to find all `HH:mm` time instances in `.md` files and wrap them with ``:

```bash
#!/bin/zsh

# Navigate to your Obsidian vault directory
cd /path/to/your/obsidian/vault

# Create backup files first (safety precaution)
find . -name "*.md" -exec cp {} {}.bak \;

# Find and replace HH:mm times with styled spans
find . -name "*.md" -print0 | xargs -0 sed -i '' -E 's/\b(2[0-3]|[01]?[0-9]):([0-5][0-9])\b/&/g'
```

---

## **Step-by-Step Explanation**

1. **Backup First**  
   The script creates `.bak` copies of your files before making changes:

   ```bash
   find . -name "*.md" -exec cp {} {}.bak \;
   ```

2. **Find and Replace**  
   This command does the heavy lifting:
   ```bash
   find . -name "*.md" -print0 | xargs -0 sed -i '' -E 's/\b(2[0-3]|[01]?[0-9]):([0-5][0-9])\b/&/g'
   ```
   - `find . -name "*.md"`: Locates all `.md` files recursively
   - `-print0 | xargs -0`: Handles filenames with spaces safely
   - `sed -i '' -E`: In-place editing with extended regex (macOS syntax)
   - Regex breakdown:
     - `\b`: Word boundary to avoid partial matches (e.g., in URLs)
     - `(2[0-3]|?[0-9])`: Hour part (00-23)
     - `:`: Literal colon
     - `([0-5][0-9])`: Minute part (00-59)
     - `\b`: Closing word boundary

---

## **To Use**

1. Replace `/path/to/your/obsidian/vault` with your actual vault path
2. Save as `wrap-times.sh`
3. Make executable:
   ```bash
   chmod +x wrap-times.sh
   ```
4. Run:
   ```bash
   ./wrap-times.sh
   ```

---

## **Verify Changes**

Check a few files to ensure replacements worked:

```bash
grep -r --color=auto 'custom-time' *.md
```

---

## **Cleanup Backups (Optional)**

After confirming the changes are correct:

```bash
find . -name "*.md.bak" -delete
```

---

## **Add CSS Styling**

Create/reuse a CSS snippet in Obsidian:

```css
/* In your .obsidian/snippets/custom-time.css */
.custom-time {
  font-family: "Courier New", monospace;
  font-weight: bold;
  color: #4a86e8;
}
```

---

## **Notes**

1. This handles 24-hour times only (e.g., `13:20` not `1:20 PM`)
2. Test on a copy of your vault first
3. Undo changes by restoring from `.bak` files if needed

Let me know if you need adjustments! 🍎

---

Answer from Perplexity: pplx.ai/share
