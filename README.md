#Flutter Store App

<<<<<<< HEAD

Este projeto é uma aplicação Flutter simples que simula um e-commerce, desenvolvido para fins acadêmicos na disciplina de Sistemas Móveis.

Como Executar o Projeto:
=======
   Este projeto é uma aplicação Flutter simples que simula um e-commerce, desenvolvido para fins acadêmicos na disciplina de Sistemas Móveis.

#Como Executar o Projeto:
>>>>>>> 2c1c6c587b5837e68b2e4f36b9dd4da63029dce5

   Para rodar este projeto em seu ambiente de desenvolvimento, siga os passos abaixo:

#Configuração de Assets (Imagens Locais)

<<<<<<< HEAD
  O projeto usa imagens que devem estar salvas localmente.

  Crie a seguinte estrutura de pastas na raiz do seu projeto:

    flutter_store_app/assets/images/
=======
   O projeto usa imagens que devem estar salvas localmente.

   Crie a seguinte estrutura de pastas na raiz do seu projeto:

   flutter_store_app/assets/images/
>>>>>>> 2c1c6c587b5837e68b2e4f36b9dd4da63029dce5

   Adicione os arquivos de imagem (ex: smartwatch.png, fone.png, teclado.png, etc.) na pasta assets/images/.

<<<<<<< HEAD
  Adicione os arquivos de imagem (ex: smartwatch.png, fone.png, teclado.png, etc.) na pasta assets/images/.
=======
#Instalação das Dependências
>>>>>>> 2c1c6c587b5837e68b2e4f36b9dd4da63029dce5

 Abra o terminal na pasta raiz do projeto (onde está o pubspec.yaml) e execute:

   flutter pub get

 Este comando instala o pacote provider e registra os caminhos dos assets locais.

#Iniciar a Aplicação

  Para garantir o carregamento correto dos assets, execute a limpeza e rode o app:

  Opcional, mas recomendado após mexer nos assets:

   flutter clean

<<<<<<< HEAD
Opcional, mas recomendado após mexer nos assets
flutter clean 

Executa o aplicativo
flutter run
=======
  Executa o aplicativo:
>>>>>>> 2c1c6c587b5837e68b2e4f36b9dd4da63029dce5

   flutter run

O aplicativo será iniciado na Tela de Login.

<<<<<<< HEAD
 Telas Implementadas
=======
#Telas Implementadas:
>>>>>>> 2c1c6c587b5837e68b2e4f36b9dd4da63029dce5

   A aplicação é composta por três grupos principais de telas:

#Autenticação

<<<<<<< HEAD
  Login Page: Ponto de entrada do aplicativo. Possui validação simples de campos e redireciona para a Home.

  Sign Up Page (Cadastro): Permite a criação simulada de conta, incluindo validação para garantir que as senhas digitadas sejam iguais.
=======
  Login Page: Tela de entrada do aplicativo. Realiza validação completa dos campos, verificando se o e-mail e a senha foram preenchidos corretamente e se correspondem aos dados cadastrados no sistema.
  Inclui feedback visual de carregamento e só permite o acesso à Home quando o login é válido.

  Sign Up Page (Cadastro): Tela destinada à criação de uma nova conta. Possui validações de nome, e-mail e senha, incluindo regras obrigatórias, formato correto de e-mail, confirmação de senha e verificação de e-mail único, 
  impedindo que um usuário seja cadastrado duas vezes com o mesmo endereço. Apresenta animação de carregamento durante o processo e, após o cadastro bem-sucedido, redireciona o usuário de volta ao login.
>>>>>>> 2c1c6c587b5837e68b2e4f36b9dd4da63029dce5

#Tela Principal (Home)

  A Home é a tela que o usuário acessa após o login. Ela contém um Drawer (Menu Lateral) e um Bottom Navigation Bar (Navegação Inferior) para acessar:

  Produtos (Default): Exibe a lista completa de produtos mockados.

  Meus Produtos (Favoritos): Exibe a lista de produtos marcados como favoritos (gerenciada localmente via Provider).

  Sobre: Exibe informações estáticas sobre o aplicativo.

#Detalhes do Produto

<<<<<<< HEAD
  Product Detail Page: Abre ao clicar em qualquer produto da lista. Exibe a imagem local, nome, preço e descrição, além de permitir favoritar/desfavoritar o item.
=======
  Product Detail Page: Abre ao clicar em qualquer produto da lista. Exibe a imagem local, nome, preço e descrição, além de permitir favoritar/desfavoritar o item.
>>>>>>> 2c1c6c587b5837e68b2e4f36b9dd4da63029dce5
