import 'package:flutter/material.dart';
import '../auth/login_page.dart';
import 'tabs/about_tab.dart';
import 'tabs/favorites_tab.dart';
import 'tabs/products_tab.dart';

// Tela inicial (Home) que contém o BottomNavigationBar e o Drawer.
class HomePage extends StatefulWidget {
  static const routeName = '/home';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Lista das abas (páginas) que serão exibidas
  final List<Widget> _tabs = [
    const ProductsTab(),
    const FavoritesTab(),
    const AboutTab(),
  ];

  int _selectedTabIndex = 0;

  void _selectTab(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  // Widget para construir o Drawer (Menu Lateral)
  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          // Cabeçalho do Drawer (Container)
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Colors.blueAccent,
            child: const Text(
              'Flutter Store',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          
          const SizedBox(height: 20),

          // Opções de Navegação do Drawer
          ListTile(
            leading: const Icon(Icons.shopping_bag, size: 26),
            title: const Text('Produtos', style: TextStyle(fontSize: 20)),
            onTap: () {
              // Navega para a Tab de Produtos (índice 0)
              _selectTab(0);
              Navigator.of(context).pop(); // Fecha o Drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite, size: 26),
            title: const Text('Meus Produtos (Favoritos)', style: TextStyle(fontSize: 20)),
            onTap: () {
              // Navega para a Tab de Favoritos (índice 1)
              _selectTab(1);
              Navigator.of(context).pop(); // Fecha o Drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.info, size: 26),
            title: const Text('Sobre', style: TextStyle(fontSize: 20)),
            onTap: () {
              // Navega para a Tab Sobre (índice 2)
              _selectTab(2);
              Navigator.of(context).pop(); // Fecha o Drawer
            },
          ),
          const Divider(),
          
          // Opção Sair (volta ao login)
          ListTile(
            leading: const Icon(Icons.exit_to_app, size: 26, color: Colors.red),
            title: const Text('Sair', style: TextStyle(fontSize: 20, color: Colors.red)),
            onTap: () {
              // Redireciona para a tela de Login (rota raiz)
              Navigator.of(context).pushNamedAndRemoveUntil(LoginPage.routeName, (route) => false);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Define o título do AppBar com base na aba selecionada
    String appBarTitle = '';
    switch (_selectedTabIndex) {
      case 0:
        appBarTitle = 'Produtos';
        break;
      case 1:
        appBarTitle = 'Meus Produtos (Favoritos)';
        break;
      case 2:
        appBarTitle = 'Sobre a Loja';
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      
      // O Drawer é exibido no menu lateral
      drawer: _buildDrawer(context),
      
      // Exibe o conteúdo da Tab selecionada
      body: _tabs[_selectedTabIndex],
      
      // Tab de Navegação na parte inferior (Bottom Navigation Bar funcional)
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectTab,
        currentIndex: _selectedTabIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed, // Garante que todos os itens sejam visíveis
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Produtos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Sobre',
          ),
        ],
      ),
    );
  }
}