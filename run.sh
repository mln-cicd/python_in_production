#!/bin/bash

set -e


THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

function load-dotenv {
    while read -r line; do
        export "$line"
    done < <(grep -v '^#' "$THIS_DIR/.env" | grep -v '^$')
}

function install {
    python -m pip install --upgrade pip
    python -m pip install --editable "$THIS_DIR/"
}

function lint {
    pre-commit run --all-files
}

function build {
    python -m build --sdist --wheel "$THIS_DIR/"
}

function start {
    build # Call task dependency
    python -m SimpleHTTPServer 9000
}

function test {
    echo "to implement"
}

function publish:test {
    load-dotenv
    twine upload  dist/* \
    --repository testpypi \
    --username=__token__ \
    --password="$TEST_PYPI_TOKEN"
}

function default {
    # Default task to execute
    start
}

function help {
    echo "$0 <task> <args>"
    echo "Tasks:"
    compgen -A function | cat -n
}

function clean {
    rm -rf dist build coverage.xml test-reports
    find . \
      -type d \
      \( \
        -name "*cache*" \
        -o -name "*.dist-info" \
        -o -name "*.egg-info" \
        -o -name "*htmlcov" \
      \) \
      -not -path "*env/*" \
      -exec rm -r {} + || true

    find . \
      -type f \
      -name "*.pyc" \
      -not -path "*env/*" \
      -exec rm {} +
}

function release:test {
    lint
    clean
    build
    publish:test
}

TIMEFORMAT="Task completed in %3lR"
time ${@:-default}