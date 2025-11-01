 # MOTD Customizer – Day 2 Initiative

## Overview
Modular, scoped Message of the Day (MOTD) customizer for Ubuntu. Supports system-wide, user-specific, and project-local configurations. Built for reproducibility and educational clarity.

## Features
- Modular shell scripts for scoped MOTD injection
- System-wide (`/etc/update-motd.d`), user-level (`~/.bashrc`), and project-local (`./motd.sh`) support
- Displays current system time and motivational quote
- Easy integration into daily commit workflows

## Usage
```bash
./motd-customizer.sh --scope user --quote "Stay curious. Stay committed."

#### 3. **Save and Exit**
- `Ctrl+O` → Enter to save
- `Ctrl+X` to exit

#### 4. **Force a Commit**
Even if Git says “nothing to commit,” force a change:
```bash
echo " " >> README.md  # Add a blank line to trigger a change
git add README.md
git commit -m "Force update: clean README.md content"
git push origin main
 
