#!/usr/bin/bash

INSTALL_PATH=~/.local/share/qutebrowser/userscripts
PY_FILE=switch_tab.py
BASH_FILE=switch_tab

echo "Creating directory $INSTALL_PATH if it does not exist"
mkdir -p $INSTALL_PATH
for FILE in $PY_FILE $BASH_FILE; do
    echo "Creating symbolic link to $FILE at $INSTALL_PATH"
    ln -s $(pwd)/$FILE $INSTALL_PATH
done
