import pytest
from .. import create_app


@pytest.fixture
def client():
    jbapp = create_app("test")
    client = jbapp.test_client()
    ctx = jbapp.app_context()
    ctx.push()
    yield client
    ctx.pop()
