import sqlite3
from flask import Flask
from flask import g
from flask import render_template
from flask import request

app = Flask(__name__)

# routes
@app.route("/")
def machine_index():
    machines = query_db('SELECT * FROM ')
    return render_template('.html.j2', machines=machines)