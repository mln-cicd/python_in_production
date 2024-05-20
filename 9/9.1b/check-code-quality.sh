#!/bin/bash

EXIT_STATUS=0


pip install black pyline flake8 radon mypy ruff isort

# Format code with black
black --line-length 99 . || ((EXIT_STATUS++))

# Lint and fix code with ruff
ruff check . --config pyproject.toml --fix || ((EXIT_STATUS++))

echo exiting with status $EXIT_STATUS
exit $EXIT_STATUS