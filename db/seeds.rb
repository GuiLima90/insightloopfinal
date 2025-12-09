Conversation.destroy_all
User.destroy_all
Classification.destroy_all

user = User.create!(email: "saunier2@gmail.com", password: "123456")

classification_1 = "atraso na entrega"
Classification.create!(name: classification_1)

classification_2 = "pedido errado"
Classification.create!(name: classification_2)

classification_3 = "produto com defeito"
Classification.create!(name: classification_3)

classification_4 = "problemas com coupon"
Classification.create!(name: classification_4)

  conversas = <<~CHAT
    [Customer]: Olá, bom dia. Preciso falar com um atendente urgente. O robô não tá entendendo meu problema.
    [Support Agent]: Olá! Aqui é a Beatriz da Beautiful Feet. Sinto muito que esteja com dificuldades. Pode me contar o que houve? Estou aqui para resolver.
    [Customer]: Oi Beatriz. Olha, eu tô bem chateada. Fiz uma compra semana passada, o pedido BF-88209. Eram pra ser aquelas sandálias "Royal Velvet" pretas, tamanho 37. A caixa chegou agora pouco.
    [Customer]: Quando eu abri, não tem sandália nenhuma. Vocês me mandaram um tênis "Comfy Walk" branco tamanho 39!!! Nada a ver com nada. Eu tenho um casamento no sábado, como vou usar um tênis 39??
    [Support Agent]: Nossa, entendo perfeitamente sua frustração e peço mil desculpas por isso! :pensive: Realmente não é a experiência que queremos que você tenha na Beautiful Feet, ainda mais com um casamento chegando. Vou verificar o pedido BF-88209 agora mesmo. Só um instante.
    [Customer]: Por favor, vê isso rápido. Eu não tenho tempo de ir no correio devolver e esperar chegar outro. Se não chegar até sexta eu vou ter que cancelar e comprar em loja física.
    [Support Agent]: Já localizei aqui. Realmente consta a saída da Sandália Royal Velvet 37. Houve um erro grave na nossa expedição na hora de etiquetar as caixas. Sinto muito mesmo. Para eu agilizar a troca expressa, você consegue me mandar uma foto da etiqueta da caixa e do tênis que chegou?
    [Customer]: Tá, espera aí. [Customer sends image: photo of a bulky white sneaker inside a delicate box]. Tá vendo? Olha a etiqueta, diz "Destinatário: Carla" mas dentro tá esse tênis gigante.
    [Support Agent]: Obrigada pela foto, Carla. Já registrei o erro aqui. Normalmente, nosso processo pede que o cliente devolva o errado antes de enviarmos o certo, mas dada a urgência do seu evento no sábado, eu vou abrir uma exceção de "Envio Prioritário".
    [Support Agent]: Vou despachar um novo par da Royal Velvet 37 ainda hoje via Sedex 10. Assim garantimos que chega até quinta ou sexta no máximo. Pode ser?
    [Customer]: Ai, sério? Se chegar até sexta me salva. Mas e esse tênis aqui? Eu não tenho como ir no correio hoje, tô no trabalho.
    [Support Agent]: Não se preocupe com o tênis agora. O foco é garantir seu sapato para o casamento! :raised_hands: Vou te mandar um código de postagem reverso no e-mail, e você tem até 15 dias para deixar no Correios quando ficar mais tranquilo para você.
    [Customer]: Menos mal. Tá bom então, Beatriz. Vou ficar de olho no rastreio. Se não chegar na sexta de manhã eu volto a chamar aqui.
    [Support Agent]: Combinado! O novo código de rastreio vai chegar no seu e-mail em até 2 horas. Qualquer coisa, é só me chamar. Desculpe novamente pelo susto e espero que arrase no casamento com a Beautiful Feet!
CHAT

Conversation.create!(channel: "Whatsapp", content: conversas, user: )

conversas_2 = <<~CHAT2
  [Customer]: Olá, boa tarde. Recebi meu pedido #BF59321 hoje cedo, o tênis Urban Flex Branco – tamanho 39, mas ele veio com um risco enorme na lateral :confused: Isso não é normal, né?
  [Support Agent]: Boa tarde! Poxa, sinto muito por isso :pensive: Claro que não é normal. Você pode me enviar uma foto do dano para que eu consiga te ajudar melhor?
  [Customer]: Mandei agora. Repara na lateral direita… parece até que arrastaram na caixa.
  [Support Agent]: Obrigado pela foto! Realmente, o risco é bem visível. Vou verificar aqui no sistema se houve alguma ocorrência registrada durante o transporte.
  [Customer]: É, fiquei bem chateada… comprei pra usar no fim de semana. :weary:
  [Support Agent]: Entendo totalmente sua frustração, e peço desculpas por isso :pray: Verifiquei aqui e a transportadora marcou uma observação de “caixa amassada” na etapa de transferência do dia 30/11. Tudo indica que o item foi danificado no transporte.
  [Customer]: Nossa… então não foi nem verificado antes de enviar?
  [Support Agent]: Infelizmente, o dano provavelmente aconteceu depois da expedição, durante o trajeto. Mas isso não é culpa sua — vamos resolver. Posso abrir agora uma troca imediata, sem custo, e o novo par será enviado assim que o danificado for coletado.
  [Customer]: E essa coleta demora muito?
  [Support Agent]: Normalmente é bem rápida. Posso agendar para amanhã, entre 8h e 18h. Funciona pra você?
  [Customer]: Sim, funciona. Só quero receber um par em boas condições mesmo.
  [Support Agent]: Perfeito! Solicitação aberta: #R-99341. A coleta será amanhã, e assim que o transportador confirmar, enviamos um novo Urban Flex Branco – 39 pra você.
  [Customer]: Obrigado pela agilidade. Tomara que o próximo venha certinho.
  [Support Agent]: Pode deixar, vou acompanhar pessoalmente para garantir que saia tudo certo :blush: Qualquer coisa, é só chamar!
