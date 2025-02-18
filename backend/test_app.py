import pytest 
from app import app

@pytest.fixture
def client():
    with app.test_client() as client:
        yield client

def test_get_stats(client):
    response = client.get('/api/stats')
    assert response.status_code == 200
    assert b'live_scores' in response.data
    assert b'top_players' in response.data