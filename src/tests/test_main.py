import json
from app.main import handler

def test_handler_returns_200_status_code():
    event = {}
    context = {}
    response = handler(event, context)
    assert response['statusCode'] == 200

def test_handler_returns_correct_body():
    event = {}
    context = {}
    response = handler(event, context)
    assert json.loads(response['body']) == 'Hello from Lambda!'