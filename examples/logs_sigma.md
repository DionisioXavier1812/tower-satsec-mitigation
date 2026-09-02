# Exemplos de Logs Sigma (DetecA§Aµes)

## Regra: SSH Brute Force
detection:
  selection:
    EventID: 22
    Status: failed
  condition: selection

## Regra: Acesso fA­sico fora do horA¡rio
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

