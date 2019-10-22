#!/bin/bash
SERVER=$1.med.cornell.edu

echo "Copying SSH Key to ${SERVER}."
ssh-copy-id -i ~/.ssh/dak3004_openssh_key.pub dak3004@${SERVER}
echo "SSH Key copied to ${SERVER}."

echo "Sending .bashrc file over to ${SERVER}."
if ssh ${SERVER} stat "~/.bashrc" \> /dev/null 2\>\&1
	then
		echo "File exists"
		ssh dak3004@${SERVER} -i ~/.ssh/dak3004_openssh_key 'cp ~/.bashrc ~/.bashrc_old'
		cat ~/.bashrc | ssh dak3004@${SERVER} -i ~/.ssh/dak3004_openssh_key 'cat > ~/.bashrc'
	else
		echo "File does not exist"
		cat ~/.bashrc | ssh dak3004@${SERVER} -i ~/.ssh/dak3004_openssh_key 'cat > .bashrc'
fi
echo "Finished sending configuration files."
