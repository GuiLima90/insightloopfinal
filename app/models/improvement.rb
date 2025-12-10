class Improvement < ApplicationRecord
  belongs_to :user
  belongs_to :classification

  IMPROVEMENT_PROMPT =   <<~PROMPT
Recebes um conjunto de conversas de suporte ao cliente que já foram previamente classificadas como o MESMO tipo de problema.

Todas as conversas abaixo representam variações do mesmo erro recorrente.

O teu objetivo é:
- Analisar o conjunto completo das conversas.
- Identificar padrões, causas prováveis e falhas de processo.
- Gerar um plano de melhorias estratégico e realista para a empresa.

Deves criar exatamente:
- 2 ações de Curto Prazo (ações imediatas para resolver os problemas atuais dos clientes).
- 2 ações de Médio Prazo (melhorias de processo para evitar que os problemas voltem a acontecer).
- 2 ações de Longo Prazo (melhorias estruturais, tecnológicas ou estratégicas para reduzir esse tipo de falha no futuro).

Responde obrigatoriamente neste formato, sem texto adicional fora dele:

Curto Prazo:
- <ação 1>
- <ação 2>

Médio Prazo:
- <ação 1>
- <ação 2>

Longo Prazo:
- <ação 1>
- <ação 2>
PROMPT
end
