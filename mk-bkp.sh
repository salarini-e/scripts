#!/bin/bash

# Set up some variables
MYSQL_USERNAME="<your_username here>"
MYSQL_PASSWORD="<your_password here>"
BACKUP_DIR="<path for your backup dir>"
LOG_FILE="<path for your backup dir>/log.txt"

echo "Starting backup routine..."

# Get the current date
date=$(date +%Y-%m-%d)

# List of databases to backup
databases=("db_name_1" "db_name_2" "db_name_3")

# Loop through the list of databases
for db in "${databases[@]}"; do
    # Create a directory for the database
    mkdir -p "$BACKUP_DIR/$db"

    # Dump the database to a SQL file
    echo "Creating backup of $db"
    mysqldump -u "$MYSQL_USERNAME" -p"$MYSQL_PASSWORD" --databases "$db" > "$BACKUP_DIR/$db/$db-$date.sql"

    # Append backup information to the log file
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Backup created for database: $db" >> "$LOG_FILE"
done

echo "Backup routine completed."
echo "==================================================================================" >> "$LOG_FILE"
