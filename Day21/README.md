# Day21: Docker Volumes — Lifecycle, Persistence, and Cleanup

## 🧠 Goal

Demonstrate how Docker volumes behave across container lifecycles, including:

- Volume creation and reuse
- Data persistence after container deletion
- Manual volume cleanup

## 📂 Structure

Day21/ 
   └── docs/ 
	└── docker/ 
		├── volumes_demo.sh 
		└── volumes.md

This script:

• 	Creates a named volume
• 	Mounts it to a container
• 	Writes and reads data
• 	Deletes the container
• 	Verifies volume persistence
• 	Optionally removes the volume

📘 Documentation

See  volumes.md for:

• 	Step-by-step explanation of each command
• 	Visuals and output samples
• 	Cleanup tips and best practices

🧱 Concepts Reinforced

• 	, , , 
• 	Volume reuse across containers
• 	Manual cleanup with 

🧑‍🏫 Why It Matters
	Understanding volumes is essential for:
• 	Persistent storage in containerized apps
• 	Decoupling data from container lifecycles
