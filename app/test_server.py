from server import app
from flask import json

def test_add():        
    response = app.test_client().post(
        '/DevOps',
        data=json.dumps({ 
          "message" : "This is a test", 
          "to": "Juan Perez", 
          "from": "Rita Asturia",  
          "timeToLifeSec" : 45
        }),
        content_type='application/json',
    )

    data = json.loads(response.get_data(as_text=True))

    assert response.status_code == 200
    assert data['message'] == "Hello Juan Perez your message will be send"