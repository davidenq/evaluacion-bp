from flask import Flask
app = Flask(__name__)


@app.route('/', methods = ['GET'])
def main():
    return "ok"

@app.route('/health', methods = ['GET'])
def health():
    return "ok"

@app.route('/DevOps', methods = ['POST'])
def devops():
    content = request.json
    message = "Hello " + content['to'] + "your message will be send"
    return jsonify({'message' : message}), 200


@app.errorhandler(405)
def method_not_allowed(e):
    return "error" 

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)