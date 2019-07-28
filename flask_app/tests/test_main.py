import pytest


def test_main(client):
    resp = client.get("/")
    assert b'Hello World!' == resp.data