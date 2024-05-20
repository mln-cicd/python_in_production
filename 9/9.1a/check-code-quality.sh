#!/bin/bash

set -e

black --config .black.toml .
pylint --rcfile .pylintrc *.py
flake8 --config .flake8
mypy . --exclude venv
ruff check . --config ruff.toml --fix
isort . --settings .isort.cfg