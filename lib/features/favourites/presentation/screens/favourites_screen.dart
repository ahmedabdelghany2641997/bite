import 'package:bite/features/favourites/presentation/cubit/favourites_cubit.dart';
import 'package:bite/features/favourites/presentation/cubit/favourites_states.dart';
import 'package:bite/features/favourites/presentation/screens/widgets/card_favourites.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class MyFavoritesScreen extends StatelessWidget {
  const MyFavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<FavoritesCubit>().loadFavorites();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "My Favorites",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: BlocBuilder<FavoritesCubit, FavoritesStates>(
        builder: (context, state) {
          if (state is FavoritesLoadingState) {
            return const Center(child: CircularProgressIndicator(color: Color(0xFFFF7043)));
          } else if (state is FavoritesSuccessState) {
            if (state.favoriteMeals.isEmpty) {
              return _buildEmptyState();
            }
            return GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, 
                childAspectRatio: 0.75, 
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemCount: state.favoriteMeals.length,
              itemBuilder: (context, index) {
                return FavoriteMealCard(meal: state.favoriteMeals[index]);
              },
            );
          } else {
            return const Center(child: Text("Something went wrong!"));
          }
        },
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.favorite_border, size: 80, color: Colors.grey.shade300),
          const SizedBox(height: 16),
          Text(
            "No Favorites Yet",
            style: TextStyle(color: Colors.grey.shade600, fontSize: 18),
          ),
        ],
      ),
    );
  }
}