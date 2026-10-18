from app import app


def test_index():
    client = app.test_client()
    res = client.get("/")
    assert res.status_code == 200
    assert "message" in res.get_json()


def test_healthz():
    client = app.test_client()
    res = client.get("/healthz")
    assert res.status_code == 200
    assert res.get_json() == {"status": "ok"}
