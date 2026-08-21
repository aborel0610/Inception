#!/bin/bash

#use netcat, reads and writes from network connections using TCP or UDP. -z gives connection status
until nc -z wordpress 9000; do
    echo "Waiting for wordpress..."
    sleep 1
done

exec "$@"