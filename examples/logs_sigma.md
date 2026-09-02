# Exemplos de Logs Sigma (DetecÃ§Ãµes)

## Regra: SSH Brute Force
detection:
  selection:
    EventID: 22
    Status: failed
  condition: selection

## Regra: Acesso fÃ­sico fora do horÃ¡rio
detection:
  selection:
    DoorEvent: opened
    Time: /03:00|04:00|05:00/
  condition: selection

## Regra: Modem satelital travado
detection:
  selection:
    LogType: sat_modem
    Message: ""*no response*""
  condition: selection
