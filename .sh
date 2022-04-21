#!/bin/bash

if [ "$VIRTUAL_ENV" != "" ]; then
    echo "This shell is in an activated virtualenv already. Type \"deactivate\" in the shell to deactivate the virtualenv and re-run this script."
    exit 1
fi

echo "This script will create a virtualenv in the venv directory."

if [ -e venv ]; then
    echo "This script found an existing virtualenv in the venv directory already. Continuing this script will remove your existing venv directory and will create it again."
fi

echo "Type \"ok\" to continue:"

read CONFIRMATION
if [ "$CONFIRMATION" != "ok" ]; then
    exit 2
fi

PYTHON3_BINARY="$(which /usr/bin/python3)"
if [ "$PYTHON3_BINARY" = "/usr/bin/python3 not found" ]; then
    echo "python3 not found. Please install it based on the instructions in README.md."
    exit 3
fi

echo "Found python3 at: $PYTHON3_BINARY"

echo "Removing old virtualenv at ./venv (if it exists)..."
rm -r venv || true

echo "Creating new virtualenv at ./venv..."
$PYTHON3_BINARY -mvenv venv

source venv/bin/activate

echo $(which python)
echo $(which pip)

echo "Updating pip..."
pip install --upgrade pip

echo "Installing application dependencies..."
pip install -r requirements.txt

echo "Installing development dependencies..."
pip install -r requirements_dev.txt

echo "Done."

echo ""
echo "Add the following to your .bashrc or .zshrc to auto-activate the virtualenv when you cd to the code:"
echo ""
echo "function cd {"
echo "    builtin cd \"\$@\""
echo "    if [ -d \"venv\" ] ; then"
echo "        source venv/bin/activate"
echo "    fi"
echo "}"
echo ""