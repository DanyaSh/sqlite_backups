# SQLite backup script
This Bash script is designed to automate the backup process of a SQLite database in a project. It allows you to easily copy the database file to a specified directory for backups, with customizable naming conventions.

## Prerequisites

- Bash (Bourne Again SHell)
- SQLite database file in your project
- `.env` file with configuration variables (see [.env_example](.env_example))

## Getting Started

1. Clone the repository to your local machine.

   ```bash
   git clone https://github.com/DanyaSh/sqlite_backups.git
   ```
2. Navigate to the project directory.

   ```bash
   cd /PATH/TO/THIS/PROJECT/DIRECTORY
   ```
3. Create a `.env` file based on the provided [.env_example](.env_example). Customize the variables according to your project configuration.

   ```plaintext
   CURRENT_DATE=$(date +'%Y%m%d')
   NAME_DB=my_database
   PROJECT_DB_PATH=/path/to/project/db.sqlite
   BACKUP_DIR=/path/to/backups
   ```
4. Make the script executable.

   ```bash
   chmod +x back_script.sh
   ```
5. Run the script.

   ```bash
   ./back_script.sh
   ```
## Configuration

- NAME_DB: Name of the database.
- CURRENT_DATE: Current date in the format YYYYMMDD.
- PROJECT_DB_PATH: Path to the project's SQLite database file.
- BACKUP_DIR: Directory path for storing backups.

## Usage
### Manual Backup

You can manually trigger a backup with a custom comment by providing it as an argument. This will create a backup file with a filename like:


   ```bash
   ./back_script.sh "my_custom_comment"
   ```
This will create a backup file with a filename like:

20230101_my_database_my_custom_comment.sqlite

### Auto Backup with CRON

Launch in terminal linux

   ```bash
   crontab -e
   ```

input for example (for everyday auto backup your database at 3 am and logging this process)

   ```bash
   0 3 * * * /path/to/your/script/backup_script.sh >> /path/to/your/logs/cron.log 2>&1
   ```

### Errors

#### if you need sudo for script in cron:
launch in terminal linux

   ```bash
   sudo visudo
   ```

input

   ```bash
   $USER ALL=(ALL) NOPASSWD: /path/to/your/script/backup_script.sh
   ```

## Licence

   This project is licensed under the [MIT License](LICENSE).