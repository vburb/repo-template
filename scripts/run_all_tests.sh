#!/bin/bash

# pytest -v .\tests\
poetry run pytest --cov=. --cov-report=term tests

# mypy --ignore-missing-imports ./
poetry run mypy --ignore-missing-imports
