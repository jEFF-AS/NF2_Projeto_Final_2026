# NeoBank - Relatório da Atividade Avaliativa NF2

Curso : Sistemas de Informação
Avaliação: Checagem IV
Tema: NF2 - Fidelização de Usuário na Aplicação
Professor: Me. Luis Vinicius Costa Silva
Turma: Noturno – 1º Semestre 2026

---

## Sobre o Projeto

Este é o projeto base NeoBank, um aplicativo financeiro simples desenvolvido em Flutter.

O app já possui:

* Tela inicial com saldo
* Lista de últimas transações
* Tela de nova transferência

No entanto, os usuários testaram o aplicativo e relataram que:

* Falta feedback claro após realizar ações
* A tela de transferência é um pouco confusa
* Falta sensação de segurança
* O app ainda não transmite sensação de personalização

---

## Objetivo da Atividade

Melhorar a fidelização de usuários aplicando conceitos de UI e UX no NeoBank.

---

## Instruções

### 1. Como começar

1. Faça Fork deste repositório
2. Clone o seu fork para sua máquina:

   ```bash
   git clone https://github.com/SEU-USUARIO/neobank_app.git
   ```
3. Abra o projeto no VS Code ou Android Studio
4. Rode o comando:

   ```bash
   flutter pub get
   ```
5. Execute o app (`flutter run`)

---

### 2. O que você deve fazer

Escolha e implemente exatamente 4 melhorias das opções abaixo:

* [x] Melhoria 1: Adicionar feedback visual claro após realizar uma transferência (SnackBar ou Dialog de sucesso)
* [x] Melhoria 2: Melhorar a tela de transferência adicionando valores sugeridos (R$ 50, R$ 100, R$ 200) e máscara de dinheiro
* [x] Melhoria 3: Criar uma confirmação simples de transferência (tela ou Dialog com PIN 1234)
* [x] Melhoria 4: Permitir esconder/mostrar o saldo na tela inicial (com ícone de olho)
* [ ] Melhoria 5: Mudar as cores do app e deixar o cartão de saldo mais atraente
* [ ] Melhoria 6: Salvar as novas transações usando `SharedPreferences` (persistência básica)

---

### 3. Parte Teórica

a) Qual a diferença entre UI e UX? Como as melhorias que você fez impactam cada um deles? 

A UI é a parte visual (botões, cores, layout), enquanto a UX é a experiência e facilidade de uso. As melhorias que fiz impactaram a UI com a adição de novos elementos (ícone de olho e botões de valores), e melhoraram a UX por deixarem o app mais rápido (atalhos de valor) e mais privativo (esconder o saldo).

b) Explique como o feedback ao usuário e a sensação de segurança ajudam na fidelização de clientes em um app financeiro.

Em apps de banco, o maior medo da pessoa é perder dinheiro. Dar um feedback claro (mensagem de sucesso) e segurança extra (pedir PIN) mostram que o aplicativo é confiável. Quando o usuário se sente seguro e entende o que o app está fazendo, ele não troca de banco.

c) Por que é importante testar as mudanças com usuários antes de publicar o app? 

Porque quem programa já sabe como o app funciona, mas o usuário comum pode se confundir. Testar antes serve para descobrir se a tela está realmente fácil de usar e para corrigir erros antes de lançar para o público.

d) Escolha uma das melhorias que você implementou e explique como ela melhora a experiência e a confiança do usuário. 

A confirmação com PIN. Ela melhora a confiança porque cria uma trava de segurança. Se o usuário esbarrar no botão sem querer, o dinheiro não sai direto. Pedir a senha dá tempo para ele confirmar a ação, o que evita acidentes e mostra que o app protege o dinheiro dele.

---
