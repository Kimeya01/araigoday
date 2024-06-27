#!/bin/sh

# Path to the data directory on the host machine
HOST_DATA_DIR="/data/db"

# Check if the directory exists and is not empty
if [ -d "$HOST_DATA_DIR" ]; then
  # Ensure the directory is not in use
  lsof +D "$HOST_DATA_DIR" && kill $(lsof -t +D "$HOST_DATA_DIR")
  
  # Remove MongoDB data
  rm -rf ${HOST_DATA_DIR}/*
  
  # Recreate necessary directories
  mkdir -p ${HOST_DATA_DIR}
fi