CHAT2

Conversation.create!(channel: "Instagram", content: conversas_2, user_id: user.id)

conversas_3 = <<~CHAT3
  [Customer]: Oi, boa tarde. Tô tentando fechar uma compra aqui no site de vocês mas tá difícil. O cupom de primeira compra não tá entrando de jeito nenhum.
  [Support Agent]: Olá! Boa tarde. Aqui é a Sofia, da equipe de Customer Success da Beautiful Feet :high_heel:. Sinto muito por esse inconveniente, nós adoramos dar descontos e queremos que você os use! Me conta, qual é o código que você está tentando aplicar e qual mensagem de erro aparece?
  [Customer]: O código é o BEMVINDA10. Eu recebi no meu email agorinha. Eu coloquei no carrinho a bota "Urban Leather" preta tamanho 36 e um scarpin nude básico. Quando clico em aplicar, aparece uma letra vermelha dizendo "Cupom não aplicável a estes itens".
  [Customer]: Já tentei tirar o scarpin, deixar só a bota, tentei escrever em minúsculo, e nada. Tô quase desistindo, só ia fechar por causa do desconto que paga o frete.
  [Support Agent]: Entendi, obrigada pelos detalhes! Não desista ainda, vamos resolver isso. Vou verificar as regras desse cupom no sistema agora mesmo. Você poderia me confirmar se essa bota "Urban Leather" que você escolheu é a que tem a fivela dourada, da coleção nova de Inverno?
  [Customer]: Sim, essa mesma da fivela. Mas gente, no email que vocês mandaram tava escrito bem grande "10% OFF em TODO o site". Eu não vi nada de exceção.
  [Support Agent]: Obrigada por confirmar. Analisei aqui no sistema. O cupom BEMVINDA10 está ativo, porém, ele possui uma restrição automática de sistema para itens da categoria "Lançamentos/New In", que é justamente o caso da Bota Urban Leather.
  [Support Agent]: Geralmente, essas regras ficam nas letras miúdas do rodapé do e-mail, mas entendo perfeitamente que a chamada principal de "todo o site" pode ter gerado essa confusão. Peço desculpas por essa falha na comunicação.
  [Customer]: Ah não, sério? Que pegadinha chata. Eu li o email rápido e não vi rodapé nenhum. Me senti meio enganada agora. A bota custa 400 reais, 10% faz diferença. Se não tiver como aplicar, eu vou ter que abandonar o carrinho, achei chato isso.
  [Support Agent]: Compreendo totalmente sua frustração e você tem toda razão, a experiência não deveria ser confusa assim. Não queremos perder você como cliente Beautiful Feet, ainda mais na sua primeira experiência conosco! :sparkling_heart:
  [Support Agent]: Como foi uma falha nossa na clareza do e-mail, conversei com minha supervisora e consegui gerar um código manual pra você que funciona inclusive nos lançamentos. Pode tentar usar o código: VIP-SOFIA-BF? Ele deve liberar os 10% na bota agora.
  [Customer]: Hum, tá bom. Deixa eu testar aqui, peraí...
  [Customer]: [3 minutos depois] Aaaah agora foi! Deu o desconto de R$ 56,00 no total. Ufa. Obrigada, Sofia. Se não fosse isso eu ia fechar a aba aqui e ir comprar na concorrente rs.
  [Support Agent]: Que alívio! :tada: Fico muito feliz que deu certo. A Bota Urban Leather é um dos nossos modelos mais confortáveis, tenho certeza que você vai amar. Já vi que o pedido foi confirmado aqui no sistema.
  [Customer]: Beleza. Já paguei no PIX. Obrigada pela ajuda rápida.
  [Support Agent]: Imagina, eu que agradeço a paciência! Já estamos separando seu par 36 com todo carinho. Qualquer dúvida sobre o rastreio, é só chamar aqui. Tenha uma semana incrível com seus sapatos novos! :sparkles:
CHAT3

Conversation.create!(channel: "RA", content: conversas_3, user_id: user.id)

