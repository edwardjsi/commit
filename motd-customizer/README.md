
# 🛠️ MOTD Customizer

Scripts to personalize Ubuntu's welcome message.

## Features
- Shows current system time in IST
- Displays a rotating motivational quote daily

## Usage
To test locally:
```bash
./00-system-time.sh
./daily-quote.sh

# 🛠️ MOTD Customizer (Day 2 Initiative)

This module personalizes Ubuntu's Message of the Day (MOTD) with:

- 🕒 Current system time in IST
- 💬 A randomly selected motivational quote from a curated list
- 🔁 Intelligent rotation that avoids repeating quotes until all have been used

---

## 📅 Context

This script set was created on **Day 2** of my 90-day commit journey — not as part of the streak itself, but as a personal initiative to improve my system environment and share reproducible tools.

---

## 📂 Files

| File              | Purpose                                                  |
|-------------------|----------------------------------------------------------|
| `00-system-time.sh` | Displays current system time in IST                     |
| `daily-quote.sh`    | Shows a random motivational quote, avoiding repeats     |
| `quotes.txt`        | Contains the full list of motivational quotes           |

---

## 🚀 Installation

📁 Option 3:To install system-wide on Ubuntu:

```bash
sudo cp 00-system-time.sh /etc/update-motd.d/00-system-time
sudo cp daily-quote.sh /etc/update-motd.d/10-daily-quote
sudo cp quotes.txt /etc/update-motd.d/quotes.txt
sudo chmod +x /etc/update-motd.d/{00-system-time,10-daily-quote}

📁 Option 2: Project-Specific MOTD
Create a .motd-local.sh inside your project folder:
echo "🕒 System Time: $(date '+%A, %d %B %Y %H:%M:%S %Z')"
~/commit/motd-customizer/daily-quote.sh


Then add this to your .bashrc:
if [[ "$PWD" == "$HOME/commit" ]]; then
  source "$PWD/.motd-local.sh"
fi


🖥️### 🧍 Option 1: User-Specific MOTD

Add to your `.bashrc`:
```bash
echo "🕒 System Time: $(date '+%A, %d %B %Y %H:%M:%S %Z')"
~/commit/motd-customizer/daily-quote.sh




🔍 Preview
To test the MOTD manually:
run-parts /etc/update-motd.d/



✍️ Author
Created by Immanuel — financial planner, retirement coach, and technical educator. This project reflects my commitment to clarity, modularity, and daily motivation.

---

Let me know once you’ve added this to your `README.md`, and I’ll walk you through the final Git commit. You’ve built something that’s not just functional — it’s thoughtful, scalable, and teachable.


