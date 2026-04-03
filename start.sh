#!/usr/bin/env bash
set -euo pipefail
JAR="$(ls -1 paper-*.jar 2>/dev/null | head -n1)"
if [[ -z "${JAR}" ]]; then
  echo "No paper-*.jar found in $(pwd)" >&2
  exit 1
fi
exec java -Xms512M -Xmx"${JAVA_MAX_MEMORY:-2G}" -jar "${JAR}" nogui