conversas_4 = <<~CHAT4
  [Customer]: Oi, boa tarde. Preciso falar com alguém sobre uma troca por defeito, mas é urgente.
  [Support Agent]: Olá, boa tarde! Aqui é o Lucas, do time de Experiência da Beautiful Feet. Sinto muito que tenha tido um problema com seu pedido. Estou aqui para ajudar. Pode me informar o número do pedido e o que aconteceu?
  [Customer]: O pedido é o #BF-44901. Eu comprei o Scarpin "Classic Nude" verniz, tamanho 37. Chegou hoje de manhã. A caixa tava intacta, bonita e tal. Mas quando eu tirei o sapato do saquinho de tecido... decepção total.
  [Customer]: O pé direito tá com um risco enorme na lateral do verniz, parece que alguém passou uma chave ali. E o pior: o salto tá bambo. Se eu piso, ele entorta. Eu paguei quase 400 reais nesse sapato, gente! Cadê o controle de qualidade?
  [Support Agent]: Nossa, lamento profundamente por essa experiência! :worried: Isso foge totalmente do nosso padrão, especialmente na linha Classic, que é feita à mão. Entendo sua frustração, é horrível esperar algo lindo e receber assim. Para eu acionar a garantia imediata, você consegue me enviar uma foto do risco e, se possível, um vídeo curto mexendo nesse salto bambo?
  [Customer]: Espera aí, vou tirar agora. [Customer sends image: Close-up of a deep scratch on the beige patent leather]. [Customer sends video: Hand wobbling the high heel, showing it is loose from the sole]. Tá vendo? É perigoso eu torcer o pé usando isso.
  [Support Agent]: Recebi as mídias. Realmente, inaceitável. O vídeo mostra claramente que a estruturação do salto falhou. Peço mil desculpas por termos deixado isso passar. :pensive: Já abri o protocolo de defeito #DEF-992. Como você prefere prosseguir? Posso estornar o valor agora ou enviar um par novo conferido por mim pessoalmente?
  [Customer]: Olha Lucas, eu queria o sapato porque tenho uma reunião importante na quinta-feira e ele combinava com a roupa. Mas agora tô com medo de pedir outro e vir solto também. O verniz riscado até dava pra relevar, mas o salto quebrado não dá.
  [Support Agent]: Compreendo perfeitamente o receio. O que posso fazer é o seguinte: vou separar um par novo no estoque agora e pedir para a supervisão de qualidade fazer o "Teste de Estabilidade" antes de embalar. Posso te mandar foto dele antes de despachar. E para compensar o transtorno e garantir que chegue para sua reunião, eu envio por Sedex 12 (entrega expressa) por nossa conta. O que acha?
  [Customer]: Hum... se você me mandar foto antes provando que tá perfeito, eu aceito. Eu realmente gostei do modelo. Mas e esse estragado aqui? Não vou ter tempo de ir no correio postar amanhã, meu dia é corrido.
  [Support Agent]: Sem problemas! Não quero te dar trabalho extra. Como o defeito é visível e grave, não precisa devolver agora. Vou gerar uma coleta domiciliar para a semana que vem, ou você doa para alguma instituição de reparo de calçados se preferir. O foco agora é te entregar o novo a tempo. Vou buscar o par no estoque. Me dá 10 minutos?
  [Customer]: Nossa, sério? Isso ajuda muito, não ter que ir no correio. Tá bom, Lucas. Aguardo a foto do par novo então. Se estiver 100%, pode mandar.
  [Support Agent]: Perfeito! Já volto com as fotos do seu "Classic Nude" impecável. Obrigada por nos dar uma segunda chance de acertar! :high_heel::sparkles:
CHAT4

Conversation.create!(channel: "Whatsapp", content: conversas_4, user_id: user.id)

