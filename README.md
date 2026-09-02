# Tower & Satellite Security Mitigation

[![Status](https://img.shields.io/badge/status-active-green)]()
[![License](https://img.shields.io/badge/license-MIT-blue)]()
[![Security](https://img.shields.io/badge/focus-security-critical%20infra-red)]() 

Este projeto reúne boas práticas, checklists e documentação essencial para segurança em torres de transmissão e enlaces satelitais.

A proposta é ser simples, acessível e útil tanto para iniciantes quanto para profissionais de telecom e segurança.

---

## 🎯 Objetivo do Projeto

- Mapear riscos físicos e lógicos em infraestruturas críticas.  
- Fornecer checklists práticos para inspeção e auditoria.  
- Disponibilizar scripts simples para análise básica.  
- Servir como base de estudo e referência rápida.  

---

## 📁 Estrutura do Repositório

- `docs/` – documentação técnica (arquitetura, threat model, diagramas).  
- `checklists/` – listas de verificação físicas e lógicas.  
- `examples/` – cenários de uso e estudos de caso.  
- `scripts/` – scripts simples para auditoria e automação.  
- `incident-reports/` – modelos de relatórios de incidente.  
- `playbooks/` – guias de resposta a incidentes.  
- `dfir-analysis/` – análises forenses e fluxos de investigação.  

---

## 📚 Documentação Avançada

Para detalhes técnicos completos (arquitetura, threat model, DFIR, cenários avançados):

👉 **Acesse a documentação avançada:**  
**[`docs/overview_advanced.md`](docs/overview_advanced.md)**

Essa seção contém tudo o que é mais profundo, técnico e detalhado — separado do README para manter o projeto leve e acessível.


---

## 🚀 Getting Started

### 1. Navegando pelos documentos
Comece por:

- `docs/arquitetura_torres.md`  
- `docs/modelo_ameaca.md`  
- `checklists/checklist_torre_fisico.md`  
- `checklists/checklist_torre_logico.md`  

---

### 2. Rodando os scripts

#### Converter arquivos para ASCII + inglês
```powershell
powershell -ExecutionPolicy Bypass -File .\converter_ascii_english_ultra.ps1
