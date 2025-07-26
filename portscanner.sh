#!/bin/bash

# 🌐 Custom Bash Port Scanner by Fidha

# Function to check if the arguments are valid
function usage() {
    echo "Usage: $0 <target IP/hostname> <start_port> <end_port>"
    exit 1
}

# Argument check
if [ $# -ne 3 ]; then
    usage
fi

target=$1
start=$2
end=$3

echo "🔍 Starting scan on $target from port $start to $end..."

for port in $(seq $start $end); do
    (echo > /dev/tcp/$target/$port) >/dev/null 2>&1 && \
    echo " Port $port OPEN" || \
    echo " Port $port CLOSED"
done

echo "✅ Scan complete!"