conversas_5 = <<~CHAT5
  [Customer]: Bom dia. Estou tentando rastrear meu pedido há 3 dias e o site da transportadora não atualiza. O prazo de entrega era para ontem, dia 01/12, e até agora nada.
  [Support Agent]: Olá, bom dia! Aqui é a Júlia, do atendimento da Beautiful Feet. Peço mil desculpas pelo atraso e pela falta de atualização no rastreio. Sei o quanto é frustrante esperar uma encomenda que não chega na data combinada. :confused: Você pode me informar o número do seu pedido para eu verificar o que houve com a transportadora agora mesmo?
  [Customer]: O pedido é o #BF-50588. Comprei o Tênis "Cloud Running" Branco, tamanho 35. Eu comprei com antecedência justamente porque vou viajar na sexta-feira agora e queria levar ele. Se não chegar, vou ter um problema sério.
  [Support Agent]: Entendi perfeitamente a urgência, obrigada pelos dados. Estou acessando o sistema da transportadora "FlashLog" aqui. Só um minuto... Realmente, consta que o pacote saiu do nosso centro de distribuição no dia 25/11, mas travou no status "Em transferência entre unidades" em Barueri desde o dia 28/11. Isso não é comum.
  [Customer]: Pois é, travou! E ninguém me avisa nada. Eu paguei o frete mais caro pra chegar rápido. Eu viajo sexta de manhã cedo. Vocês conseguem garantir que chega até quinta à noite?
  [Support Agent]: Eu lamento muito por essa falha de comunicação da transportadora. Já estou abrindo um chamado de "Prioridade Máxima" com o gerente de conta deles para destravarem essa entrega hoje mesmo. Sendo bem transparente com você: como travou na triagem, eles pedem até 48h para finalizar. Ou seja, a previsão mais realista é que chegue na quinta-feira (dia 04/12) ao longo do dia. Vai ficar bem em cima do prazo da sua viagem.
  [Customer]: Nossa, Júlia, que risco. Quinta-feira eu vou estar o dia todo fora resolvendo coisas da viagem, só vai ter gente em casa depois das 18h. Se eles tentarem entregar de manhã e não tiver ninguém, eles vão embora e eu fico sem o tênis?
  [Support Agent]: Ótimo ponto. Para evitar isso, vou colocar uma observação na nota de transporte pedindo "Entrega em horário comercial estendido" ou solicitar que deixem na portaria (se você morar em prédio). Você mora em casa ou apartamento? Além disso, como forma de compensar esse estresse e o atraso, já solicitei o estorno integral do valor do frete no seu cartão. É o mínimo que podemos fazer pelo transtorno.
  [Customer]: Ah, o estorno ajuda, obrigada. Eu moro em prédio sim, tem porteiro 24h. Então se eles entregarem quinta de manhã, o porteiro recebe. O meu medo é eles não entregarem quinta.
  [Support Agent]: Perfeito! Se tem portaria 24h, fica muito mais seguro. Com o chamado de prioridade que abri agora, a transportadora sabe que temos um prazo fatal. Vou fazer o seguinte: vou monitorar pessoalmente esse rastreio amanhã e te mando uma mensagem no WhatsApp confirmando se saiu para entrega. Se até quinta de manhã não tiver atualizado, nós enviamos um motoboy de emergência se você estiver na capital (SP), ou pensamos num plano B. Pode ser?
  [Customer]: Tá bom, isso me deixa mais tranquila. Se tiver a opção do motoboy caso dê tudo errado, eu respiro melhor. Eu amo os sapatos de vocês, é a terceira vez que compro, mas essa transportadora tá difícil.
  [Support Agent]: Fico muito feliz que seja nossa cliente fiel! :heart: Vamos rever o contrato com essa transportadora sim. Pode deixar que não vou te deixar na mão para sua viagem. Amanhã te chamo com novidades. O estorno do frete deve aparecer na sua fatura em até 2 dias úteis.
  [Customer]: Combinado, Júlia. Fico no aguardo então. Obrigada.
  [Support Agent]: Eu que agradeço a compreensão. Vai dar certo! Tenha um ótimo dia e até breve. :athletic_shoe::airplane:
CHAT5

Conversation.create!(channel: "Instagram", content: conversas_5, user_id: user.id)


conversas_30 = <<~CHAT30
 [Customer]: Oi, bom dia. Preciso de ajuda urgente
 [Support Agent]: Olá! Aqui é a Ana da Beautiful Feet. Me conta o que aconteceu, por favor.
 [Customer]: Meu pedido BF-91302 chegou agora pouco. Eu pedi a sandália Aurora Nude 38. Veio 36…
 [Customer]: Eu tenho uma formatura amanhã. Isso não entra nem com reza.
 [Support Agent]: Meu Deus, sinto muito mesmo por isso  Vou verificar agora no sistema, só um momento.
 [Customer]: Por favor, porque eu tô entrando em desespero aqui.
 [Support Agent]: Verifiquei aqui: realmente seu pedido original é 38. Houve erro na separação do estoque.
 [Support Agent]: Você consegue me mandar uma foto da etiqueta da caixa e do solado da sandália?
 [Customer]: Mando já. [Customer sends image: etiqueta com 36 visível]
 [Support Agent]: Obrigada! Vou abrir exceção de envio prioritário pra te atender ainda hoje.
 [Customer]: Sério? Se chegar amanhã cedo, eu choro de alegria.
 [Support Agent]: Vamos fazer o possível. Te envio o novo rastreio ainda hoje.
CHAT30
Conversation.create!(channel: "Whatsapp", content: conversas_30, user_id: user.id)

conversas_31 = <<~CHAT31
 [Customer]: Boa tarde. Pela segunda vez vocês erram meu tamanho.
 [Support Agent]: Boa tarde! Sinto muito mesmo por isso 😔 Pode me passar o número do pedido?
 [Customer]: BF-89977. Pedi 39, veio 37.
 [Support Agent]: Já localizei. Realmente houve falha novamente na expedição.
 [Customer]: Isso é muito frustrante, parece descaso.
 [Support Agent]: Você tem razão em ficar chateada. Vamos resolver isso agora com prioridade.
 [Support Agent]: Consegue me enviar uma foto do produto recebido?
 [Customer]: Envio sim. [Customer sends image: sandália pequena dentro da caixa]
 [Support Agent]: Obrigada. Vou autorizar troca expressa sem necessidade de devolução imediata.
 [Customer]: Ainda bem, porque eu trabalho o dia todo.
 [Support Agent]: Sem problemas, você terá 10 dias pra postar depois.
