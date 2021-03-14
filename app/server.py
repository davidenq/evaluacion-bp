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
    return "Esto es un nuevo endpoint"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)