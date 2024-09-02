#!/bin/bash

# Apply iptables rules
iptables-restore < /etc/iptables.rules

# Execute the default command
exec "$@"
