Day22 – Docker Compose Basics

🎯 Goal
Introduce Docker Compose into the workflow by committing an initial  docker-compose.yml that runs a single container.
This sets the foundation for multi‑service orchestration in later days.

📂 Project Structure
Day22/
└── project-app/
	├── docker-compose.yml
	└── Dockerfile   (optional, simplified to use nginx base image)

⚙️ Docker Compose File
Minimal configuration to run a single container:
version: "3.8"
services:
app:
image: nginx:alpine
container_name: day22-app
ports:
- "8080:80"

▶️ How to Run

From inside Day22/project-app:
docker-compose up -d
• 	Starts the container in detached mode.
• 	Maps host port 8080 → container port 80.
• 	Access the app at: http://localhost:8080
To stop:
docker-compose down

🧠 Key Learnings
• 	Dockerfile vs Compose: Dockerfile defines how to build an image; Compose defines how to run containers.
• 	Declarative orchestration: Compose captures runtime instructions in a version‑controlled YAML file.


