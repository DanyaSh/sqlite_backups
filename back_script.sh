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

# Checking that the vars not empty
if [ -z "$PROJECT_DB_PATH" ] || [ -z "$BACKUP_DIR" ] || [ -z "$NAME_DB" ]; then
    echo "Error: One or more variables are missing in .env"
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

# Checking date var and generated if it needs
DATE_STAMP=${CURRENT_DATE:-$(date +'%Y%m%d_%H%M')}

# Backup comment (can be provided as an argument when running the script) 
COMMENT=${1:-"manual_backup"}

# Backup file name 
BACKUP_FILENAME="${DATE_STAMP}_${NAME_DB}_${COMMENT}.sqlite"

# Full path to the backup file 
BACKUP_PATH="$BACKUP_DIR/$BACKUP_FILENAME"

# Copying the .sqlite database file 
if sqlite3 "$PROJECT_DB_PATH" ".backup '$BACKUP_PATH'"; then
    echo "Backup completed successfully: $BACKUP_PATH"
else
    echo "Error: SQLite backup failed!"
    exit 1
fi
