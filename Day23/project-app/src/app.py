import os
import psycopg2
from flask import Flask, jsonify

app = Flask(__name__)

# Read environment variables from docker-compose.yml
DB_HOST = os.getenv("DATABASE_HOST", "db")
DB_PORT = os.getenv("DATABASE_PORT", "5432")
DB_USER = os.getenv("DATABASE_USER", "postgres")
DB_PASSWORD = os.getenv("DATABASE_PASSWORD", "postgres")
DB_NAME = os.getenv("DATABASE_NAME", "projectdb")

def get_connection():
    return psycopg2.connect(
        host=DB_HOST,
        port=DB_PORT,
        user=DB_USER,
        password=DB_PASSWORD,
        dbname=DB_NAME
    )

@app.route("/health")
def health():
    try:
        conn = get_connection()
        cur = conn.cursor()
        cur.execute("SELECT 1;")
        result = cur.fetchone()
        cur.close()
        conn.close()
        return jsonify({"status": "ok", "db_check": result[0]})
    except Exception as e:
        return jsonify({"status": "error", "details": str(e)})

@app.route("/tasks")
def tasks():
    try:
        conn = get_connection()
        cur = conn.cursor()
        cur.execute("SELECT id, title, done FROM tasks;")
        rows = cur.fetchall()
        cur.close()
        conn.close()
        tasks_list = [{"id": r[0], "title": r[1], "done": r[2]} for r in rows]
        return jsonify(tasks_list)
    except Exception as e:
        return jsonify({"status": "error", "details": str(e)})



if __name__ == "__main__":
    app.run(host="0.0.0.0", port=int(os.getenv("APP_PORT", "5000")))
