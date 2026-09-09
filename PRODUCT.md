# Product

<!-- impeccable:product-schema 1 -->

## Platform

web

## Users

Moradores de Socorro-SP e região (casas e apartamentos) com um problema pequeno,
concreto e irritante do dia a dia: torneira pingando, tomada queimada, chuveiro
sem esquentar, móvel para montar, suporte de TV para instalar, PC travando.

A situação real: o problema já apareceu, a pessoa não sabe a quem ligar, tem
receio de chamar alguém desconhecido em casa e medo de orçamento surpresa. O
trabalho que ela está fazendo é **descobrir se dá para confiar em alguém, rápido,
pelo celular**, quase sempre pelo WhatsApp.

Público B2B secundário e confirmado no kit comercial: imobiliárias e
administradores de imóveis; pousadas, chalés, Airbnb e casas de temporada;
pequenos comércios, escritórios e prestadores. O trabalho deles é diferente:
centralizar vários chamados pequenos em um contato só, com registro do serviço e
do valor.

## Product Purpose

Um único contato para diagnosticar e resolver diferentes problemas pequenos do
dia a dia — da casa ao computador. Sucesso é a marca virar a resposta natural
para "não sei quem chamar": o cliente manda uma mensagem no WhatsApp com foto ou
vídeo, recebe uma estimativa, aprova e o serviço é executado.

Sucesso da página: gerar conversas qualificadas no WhatsApp, já com o assunto
identificado.

## Positioning

O concorrente típico é o "marido de aluguel faz-tudo", que aceita qualquer coisa
e improvisa. A posição do Cuca é o oposto e é o que um vizinho não copia sem
mudar de operação: **um profissional que diagnostica antes de prometer, e que
recusa e encaminha o que está fora do escopo.**

- Categoria oficial: Manutenção Residencial e Assistência Técnica.
- Categoria de busca: "marido de aluguel em Socorro-SP".
- Assinatura: "Da casa ao computador, o Cuca resolve."
- Chamada comercial: "Problema apareceu? Chama o Cuca."
- Frase-guia da comunicação: "Não sabe quem chamar? Chama o Cuca."
- Território: praticidade, confiança, capacidade técnica, organização, solução.

O alcance incomum é a amplitude honesta: elétrica, hidráulica e reparos **e
também** eletrodomésticos selecionados **e** computadores — um combo que quase
nenhum concorrente local cobre de ponta a ponta.

## Operating Context

O funil inteiro acontece no WhatsApp, no celular, muitas vezes com o problema
acontecendo na frente da pessoa. O ritual operacional confirmado no kit:

1. Cliente descreve o problema e envia foto ou vídeo.
2. Triagem por perguntas fixas (o que é, há quanto tempo, marca/modelo, bairro,
   restrições de acesso/altura/horário/condomínio, período preferido).
3. Estimativa enviada; nada é executado sem aprovação.
4. Agendamento, aviso de saída, chegada, serviço testado na frente do cliente.
5. Registro do serviço e do valor; pós-venda e pedido de avaliação.

Atendimento sob agendamento e disponibilidade — não é plantão 24h.

Regra interna que governa o portfólio: cada serviço é classificado como **FAÇO**
(dominado), **AVALIO** (depende de foto, vídeo, marca, modelo, acesso, peça ou
visita) ou **NÃO FAÇO** (fora da experiência, do ferramental ou do risco
aceitável).

## Capabilities and Constraints

Cinco famílias de serviço (a arquitetura pública oficial):

| Família | O que comunica | Regra de proteção |
|---|---|---|
| Casa | Montagem de móveis, suportes, prateleiras, cortinas, quadros, ajustes e pequenos reparos | Sob avaliação quando houver fixação estrutural, grandes dimensões ou risco elevado |
| Elétrica | Lâmpadas, tomadas, interruptores, luminárias, chuveiros, resistência de chuveiro/torneira elétrica, ventiladores, pequenos diagnósticos | Recusar o que for incompatível com treinamento, ferramentas ou exigências de segurança |
| Hidráulica | Torneiras, sifões, registros, descargas, pequenos vazamentos, instalações simples | Grandes reformas e intervenções estruturais são encaminhadas |
| Eletrodomésticos | Diagnóstico e reparo apenas de linhas e equipamentos dominados | Sempre dizer "equipamentos selecionados" e confirmar marca/modelo antes |
| Computadores | Diagnóstico, limpeza, formatação, configuração, upgrades, solução de lentidão | Backup, perda de dados e reparo de placa exigem escopo definido antes |

