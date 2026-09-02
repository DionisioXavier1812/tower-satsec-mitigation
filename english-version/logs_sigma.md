# Exemplos de Logs Sigma (DetecA??A??es)

## Regra: SSH Brute force
detection:
  selection:
    EventID: 22
    Status: failed
  condition: selection

## Regra: Acesso fA??sico fora do horA??rio
detection:
  selection:
    DoorEvent: opened
    Time: /03:00|04:00|05:00/
  condition: selection

## Regra: Modem satelital travado
detection:
  selection:
    LogType: sat_Modem
    Message: ""*no response*""
  condition: selection


