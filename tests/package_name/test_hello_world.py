"Simple pytest for hello_world.py"

import pytest

from package_name import hello_world


def test_hello_world_function():
    "Test hello_world function"

    assert hello_world() == "Hello, World!"
