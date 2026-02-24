#!/bin/bash

# Go to the script directory 
cd "$(dirname "$0")"

# Checking for the presence of the .env file 
if [ -f .env ]; then
    source .env
else
    echo "Error: .env file not found."
    exit 1
fi

# Checking the existence of the database file in the project 
if [ ! -f "$PROJECT_DB_PATH" ]; then
    echo "Error: Project database file not found."
    exit 1
fi

# Checking the existence of the directory for storing backups and creating it if necessary 
if [ ! -d "$BACKUP_DIR" ]; then
    mkdir -p "$BACKUP_DIR"
fi

# Backup comment (can be provided as an argument when running the script) 
COMMENT=${1:-"manual_backup"}

# Backup file name 
BACKUP_FILENAME="${CURRENT_DATE}_${NAME_DB}_${COMMENT}.sqlite"

# Full path to the backup file 
BACKUP_PATH="$BACKUP_DIR/$BACKUP_FILENAME"

# Copying the .sqlite database file 
cp "$PROJECT_DB_PATH" "$BACKUP_PATH"

echo "Backup completed successfully. Backup file: $BACKUP_PATH"