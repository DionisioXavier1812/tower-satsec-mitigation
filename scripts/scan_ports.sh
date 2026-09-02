#!/usr/bin/env bash

TARGET="$1"

if [ -z "$TARGET" ]; then
  echo "Uso: $0 <ip_ou_host>"
  exit 1
fi

echo "Escaneando portas comuns em $TARGET..."

PORTS="22 80 443 8080 8443 161 502 1883 8883"

for PORT in $PORTS; do
  (echo > /dev/tcp/$TARGET/$PORT) >/dev/null 2>&1
  if [ $? -eq 0 ]; then
    echo "Porta $PORT aberta"
  else
    echo "Porta $PORT fechada ou filtrada"
  fi
done
