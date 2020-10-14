#!/bin/bash

# Get rid of firewalld
systemctl stop firewalld 2>/dev/null
systemctl disable firewalld 2>/dev/null

# Flush existing rules
iptables -F

# Set default policies to drop incoming/forward requests
iptables -P INPUT DROP
iptables -P FORWARD DROP

# Allow traffic on loopback
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

# Allow established/related incoming connections
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# Set default policy to accept outbound requests
iptables -P OUTPUT ACCEPT

# Allow mysql
iptables -A INPUT -p tcp --dport 3306 -j ACCEPT

# Allow icmp
iptables -A INPUT -p icmp -j ACCEPT

# Print rules
iptables -L -v --line-numbers
