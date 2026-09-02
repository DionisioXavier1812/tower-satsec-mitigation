#!/usr/bin/env bash

TARGET="$1"

if [ -z "$TARGET" ]; then
  echo "Uso: $0 <ip_ou_host>"
  exit 1
fi

echo "Auditando serviços básicos em $TARGET..."

SERVICES=("ssh" "http" "https" "snmp" "modbus" "mqtt")

for SVC in "${SERVICES[@]}"; do
  echo "Verificar configuração de serviço: $SVC (manual/externo)."
done

echo "Este script serve como ponto de partida para auditorias mais profundas."
