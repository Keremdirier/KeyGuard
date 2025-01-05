from flask import Flask, request, jsonify
from pykeepass import PyKeePass
import os

app = Flask(__name__)

# Define the path to the KeePass file
KEEPASS_FILE_PATH = 'path/to/your/keepass.kdbx'
KEEPASS_PASSWORD = 'your-keepass-password'  # Password for the KeePass database

# Load the KeePass database
def load_kdbx():
    kp = PyKeePass(KEEPASS_FILE_PATH, password=KEEPASS_PASSWORD)
    return kp

@app.route('/get_password', methods=['GET'])
def get_password():
    # Extract the entry name from the query params
    entry_name = request.args.get('entry_name')

    if not entry_name:
        return jsonify({"error": "Entry name is required"}), 400

    try:
        kp = load_kdbx()
        entry = kp.entries.filter(title=entry_name)
        if entry:
            return jsonify({
                "website": entry[0].url,
                "username": entry[0].username,
                "password": entry[0].password
            }), 200
        else:
            return jsonify({"error": "Entry not found"}), 404
    except Exception as e:
        return jsonify({"error": str(e)}), 500

@app.route('/add_password', methods=['POST'])
def add_password():
    data = request.get_json()
    title = data.get('title')
    username = data.get('username')
    password = data.get('password')
    url = data.get('url')

    if not title or not username or not password:
        return jsonify({"error": "Title, username, and password are required"}), 400

    try:
        kp = load_kdbx()
        kp.entries.add(title=title, username=username, password=password, url=url)
        kp.save()
        return jsonify({"message": "Password added successfully"}), 201
    except Exception as e:
        return jsonify({"error": str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True)
