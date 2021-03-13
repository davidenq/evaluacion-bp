from flask import Flask
app = Flask(__name__)


@app.route('/')
def main():
    return "Hi from server 1, version 0"

@app.route('/health')
def health():
    return "ok"

@app.route('/server1/DevOps')
def serverDevOps():
    return "Esto es un nuevo endpoint"

@app.route('/DevOps')
def devops():
    return "Esto es un nuevo endpoint"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)