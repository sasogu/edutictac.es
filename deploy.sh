#!/bin/bash
# Deploy edutictac.es → samgua@edutictac.es:/var/www/my_webapp/www/

SERVER="samgua@edutictac.es"
PORT="2222"
REMOTE_PATH="/var/www/my_webapp/www"
LOCAL_PATH="$(dirname "$0")"

# Archivos y carpetas a excluir
EXCLUDES=(
  "deploy.sh"
  ".git"
  "*.zip"
  "rclone.sh"
)

# Construir argumentos --exclude para rsync
EXCLUDE_ARGS=()
for item in "${EXCLUDES[@]}"; do
  EXCLUDE_ARGS+=(--exclude="$item")
done

echo "▶ Desplegant a $SERVER:$REMOTE_PATH ..."

rsync -avz --progress \
  -e "ssh -p $PORT" \
  "${EXCLUDE_ARGS[@]}" \
  "$LOCAL_PATH/" \
  "$SERVER:$REMOTE_PATH/"

if [ $? -eq 0 ]; then
  echo "✔ Deploy completat correctament."
else
  echo "✘ Error durant el deploy." >&2
  exit 1
fi
