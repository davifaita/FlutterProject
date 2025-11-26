import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Providers
import 'core/providers/auth_provider.dart';
import 'core/providers/favorites_provider.dart';

// Pages
import 'presentation/pages/auth/login_page.dart';
import 'presentation/pages/auth/signup_page.dart';
import 'presentation/pages/home/home_page.dart';
import 'presentation/pages/product_detail/product_detail_page.dart';

// Novo Splash
import 'presentation/pages/splash/splash_screen.dart';

void main() {
  runApp(const FlutterStoreApp());
}

class FlutterStoreApp extends StatelessWidget {
  const FlutterStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        // Splash agora é a tela inicial
        home: const SplashScreen(),

        // Rotas nomeadas
        routes: {
          LoginPage.routeName: (_) => const LoginPage(),
          SignUpPage.routeName: (_) => const SignUpPage(),
          HomePage.routeName: (_) => const HomePage(),
          ProductDetailPage.routeName: (_) => const ProductDetailPage(),
        },
      ),
    );
  }
}
