#!/bin/bash
# Копирует приложения в сайт GitHub Pages и отправляет. Лене: ./sync.sh
set -e
cd "$(dirname "$0")"
{ printf '<!doctype html>\n<html lang="ru">\n<head>\n<meta charset="utf-8">\n<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">\n</head>\n<body>\n'; cat ~/Documents/english/index.html; printf '\n</body>\n</html>\n'; } > index.html
cp ~/Documents/english/kids/oleg/index.html oleg/index.html
cp ~/Documents/english/kids/igor/index.html igor/index.html
git add -A
git commit -q -m "${1:-Update apps}" || { echo "нет изменений"; exit 0; }
git push -q && echo "отправлено"
