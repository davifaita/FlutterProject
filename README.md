Flutter Store App

Este projeto é uma aplicação Flutter simples que simula um e-commerce, desenvolvido para fins acadêmicos na disciplina de Sistemas Móveis.

Como Executar o Projeto

Para rodar este projeto em seu ambiente de desenvolvimento, siga os passos abaixo:

1. Configuração de Assets (Imagens Locais)

O projeto usa imagens que devem estar salvas localmente.

Crie a seguinte estrutura de pastas na raiz do seu projeto:

flutter_store_app/
└── assets/
    └── images/


Adicione os arquivos de imagem (ex: smartwatch.png, fone.png, teclado.png, etc.) na pasta assets/images/.

2. Instalação das Dependências

Abra o terminal na pasta raiz do projeto (onde está o pubspec.yaml) e execute:

flutter pub get


Este comando instala o pacote provider e registra os caminhos dos assets locais.

3. Iniciar a Aplicação

Para garantir o carregamento correto dos assets, execute a limpeza e rode o app:

 Opcional, mas recomendado após mexer nos assets
flutter clean 

 Executa o aplicativo
flutter run


O aplicativo será iniciado na Tela de Login.

📱 Telas Implementadas

A aplicação é composta por três grupos principais de telas:

1. Autenticação

Login Page: Ponto de entrada do aplicativo. Possui validação simples de campos e redireciona para a Home.

Sign Up Page (Cadastro): Permite a criação simulada de conta, incluindo validação para garantir que as senhas digitadas sejam iguais.

2. Tela Principal (Home)

A Home é a tela que o usuário acessa após o login. Ela contém um Drawer (Menu Lateral) e um Bottom Navigation Bar (Navegação Inferior) para acessar:

Produtos (Default): Exibe a lista completa de produtos mockados.

Meus Produtos (Favoritos): Exibe a lista de produtos marcados como favoritos (gerenciada localmente via Provider).

Sobre: Exibe informações estáticas sobre o aplicativo.

3. Detalhes do Produto

Product Detail Page: Abre ao clicar em qualquer produto da lista. Exibe a imagem local, nome, preço e descrição, além de permitir favoritar/desfavoritar o item.
