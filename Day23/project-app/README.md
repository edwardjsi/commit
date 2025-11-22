Day23 — Docker Compose Two-Tier App (Python + Postgres)

Overview

This project demonstrates a two-tier application using Docker Compose:
• 	App service: A Python Flask application
• 	Database service: Postgres

The app connects to Postgres over Docker’s internal network using the service name . This setup is portable, reproducible, and ideal for local development, testing, and onboarding.

Why This Matters
• 	Service orchestration: Run dependent services together with one command.
• 	Network abstraction: No manual IPs; use service names (db).
• 	Reproducibility: Anyone can clone and run the stack instantly.

Project Structure

Day23/project-app/
	• 	Dockerfile
	• 	docker-compose.yml
	• 	requirements.txt
	• 	src/app.py

Configuration

Environment variables are defined in docker-compose.yml:
DATABASE_HOST=db
DATABASE_PORT=5432
DATABASE_USER=postgres
DATABASE_PASSWORD=postgres
DATABASE_NAME=projectdb
APP_PORT=5000

Docker Compose File
	services:
	app:
	build: .
	container_name: project-app
	ports:
	- "5000:5000"

environment:
- DATABASE_HOST=db
- DATABASE_PORT=5432
- DATABASE_USER=postgres
- DATABASE_PASSWORD=postgres
- DATABASE_NAME=projectdb
depends_on:
- db

db:
image: postgres:15
container_name: project-db
restart: always
environment:
- POSTGRES_USER=postgres
- POSTGRES_PASSWORD=postgres
- POSTGRES_DB=projectdb
volumes:
- db_data:/var/lib/postgresql/data

volumes:
db_data:

Application Endpoints

Health Check: GET /health

Example response: {"status":"ok","db_check":1}

Tasks: GET /tasks

Example response:

[
{"id":1,"title":"Finish Day23 Docker Compose setup","done":true},
{"id":2,"title":"Write README.md for project-app","done":false},
{"id":3,"title":"Prepare for DevOps interview","done":false}
]

Run the Stack
	docker compose up -d --build
	docker ps

Verify Connectivity

	Health check: curl http://localhost:5000/health
	Tasks endpoint: curl http://localhost:5000/tasks

Troubleshooting
• 	Connection refused: Ensure app uses DATABASE_HOST=db, not localhost.
• 	Auth errors: Double-check credentials in docker-compose.yml.
• 	Container not starting: Inspect logs with docker logs project-app and docker logs project-db.

Cleanup
docker compose down

Notes
• 	depends_on ensures the DB container starts before the app, but does not wait for readiness. Use retry logic in production.
- Data is persisted in the db_data volume.
- You can swap Postgres with Redis or MySQL by changing the db service and app configuration
