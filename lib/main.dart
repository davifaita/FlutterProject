import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/providers/auth_provider.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: Consumer<AuthProvider>(
        builder: (context, auth, child) {
          return MaterialApp(
            title: 'Flutter Store App',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              fontFamily: 'Inter',
              useMaterial3: false,
            ),

            routes: {
              LoginPage.routeName: (_) => LoginPage(),
              SignUpPage.routeName: (_) => SignUpPage(),
              HomePage.routeName: (_) => const HomePage(),
              ProductDetailPage.routeName: (_) => const ProductDetailPage(),
            },

            initialRoute:
                auth.isLoggedIn ? HomePage.routeName : LoginPage.routeName,
          );
        },
      ),
    );
  }
}
