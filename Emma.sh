#!/bin/bash

echo "Changing chaimsanders passwd"
echo -e "SomeSecurePassword" | passwd chaimsanders

echo "Creating a backup user"
useradd potato
echo -e "PotatoForLife" | passwd potato

echo "MAKING BAKCUPPP"
tar -pcvf /var/backup/backup.tar /etc/* /var/www/* /opt/var/www/*

echo "saving service, processes"
ps -aux | tee /opt/ps.txt
netstat -tulpn | tee /opt/netstat.txt
ss -ptuna | tee /opt/ss.txt


