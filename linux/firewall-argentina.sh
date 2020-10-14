#!/bin/bash

# Flush existing rules
iptables -F

# Set default policies to drop incoming/forward requests
iptables -P INPUT DROP
iptables -P FORWARD DROP

# Set default policy to accept outbound requests
iptables -P OUTPUT ACCEPT

# Allow ssh
iptables -A INPUT -p tcp --dport 22 -j ACCEPT

# Allow ftp
iptables -A INPUT -p tcp --dport 20 -j ACCEPT
iptables -A INPUT -p tcp --dport 21 -j ACCEPT

# Print rules
iptables -L -v --line-numbers
