#!/bin/bash
#

if [[ -f ~/.ansible.cfg ]]; then
    cp ~/.ansible.cfg ~/.ansible.cfg.bak
fi
cp ansible.cfg ~/.ansible.cfg
ansible-galaxy install -r requirements.yml
ansible-playbook --vault-password-file=.vaultpass -i inventory.yml site.yml
