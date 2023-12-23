#!/bin/bash

# Перейти в директорию скрипта
cd "$(dirname "$0")"

# Проверка наличия .env файла
if [ -f .env ]; then
    source .env
else
    echo "Error: .env file not found."
    exit 1
fi