CHAT31

Conversation.create!(channel: "RA", content: conversas_31, user_id: user.id)

conversas_32 = <<~CHAT32
 [Customer]: Oi, acho que veio errado o tamanho…
 [Support Agent]: Oi! Tudo bem? Me conta o que aconteceu.
 [Customer]: O pedido BF-92110. Pedi 37, mas quando calcei senti que tá muito apertado. Na palmilha tá 36.
 [Support Agent]: Obrigada por avisar. Às vezes a caixa vem correta e o sapato não.
 [Support Agent]: Você pode me mandar uma foto da palmilha com a numeração?
 [Customer]: Mando já. [Customer sends image: palmilha com 36 marcado]
 [Support Agent]: Confirmado, houve erro sim. Vou gerar sua troca imediatamente.
 [Customer]: Mas demora muito? Eu preciso dele pra trabalhar.
 [Support Agent]: O reenvio sai amanhã e chega em até 3 dias úteis.
CHAT32

Conversation.create!(channel: "Instagram", content: conversas_32, user_id: user.id)

conversas_33 = <<~CHAT33
 [Customer]: Eu sei que já usei dentro de casa, mas veio no tamanho errado 😔
 [Support Agent]: Fique tranquila, provar não invalida a troca. Qual seu pedido?
 [Customer]: BF-93450. Pedi 40, veio 38.
 [Support Agent]: Obrigada! Vou verificar agora.
 [Support Agent]: Confirmado o erro de tamanho. A troca é autorizada sem custos pra você.
 [Customer]: Ai, ainda bem… achei que ia perder meu dinheiro.
 [Support Agent]: Jamais! Vamos resolver isso direitinho.

CHAT33

Conversation.create!(channel: "Whatsapp", content: conversas_33, user_id: user.id)

conversas_34 = <<~CHAT34
 [Customer]: Oi, acabei de abrir meu pedido aqui no trabalho e veio errado.
 [Support Agent]: Oi! Me conta o que houve.
 [Customer]: Pedido BF-90218. Pedi 35, veio 37.
 [Support Agent]: Entendi. Você consegue me mandar foto da etiqueta da caixa quando chegar em casa?
 [Customer]: Consigo sim, agora não tenho como.
 [Support Agent]: Sem problemas, já deixo o protocolo aberto pra adiantar.
CHAT34

Conversation.create!(channel: "Instagram", content: conversas_34, user_id: user.id)

conversas_35 = <<~CHAT35
 [Customer]: Se não tiver mais meu tamanho, eu faço o quê?
 [Support Agent]: Vamos verificar agora. Qual pedido?
 [Customer]: BF-91844. Pedi 38, veio 36.
 [Support Agent]: Temos apenas 1 unidade no 38 ainda disponível.
 [Customer]: Ai, então separa pra mim pelo amor de Deus
 [Support Agent]: Já deixei reservado no sistema, fica tranquila.
CHAT35

Conversation.create!(channel: "RA", content: conversas_35, user_id: user.id)

conversas_36 = <<~CHAT36
 [Customer]: E se o correio perder meu produto na devolução?
 [Support Agent]: Fique tranquila, o envio é segurado e rastreado.
 [Customer]: Porque é a primeira vez que eu troco online.
 [Support Agent]: Entendo o medo, mas você estará protegida do início ao fim.

CHAT36

Conversation.create!(channel: "Instagram", content: conversas_36, user_id: user.id)

conversas_37 = <<~CHAT37
 [Customer]: Já faz 9 dias que eu enviei a troca e ninguém responde.
 [Support Agent]: Peço mil desculpas pela demora 😞 Pode me passar o número da postagem?
 [Customer]: PX349201BR.
 [Support Agent]: Obrigada! Vejo aqui que chegou ontem no nosso CD.
 [Customer]: Só ontem??
 [Support Agent]: Sim, houve atraso da transportadora, infelizmente.
CHAT37

Conversation.create!(channel: "Instagram", content: conversas_37, user_id: user.id)

conversas_38 = <<~CHAT38
 [Customer]: Meu sapato da troca foi enviado pro endereço antigo 😡
 [Support Agent]: Nossa, sinto muito! Pode me confirmar o atual?
 [Customer]: Rua Bela Vista, 310.
 [Support Agent]: Aqui constou o endereço antigo mesmo. Vou solicitar correção imediata.
CHAT38

 Conversation.create!(channel: "Instagram", content: conversas_38, user_id: user.id)

conversas_39 = <<~CHAT39
 [Customer]: Já errou uma vez, eu não confio mais. Quero cancelar.
 [Support Agent]: Eu entendo sua frustração 😔 Quer que eu siga com estorno total?
 [Customer]: Quero sim.
 [Support Agent]: Perfeito, o valor será estornado em até 5 dias úteis no seu cartão.
 [Customer]: Tá bom. Obrigada.
 [Support Agent]: Sinto muito pela experiência e espero que possamos te atender melhor no futuro.
