#!/bin/bash

# Absolutely no input validation
if [ "$#" -ne "1" ] ; then
	echo "Usage: $0 <SSH user>"
	exit 1
fi

# If this errors at the ls because .ssh/config doesn't exist, just touch it and run again
for file in $(ls /home/*/.ssh/config) "/etc/ssh/ssh_config" ; do
	if grep -E "^\s?PermitRootLogin\s+yes" $file ; then
		sed -i -E 's/\s?PermitRootLogin\s+yes/PermitRootLogin no/g' $file
	else
		echo "PermitRootLogin no" >> $file
	fi

	if grep -E "^\s?RSAAuthentication\s+yes" $file ; then
		sed -i -E 's/\s?RSAAuthentication\s+yes/RSAAuthentication no/g' $file
	else
		echo "RSAAuthentication no" >> $file
	fi

	if grep -E "^\s?PubkeyAuthentication\s+yes" $file ; then
		sed -i -E 's/\s?PubkeyAuthentication\s+yes/PubkeyAuthentication no/g' $file
	else
		echo "PubkeyAuthentication no" >> $file
	fi

	if grep -E "^\s?IgnoreRhosts\s+no" $file ; then
		sed -i -E 's/\s?IgnoreRhosts\s+no/IgnoreRhosts yes/g' $file
	else
		echo "IgnoreRhosts yes" >> $file
	fi

	if grep -E "^\s?PermitEmptyPasswords\s+yes" $file ; then
		sed -i -E 's/\s?PermitEmptyPasswords\s+yes/PermitEmptyPasswords no/g' $file
	else
		echo "PermitEmptyPasswords no" >> $file
	fi

	if grep Ubuntu /etc/os-release ; then
		if grep -E "^\s?UseLogin\s+no" $file ; then
			sed -i -E 's/\s?UseLogin\s+no/UseLogin yes/g' $file
		else
			echo "UseLogin yes" >> $file
		fi

		if grep -E "^\s?UsePAM\s+yes" $file ; then
			sed -i -E 's/\s?UsePAM\s+yes/UsePAM no/g' $file
		else
			echo "UsePAM no" >> $file
		fi
	fi

	echo "AllowUsers $1" >> $file
done
