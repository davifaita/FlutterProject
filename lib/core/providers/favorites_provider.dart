import 'package:flutter/material.dart';
import '../models/product.dart';

// Gerencia o estado dos produtos favoritos usando ChangeNotifier.
// Isso permite que widgets em diferentes telas reajam às mudanças.
class FavoritesProvider with ChangeNotifier {
  final List<Product> _favoriteProducts = [];

  List<Product> get favoriteProducts => _favoriteProducts;

  // Verifica se um produto está na lista de favoritos.
  bool isFavorite(Product product) {
    return _favoriteProducts.any((p) => p.id == product.id);
  }

  // Adiciona ou remove um produto dos favoritos.
  void toggleFavorite(Product product) {
    if (isFavorite(product)) {
      // Remove se já for favorito
      _favoriteProducts.removeWhere((p) => p.id == product.id);
    } else {
      // Adiciona se não for favorito
      _favoriteProducts.add(product);
    }
    // Notifica todos os listeners (widgets) para reconstruírem.
    notifyListeners();
  }
}