CHAT39

Conversation.create!(channel: "Whatsapp", content: conversas_39, user_id: user.id)

#Erro no Cupom (8)
conversas_40 = <<~CHAT40
 [Customer]: Oi, bom dia. Meu cupom não funciona de jeito nenhum.
 [Support Agent]: Bom dia! Aqui é a Beatriz da Beautiful Feet. Qual cupom você está tentando usar?
 [Customer]: É o BF15OFF. Ele aparece como inválido.
 [Support Agent]: Entendi! Você poderia me informar o número do pedido, por favor?
 [Customer]: Ainda não finalizei, tava tentando agora com a sandália Crystal Rosa 37.
 [Support Agent]: Perfeito, já identifiquei aqui que o cupom expirou ontem à meia-noite.
 [Customer]: Mas no Instagram dizia que era até hoje 😤
 [Support Agent]: Você tem razão, houve falha na divulgação. Vou gerar um cupom manual pra você agora.
CHAT40

Conversation.create!(channel: "RA", content: conversas_40, user_id: user.id)

conversas_41 = <<~CHAT41
 [Customer]: Eu apliquei o cupom, mas mesmo assim foi cobrado o valor cheio 😡
 [Support Agent]: Sinto muito por isso 😔 Pode me enviar o número do pedido?
 [Customer]: BF-93011.
 [Support Agent]: Obrigada, estou verificando…
 [Support Agent]: Realmente o desconto não foi abatido. Houve falha na integração do pagamento.
 [Customer]: Nossa, isso é muito errado.
 [Support Agent]: Você está certa. Vou solicitar o estorno do valor do desconto imediatamente.
CHAT41

Conversation.create!(channel: "Instagram", content: conversas_41, user_id: user.id)

conversas_42 = <<~CHAT42
 [Customer]: O cupom entra no carrinho mas some quando vou pagar 😤
 [Support Agent]: Entendo, isso realmente gera muita frustração. Qual cupom você usou?
 [Customer]: BFVIP20.
 [Support Agent]: Esse cupom é exclusivo para clientes cadastrados no CPF promocional.
 [Customer]: Mas eu já comprei com vocês várias vezes.
 [Support Agent]: Sim, vejo seu histórico aqui. Vou liberar o desconto manualmente.
CHAT42

Conversation.create!(channel: "Instagram", content: conversas_42, user_id: user.id)

conversas_43 = <<~CHAT43
 [Customer]: No celular o cupom não aplica, só no site normal.
 [Support Agent]: Obrigada por avisar. Isso ajuda muito a gente!
 [Customer]: Eu só consegui testar agora no notebook.
 [Support Agent]: É um bug específico na versão mobile, já está em correção.
 [Customer]: Mas eu perdi a promoção 😔
 [Support Agent]: Não vai perder. Vou gerar um cupom exclusivo válido por 24h pra você.
CHAT43

Conversation.create!(channel: "Whatsapp", content: conversas_43, user_id: user.id)

conversas_44 = <<~CHAT44
 [Customer]: Vi anúncio dizendo 20% OFF com cupom, mas não funciona!
 [Support Agent]: Entendo sua indignação 😔 Você lembra onde viu o anúncio?
 [Customer]: No Instagram de vocês, hoje de manhã.
 [Support Agent]: Obrigada! Vamos reportar isso para o marketing agora mesmo.
 [Customer]: Porque assim parece propaganda enganosa.
 [Support Agent]: Você tem razão. Vou garantir o desconto manualmente pra você agora.

CHAT44

Conversation.create!(channel: "Instagram", content: conversas_44, user_id: user.id)

conversas_45 = <<~CHAT45
 [Customer]: O cupom diz que é válido, mas não entra no meu pedido.
 [Support Agent]: Qual o modelo que você escolheu?
 [Customer]: Bota London Black 38.
 [Support Agent]: Esse modelo infelizmente está fora da campanha promocional.
 [Customer]: Mas isso não tava claro no site 😤
 [Support Agent]: Você tem razão. Vou liberar uma exceção pra você agora.
CHAT45


Conversation.create!(channel: "RA", content: conversas_45, user_id: user.id)

conversas_46 = <<~CHAT46
 [Customer]: Eu já tentei esse cupom umas 6 vezes, nada funciona.
 [Support Agent]: Nossa, sinto muito por isso 😔 Qual cupom é?
 [Customer]: BFMAIO15.
 [Support Agent]: Ele atingiu o limite máximo de usos hoje.
 [Customer]: Então por que continua aparecendo no site?
 [Support Agent]: Ótima observação. Vou repassar isso agora para o time responsável.

CHAT46

Conversation.create!(channel: "Instagram", content: conversas_46, user_id: user.id)

