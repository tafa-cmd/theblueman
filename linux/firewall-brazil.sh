#!/bin/bash

# Get rid of firewalld
systemctl stop firewalld 2>/dev/null
systemctl disable firewalld 2>/dev/null

# Flush existing rules
iptables -F

# Set default policies to drop incoming/forward requests
iptables -P INPUT DROP
iptables -P FORWARD DROP

# Set default policy to accept outbound requests
iptables -P OUTPUT ACCEPT

# Allow mysql
iptables -A INPUT -p tcp --dport 3306 -j ACCEPT

# Allow icmp
iptables -A INPUT -p icmp -j ACCEPT

# Print rules
iptables -L -v --line-numbers