#!/bin/bash

if [ ! -e ~/.ssh/id_rsa_github ]
then
    ssh-keygen -b 4096 -t rsa -N '' -C "Github key for `hostname`" -f ~/.ssh/id_rsa_github
    echo "Please add \"`cat ~/.ssh/id_rsa_github.pub`\" in your git account"
    echo "Press enter when done"

    read
fi

if [ ! -e venv ]
then
    virtualenv --python=python3 venv
    if [ $? -ne 0 ]
    then
        sudo apt install -y python-virtualenv
        virtualenv --python=python3 venv
    fi
    set -e
    venv/bin/pip install ansible
    set +e
fi

venv/bin/ansible-playbook --connection=local --inventory 127.0.0.1, --limit 127.0.0.1 main.yml --ask-become-pass $@
