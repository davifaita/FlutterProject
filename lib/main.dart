import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/providers/favorites_provider.dart';
import 'presentation/pages/auth/login_page.dart';
import 'presentation/pages/auth/signup_page.dart';
import 'presentation/pages/home/home_page.dart';
import 'presentation/pages/product_detail/product_detail_page.dart';

void main() {
  runApp(const FlutterStoreApp());
}

class FlutterStoreApp extends StatelessWidget {
  const FlutterStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Usa ChangeNotifierProvider para injetar o gerenciador de estado de favoritos
    // na árvore de widgets, permitindo que todas as telas o acessem.
    return ChangeNotifierProvider(
      create: (context) => FavoritesProvider(),
      child: MaterialApp(
        title: 'Flutter Store App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          // Define a fonte padrão como 'Inter' (ou a fonte padrão do Flutter)
          fontFamily: 'Inter', 
          useMaterial3: false, // Uso do Material 2 para melhor compatibilidade com a aparência clássica
        ),
        
        // Define as rotas nomeadas
        routes: {
          // Rota inicial - Tela de Login
          LoginPage.routeName: (context) => const LoginPage(), 
          
          // Rotas principais
          SignUpPage.routeName: (context) => const SignUpPage(),
          HomePage.routeName: (context) => const HomePage(),
          
          // Rota de Detalhes (recebe o objeto Produto)
          ProductDetailPage.routeName: (context) => const ProductDetailPage(),
        },
        
        // Garante que a aplicação comece na tela de login
        initialRoute: LoginPage.routeName,
      ),
    );
  }
}