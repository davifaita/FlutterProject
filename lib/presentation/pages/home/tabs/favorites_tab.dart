import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/providers/favorites_provider.dart';
import '../../../../shared/components/product_card.dart';

// Tab que lista apenas os produtos favoritados pelo usuário.
class FavoritesTab extends StatelessWidget {
  const FavoritesTab({super.key});

  @override
  Widget build(BuildContext context) {
    // O Consumer escuta as mudanças no FavoritesProvider e reconstrói este widget.
    return Consumer<FavoritesProvider>(
      builder: (context, favoritesProvider, child) {
        final favoriteProducts = favoritesProvider.favoriteProducts;

        if (favoriteProducts.isEmpty) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.favorite_border, size: 80, color: Colors.grey),
                SizedBox(height: 10),
                Text(
                  'Você ainda não favoritou nenhum produto.',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }

        // ListView.builder para listar os favoritos
        return ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          itemCount: favoriteProducts.length,
          itemBuilder: (context, index) {
            return ProductCard(product: favoriteProducts[index]);
          },
        );
      },
    );
  }
}
