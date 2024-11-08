from flask import Flask, jsonify, request, send_from_directory
import mysql.connector
import os

app = Flask(__name__, static_folder='public')  # Set up Flask and specify the static files directory

# Configure MySQL database connection
db = mysql.connector.connect(
    host="pdcdbinstance.cfm06uw2grsj.us-east-2.rds.amazonaws.com",
    user="admin",
    password="Password1",
    database="donuts"
)

@app.route('/')
def serve_index():
    return send_from_directory(app.static_folder, 'index.html')

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

