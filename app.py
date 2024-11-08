from flask import Flask, jsonify, request, render_template
import mysql.connector
import os

app = Flask(__name__, static_folder='static', template_folder='templates')  # Set static and template folders

# Configure MySQL database connection (Uncomment and configure if needed)
db = mysql.connector.connect(
    host="pythondonutsdb.c1qsomceyx8i.us-east-1.rds.amazonaws.com",
    user="admin",
    password="Password1",
    database="donuts"
)

@app.route('/')
def serve_index():
    return render_template('index.html')  # Render 'index.html' from the templates folder

# Endpoint to fetch donuts based on category
@app.route('/donuts', methods=['GET'])
def get_donuts():
    category = request.args.get('category', 'all')  # Default to 'all' if category isn't specified
    
    cursor = db.cursor(dictionary=True)
    query = "SELECT name, image FROM donut_flavors"
    if category != 'all':
        query += " WHERE category = %s"
        cursor.execute(query, (category,))
    else:
        cursor.execute(query)
    
    results = cursor.fetchall()
    cursor.close()
    
    return jsonify(results)

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=3000)