**Serviço de encaminhamento (confirmado pelo dono em 2026-09-09).** O que está
fora do escopo de execução não encerra o atendimento. Sem assumir a execução, o
Cuca pode:

- identificar qual especialidade o serviço exige e **indicar o profissional** que faz;
- **mapear o custo** esperado, para o cliente comparar orçamento com critério;
- **acompanhar a execução** de terceiros, seguindo como contato único do chamado.

Isso converte a recusa em serviço e é o que separa a marca do "faz-tudo" que
simplesmente diz não. Vale para clientes residenciais e é especialmente forte no
B2B, onde a proposta já é centralizar chamados em um contato só.

Restrições duras:

- **Não publicar valores.** Decisão do dono (2026-09-09), alinhada ao kit: a
  comunicação pública é "orçamento sem compromisso após avaliação". A tabela de
  preços do kit é referência interna e não vai para a página.
- **Não prometer sem diagnóstico.** Nenhum prazo, escopo ou valor antes de
  entender o problema.
- **Não usar "faz tudo".** Substituir por "soluções para diferentes problemas".
- Site estático em Astro, sem backend e sem formulário: a conversão é WhatsApp
  (`wa.me`) e telefone.

## Brand Commitments

- Nome: **SOCORRO! O CUCA RESOLVE**. Sempre em caixa alta na marca.
- Brasão: casa em navy com lâmpada acesa em laranja e chave inglesa em branco
  (`public/logo.jpeg`, 264×213, fundo branco). É o único ativo visual existente.
- Paleta herdada e confirmada como obrigatória: navy profundo + laranja de
  destaque. Verde apenas para a ação de WhatsApp.
- WhatsApp (19) 99791-6128 · contato.cucaresolve@gmail.com · Socorro-SP e região.
- Tom de voz: próximo e simples, sem jargão; profissional, pontual e
  transparente; focado no problema e no resultado; nunca improvisado.

## Evidence on Hand

O que existe de real:

- Kit comercial e operacional completo (`docs/`), incluindo arquitetura de
  serviços, regras FAÇO/AVALIO/NÃO FAÇO, scripts de WhatsApp e modelo de
  orçamento com condições reais (validade 7 dias, alteração de escopo aprovada
  antes da execução).
- O brasão da marca.

O que **não existe** e não pode ser inventado:

- **Nenhuma foto** do profissional, de serviços ou de antes/depois.
- **Nenhuma avaliação, nota do Google, depoimento ou logo de cliente.**
- **Nenhum número de atendimentos, de clientes ou de anos de experiência.** O
  dono optou (2026-09-09) por não exibir tempo de ofício.
- Nenhum parceiro B2B ativo para citar nominalmente.
- Instagram, Mercado Livre e Shopee estão em `src/content/links.json` com URLs
  ainda de placeholder (`TROCAR_PELO_...`).

O negócio é de lançamento (versão inicial de setembro de 2026). A confiança na
página precisa ser construída pelo **método**, não por prova social.

## Product Principles

1. **O método é a prova.** Sem fotos e sem avaliações, o que convence é mostrar
   exatamente como o atendimento funciona, passo a passo, antes de pedir contato.
2. **Recusar é uma credencial, encaminhar é o serviço.** Dizer em público o que
   não se faz é o argumento mais forte contra o "faz-tudo" que improvisa — mas a
   recusa nunca termina em "não": ela vira indicação, mapeamento de custo e
   acompanhamento.
3. **Uma mensagem, não um formulário.** Toda ação leva ao WhatsApp com o assunto
   já preenchido; nunca pedir mais dados do que uma conversa pediria.
4. **Amplitude com limite explícito.** Comunicar as cinco famílias sempre com sua
   regra de proteção junto; a largura só é credível acompanhada da fronteira.
5. **Nada é prometido sem diagnóstico.** Vale para o serviço e para a página:
   nenhum número, prazo ou preço que a operação ainda não possa sustentar.

## Accessibility & Inclusion

Público local e amplo em faixa etária, majoritariamente em celular, muitas vezes
em conexão ruim e sob a pressa de um problema acontecendo. Requisitos práticos:
alvos de toque generosos, texto grande e de alto contraste, e o número de
telefone sempre acionável para quem prefere ligar a digitar.
