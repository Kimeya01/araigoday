#!/bin/bash
set -e

# Start MongoDB service
mongod --replSet rs0 --bind_ip_all --fork --logpath /var/log/mongodb.log --dbpath /data/db

# Wait for MongoDB to start
until mongo --eval "print(\"waited for connection\")"
do
    sleep 2
done

# Adding a sleep to ensure MongoDB is fully ready
sleep 10

# Initiate Replica Set
mongo --eval 'rs.initiate()'

# Keep the container running
tail -f /var/log/mongodb.log