conversas_47 = <<~CHAT47
 [Customer]: Se não funcionar o cupom eu vou cancelar a compra.
 [Support Agent]: Calma, vamos resolver isso agora. Qual pedido?
 [Customer]: BF-94120.
 [Support Agent]: Já vi aqui, o sistema realmente não aplicou o desconto.
 [Customer]: Então cancela tudo.
 [Support Agent]: Antes disso, posso aplicar o desconto manualmente e manter o valor correto pra você.
 [Customer]: Se conseguir, eu fico.
 [Support Agent]: Consegui! Já ajustei e te enviei o novo link de pagamento. ✅
CHAT47

Conversation.create!(channel: "RA", content: conversas_47, user_id: user.id)
#Solicitacao de NF (3)

conversas_48 = <<~CHAT48
 [Customer]: Oi, tudo bem? Eu preciso MUITO da nota fiscal da minha compra.
 [Support Agent]: Oi! Aqui é a Júlia da Beautiful Feet 😊 Me passa o número do pedido pra eu verificar?
 [Customer]: É o BF-92881. Comprei a Sandália Gala Gold 38.
 [Support Agent]: Obrigada! Verificando aqui…
 [Support Agent]: Vejo que a NF foi gerada automaticamente, mas não foi enviada por e-mail por uma falha do sistema 😔
 [Customer]: Puts, isso me ferra. Eu preciso enviar pro financeiro da empresa hoje.
 [Support Agent]: Fique tranquila, vou gerar uma segunda via manualmente e te enviar em até 20 minutos.
 [Customer]: Por favor, urgente mesmo. É reembolso de viagem.
 [Support Agent]: Pode deixar comigo! Assim que estiver pronta, te envio em PDF e XML no seu e-mail.
CHAT48

Conversation.create!(channel: "Instagram", content: conversas_48, user_id: user.id)

conversas_49 = <<~CHAT49
 [Customer]: Olá, eu recebi meu pedido já faz 5 dias, mas até agora nada da nota fiscal.
 [Support Agent]: Olá! Aqui é o Felipe. Pode me passar o número do pedido, por favor?
 [Customer]: BF-90244. É aquela Mule Soft Black.
 [Support Agent]: Obrigado! Estou vendo aqui que a NF não foi emitida porque o CPF ficou registrado incompleto no checkout.
 [Customer]: Ah não 😩 eu jurava que tinha colocado certinho.
 [Support Agent]: Sem problema algum! Você pode me confirmar seu CPF completo aqui?
 [Customer]: Claro, é ..*-
 [Support Agent]: Perfeito, já corrigi. A NF vai ser emitida em até 2 horas e enviada direto pro seu e-mail.
 [Customer]: Obrigada por agilizar 🙏
 [Support Agent]: Qualquer coisa é só me chamar!
CHAT49

Conversation.create!(channel: "RA", content: conversas_49, user_id: user.id)

conversas_50 = <<~CHAT50
 [Customer]: Boa tarde. Preciso da nota fiscal, mas tem que ser emitida no CNPJ da minha loja.
 [Support Agent]: Claro! Posso te ajudar com isso. Qual o número do seu pedido?
 [Customer]: BF-91560.
 [Support Agent]: Obrigado! Vejo que a NF foi emitida no seu CPF.
 [Customer]: Sim, mas eu preciso no CNPJ. Foi erro meu na hora da compra.
 [Support Agent]: Sem problemas, posso cancelar a NF atual e gerar uma nova.
 [Customer]: Tem custo ou algo assim?
 [Support Agent]: Nenhum. Só preciso do CNPJ da empresa e o nome completo.
 [Customer]: CNPJ: XX.XXX.XXX/0001-XX, Razão Social: Nova Era Beauty LTDA
 [Support Agent]: Perfeito! Estou solicitando aqui. Em até 24h você recebe a NF corrigida no e-mail.
 [Customer]: Ótimo. Obrigada pelo atendimento rápido.
 [Support Agent]: Disponha sempre! 😊

CHAT50

Conversation.create!(channel: "Whatsapp", content: conversas_50, user_id: user.id)
#Duvida de Produto (3)
conversas_51 = <<~CHAT51
 [Customer]: Oi, boa noite. Tô olhando uma sandália de vocês, mas tô com medo de não aguentar usar o dia todo.
 [Support Agent]: Boa noite! Aqui é a Marina da Beautiful Feet 😊 Qual modelo você está vendo?
 [Customer]: É a Sandália Royal Velvet preta, tamanho 37.
 [Support Agent]: Ótima escolha! Ela tem palmilha acolchoada e salto bloco, ideal pra uso prolongado.
 [Customer]: Porque eu vou pra um casamento e devo ficar em pé várias horas 😥
 [Support Agent]: Entendo. Esse modelo é justamente um dos mais confortáveis pra esse tipo de evento.
 [Customer]: Ela machuca no calcanhar?
 [Support Agent]: Não costuma machucar, mas sempre indicamos usar um pouco em casa antes pra adaptar.
 [Customer]: Tá, acho que vou arriscar então.
 [Support Agent]: Qualquer coisa, nossa política de troca é bem tranquila 💛
CHAT51

Conversation.create!(channel: "Whatsapp", content: conversas_51, user_id: user.id)

