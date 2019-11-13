#!/bin/bash

# The host file
host=production/hosts
# All service to deserve
services=("result" "poll" "postgresql" "redis" "worker")
# Ansible to vagrant association
sshVar=("HostName:host" "Port:port" "User:user" "IdentityFile:ssh_private_key_file")

echo -e "Prepare and launch VM"
vagrant up

echo -e "Setting $host file"
echo -n > $host

function getSSHKey {
    echo "$1" | grep "$2 " | cut -d" " -f 4
}

for vm in $(seq 1 5)
do
    echo -en "Setting $host for VM$vm(${services[$vm - 1]})..."
    sshconfig=$(vagrant ssh-config VM$vm 2>&1)
    echo -n "${services[$vm - 1]} " >> $host
    for var in "${sshVar[@]}"
    do
        res=$(getSSHKey "$sshconfig" ${var%%:*})
        echo -n "ansible_${var#*:}=$res " >> $host
    done
    echo >> $host
    echo -e " done"
done

echo -e "✔️ Finished"
