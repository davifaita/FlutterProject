import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../auth/login_page.dart';
import '../splash/startup_animation.dart';
import 'tabs/about_tab.dart';
import 'tabs/favorites_tab.dart';
import 'tabs/products_tab.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _tabs = [
    const ProductsTab(),
    const FavoritesTab(),
    const AboutTab(),
  ];

  int _selectedTabIndex = 0;
  bool showAnimation = true;

  String userName = ""; 

  @override
  void initState() {
    super.initState();
    _loadUserName();

    Future.delayed(const Duration(milliseconds: 80), () {
      setState(() {
        showAnimation = true;
      });
    });
  }

 
  Future<void> _loadUserName() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString('user_name') ?? "";
    setState(() {
      userName = name;
    });
  }

  void _selectTab(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
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
          ListTile(
            leading: const Icon(Icons.shopping_bag, size: 26),
            title: const Text('Produtos', style: TextStyle(fontSize: 20)),
            onTap: () {
              _selectTab(0);
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite, size: 26),
            title: const Text('Meus Produtos (Favoritos)',
                style: TextStyle(fontSize: 20)),
            onTap: () {
              _selectTab(1);
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: const Icon(Icons.info, size: 26),
            title: const Text('Sobre', style: TextStyle(fontSize: 20)),
            onTap: () {
              _selectTab(2);
              Navigator.of(context).pop();
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.exit_to_app, size: 26, color: Colors.red),
            title: const Text('Sair',
                style: TextStyle(fontSize: 20, color: Colors.red)),
            onTap: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                LoginPage.routeName,
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: Text(appBarTitle),
            backgroundColor: Colors.blueAccent,
            foregroundColor: Colors.white,
          ),
          drawer: _buildDrawer(context),

      
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Text(
                  userName.isNotEmpty ? "Olá, $userName 👋" : "Olá!",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(child: _tabs[_selectedTabIndex]),
            ],
          ),

          bottomNavigationBar: BottomNavigationBar(
            onTap: _selectTab,
            currentIndex: _selectedTabIndex,
            selectedItemColor: Colors.blueAccent,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
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
        ),
        if (showAnimation)
          Positioned.fill(
            child: StartupAnimation(
              onAnimationComplete: () {
                setState(() => showAnimation = false);
              },
            ),
          ),
      ],
    );
  }
}