conversas_52 = <<~CHAT52
 [Customer]: Boa tarde. Esse modelo “Luna Off White” tem forma grande ou pequena?
 [Support Agent]: Boa tarde! Ótima pergunta. Ele tem forma padrão, não costuma apertar.
 [Customer]: Porque eu fico entre 36 e 37 dependendo do modelo 😕
 [Support Agent]: Nesse caso, a maioria das clientes escolhe o 37 para maior conforto.
 [Customer]: Ele laceia com o uso?
 [Support Agent]: Um pouco, sim, principalmente por ser material sintético maleável.
 [Customer]: Tá, vou de 37 então.
 [Support Agent]: Perfeito! Qualquer problema, a troca é sem custo na primeira vez.
CHAT52

Conversation.create!(channel: "Instagram", content: conversas_52, user_id: user.id)

conversas_53 = <<~CHAT53
 [Customer]: Oi, tudo bem? Essa bota London Black é de couro mesmo?
 [Support Agent]: Oi! Tudo bem sim 😊 Ela é de couro ecológico de alta resistência.
 [Customer]: Não descasca rápido, né?
 [Support Agent]: Não costuma descascar com uso normal e cuidados básicos.
 [Customer]: É que eu trabalho muito em pé e uso todo dia.
 [Support Agent]: Nesse caso, ela aguenta bem a rotina, mas indicamos alternar com outro par.
 [Customer]: Tá ótimo então. Obrigada por esclarecer.
 [Support Agent]: Eu que agradeço! Se precisar de qualquer outra dica, estou por aqui.
CHAT53

Conversation.create!(channel: "Instagram", content: conversas_53, user_id: user.id)
#Rastramento (3)

conversas_54 = <<~CHAT54
 [Customer]: Oi, boa tarde. Meu pedido tá parado no rastreio faz 4 dias, ninguém resolve 😟
 [Support Agent]: Boa tarde! Aqui é a Paula da Beautiful Feet. Me passa o número do pedido, por favor?
 [Customer]: BF-92670. É a Sandália Luna Bege 38.
 [Support Agent]: Obrigada! Estou verificando agora no sistema…
 [Support Agent]: Consta aqui como “Em trânsito para a unidade de destino” desde segunda-feira.
 [Customer]: Exato! Hoje já é sexta 😡 Eu fico atualizando toda hora e nada muda.
 [Support Agent]: Você tem razão em ficar preocupada. Pode me enviar um print do status atual?
 [Customer]: Mando sim. [Customer sends image: print do rastreio parado há dias]
 [Support Agent]: Obrigada! Vou abrir um chamado urgente com a transportadora agora mesmo.
 [Customer]: Porque eu preciso desse sapato pra viajar amanhã.
 [Support Agent]: Entendo a urgência. Te retorno assim que a transportadora responder.
CHAT54

Conversation.create!(channel: "Whatsapp", content: conversas_54, user_id: user.id)

conversas_55 = <<~CHAT55
 [Customer]: Oi, meu pedido aparece como entregue, mas não chegou nada aqui!
 [Support Agent]: Oi! Sinto muito por isso 😔 Pode me informar o número do pedido?
 [Customer]: BF-93419. Era a Bota London Black 37.
 [Support Agent]: Obrigada! Um momento enquanto verifico…
 [Support Agent]: Consta aqui como entregue hoje às 10h32.
 [Customer]: Pois é, nesse horário eu tava no trabalho! Ninguém recebeu nada.
 [Support Agent]: Entendi. Você mora em condomínio?
 [Customer]: Moro, mas a portaria não recebeu nada também.
 [Support Agent]: Vou abrir um protocolo de “Entrega não reconhecida” com a transportadora agora.
 [Customer]: E eu fico sem resposta até quando?
 [Support Agent]: O prazo é de até 48h para retorno, mas vou acompanhar pessoalmente seu caso.
CHAT55

Conversation.create!(channel: "Whatsapp", content: conversas_55, user_id: user.id)

conversas_56 = <<~CHAT56
 [Customer]: Meu pedido tá aparecendo como cancelado e em rota de entrega ao mesmo tempo 😵‍💫
 [Support Agent]: Nossa, isso realmente confunde muito. Qual o número do pedido?
 [Customer]: BF-94003. Sandália Crystal Rosa 36.
 [Support Agent]: Obrigada! Deixa eu verificar aqui…
 [Support Agent]: No nosso sistema consta como “em rota”, mas a transportadora marcou como “cancelado por falha”.
 [Customer]: Como assim falha? Já foi pago tudo certinho!
 [Support Agent]: Sim, seu pagamento está confirmado. O erro foi operacional da transportadora.
 [Customer]: Então eu vou receber ou não?
 [Support Agent]: Vou solicitar reenvio imediato por outra transportadora pra evitar novos erros.
 [Customer]: Porque eu já tô perdendo a paciência 😤
 [Support Agent]: Você tem toda razão. Vou priorizar esse reenvio agora mesmo.
CHAT56

Conversation.create!(channel: "RA", content: conversas_56, user_id: user.id)
