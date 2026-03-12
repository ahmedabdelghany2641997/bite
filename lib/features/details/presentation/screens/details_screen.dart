import 'package:bite/features/details/data/repo/details_repo.dart';
import 'package:bite/features/favourites/presentation/cubit/favourites_cubit.dart';
import 'package:bite/features/favourites/presentation/cubit/favourites_states.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bite/features/details/presentation/cubit/details_cubit.dart';
import 'package:bite/features/details/presentation/cubit/details_states.dart';

class MealDetailsScreen extends StatelessWidget {
  final String mealId;

  const MealDetailsScreen({super.key, required this.mealId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailsCubit(DetailsRepo())..detailsMeals(id: mealId),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<DetailsCubit, DetailsStates>(
          builder: (context, state) {
            if (state is DetailsLoadingState) {
              return const Center(
                child: CircularProgressIndicator(color: Color(0xFFFF7043)),
              );
            } else if (state is DetailsSuccessState) {
              final meal = state.details;
              return Stack(
                children: [
                  _buildMainContent(meal),
                  _buildBottomButton(meal), 
                ],
              );
            } else if (state is DetailsErrorState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Error: ${state.error}"),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () => context.read<DetailsCubit>().detailsMeals(id: mealId),
                      child: const Text("Retry"),
                    ),
                  ],
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  Widget _buildMainContent(dynamic meal) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.network(
                meal.image,
                height: 350,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 50,
                left: 20,
                child: Builder(
                  builder: (innerContext) {
                    return CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () => Navigator.pop(innerContext),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Container(
            transform: Matrix4.translationValues(0, -30, 0),
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    _buildTag(meal.category, const Color(0xFFFFE0D8), const Color(0xFFFF7043)),
                    const SizedBox(width: 10),
                    _buildTag(meal.area, Colors.blueGrey.shade50, Colors.blueGrey),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  meal.name,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Ingredients",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                ...meal.ingredients.map((item) => _buildIngredientItem(item)).toList(),
                const SizedBox(height: 24),
                const Text(
                  "Instructions",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  meal.instructions,
                  style: TextStyle(color: Colors.grey.shade700, height: 1.6, fontSize: 15),
                ),
                const SizedBox(height: 120),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTag(String text, Color bgColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(20)),
      child: Text(text, style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 12)),
    );
  }

  Widget _buildIngredientItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Color(0xFFFF7043), size: 22),
          const SizedBox(width: 12),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 15))),
        ],
      ),
    );
  }

  Widget _buildBottomButton(dynamic meal) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white.withOpacity(0.0), Colors.white],
          ),
        ),
        child: BlocBuilder<FavoritesCubit, FavoritesStates>(
          builder: (context, state) {
            bool isFav = context.read<FavoritesCubit>().isFavorite(meal.id);

            return ElevatedButton.icon(
              onPressed: () {
                context.read<FavoritesCubit>().toggleFavorite(meal.id);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(isFav ? "Removed from Favorites" : "Added to Favorites"),
                    duration: const Duration(milliseconds: 700),
                    backgroundColor: const Color(0xFFFF7043),
                  ),
                );
              },
              icon: Icon(isFav ? Icons.favorite : Icons.favorite_border, color: Colors.white),
              label: Text(
                isFav ? "In Favorites" : "Add to Favorites",
                style: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: isFav ? Colors.redAccent : const Color(0xFFFF7043),
                minimumSize: const Size(double.infinity, 58),
                elevation: 5,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
              ),
            );
          },
        ),
      ),
    );
  }
}