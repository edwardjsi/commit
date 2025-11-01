#!/bin/bash
# Day 2: Basic Linux Commands Demo

echo "📁 Creating demo directory structure..."
mkdir -p demo_folder/subfolder
cd demo_folder

echo "📍 Current directory:"
pwd

echo "📄 Creating sample files..."
touch file1.txt file2.txt
ls -l

echo "📂 Copying file1.txt to subfolder..."
cp file1.txt subfolder/

echo "✏️ Renaming file2.txt to renamed_file.txt..."
mv file2.txt renamed_file.txt

echo "🧹 Removing renamed_file.txt..."
rm renamed_file.txt

echo "📂 Listing contents of subfolder:"
ls -l subfolder

echo "🔙 Returning to parent directory and cleaning up..."
cd ..
rm -r demo_folder

echo "✅ Script completed."
