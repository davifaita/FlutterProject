🛍 Flutter Store App

Este projeto é uma aplicação Flutter simples que simula um e-commerce, desenvolvido para fins acadêmicos na disciplina de Sistemas Móveis. Ele demonstra o uso de widgets essenciais, navegação com Navigator e gerenciamento de estado local com Provider.

🚀 Como Executar o Projeto

Para rodar este projeto em seu ambiente de desenvolvimento, siga os passos abaixo:

1. Configuração de Assets (Imagens Locais)

O projeto depende de imagens locais (assets). O carregamento só funcionará se a estrutura de pastas e a configuração estiverem corretas.

Crie a seguinte estrutura de pastas na raiz do seu projeto:

flutter_store_app/
└── assets/
    └── images/


Adicione os arquivos de imagem (ex: smartwatch.png, fone.png, teclado.png, etc.) na pasta assets/images/.

2. Instalação e Configuração

Abra o terminal na pasta raiz do projeto (onde está o pubspec.yaml) e execute:

flutter pub get


Este comando instala o pacote provider e registra os caminhos dos assets locais definidos no pubspec.yaml.

3. Iniciar a Aplicação

Para garantir o carregamento correto dos assets (principalmente após adicionar novas imagens), é recomendável limpar o cache e rodar o app:

# Opcional, mas recomendado após mexer nos assets
flutter clean

# Executa o aplicativo
flutter run


O aplicativo será iniciado na Tela de Login.

📱 Telas Implementadas

A aplicação é organizada em três grupos principais de telas:

A. Autenticação

Tela

Funcionalidade Principal

Login Page

Ponto de entrada. Possui validação simples e redireciona para a Home.

Sign Up Page

Permite a criação simulada de conta, incluindo validação para garantir que as senhas digitadas sejam iguais.

B. Tela Principal (Home)

A Home é a tela acessada após o login. Ela utiliza um Scaffold com Drawer e Bottom Navigation Bar para navegação entre as abas:

Aba

Descrição

Produtos

(Padrão) Exibe a lista completa de produtos mockados.

Meus Produtos (Favoritos)

Exibe a lista de itens marcados como favoritos (gerenciada localmente via Provider).

Sobre

Exibe informações estáticas sobre o aplicativo e a equipe.

C. Detalhes do Produto

Product Detail Page: Abre ao clicar em qualquer produto da lista.

Funcionalidades: Exibe a imagem local (Image.asset), nome, preço e descrição, além de permitir favoritar/desfavoritar o item, atualizando o estado global.
