from flask import Flask, jsonify
from datetime import datetime
import pytz

app = Flask(__name__)

@app.route('/time', methods=['GET'])
def get_time():
    # Set the timezone to West Africa Time (WAT)
    wat_timezone = pytz.timezone('Africa/Lagos')
    current_time = datetime.now(wat_timezone).strftime('%Y-%m-%d %H:%M:%S')
    return jsonify({'current_time': current_time})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
