import 'package:bite/features/details/presentation/screens/details_screen.dart';
import 'package:bite/features/meals/data/model/meals_model.dart';
import 'package:bite/features/meals/data/repo/meals_repo.dart';
import 'package:bite/features/meals/presentation/cubit/meals_cubit.dart';
import 'package:bite/features/meals/presentation/cubit/meals_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MealsScreen extends StatelessWidget {
  final String categoryName;

  const MealsScreen({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MealsCubit(MealsRepo())..getMeals(categoryName: categoryName),
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F8F8),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.orange),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            "$categoryName Recipes",
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search, color: Colors.black),
            ),
          ],
        ),
        body: BlocBuilder<MealsCubit, MealsStates>(
          builder: (context, state) {
            if (state is MealsLoadingState) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.orange),
              );
            } else if (state is MealsSuccessState) {
              return GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.75,
                ),
                itemCount: state.meals.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MealDetailsScreen(
                            mealId: state.meals[index].idMeal,
                          ),
                        ),
                      );
                    },
                    child: buildMealItem(state.meals[index]),
                  );
                },
              );
            } else if (state is MealsErrorState) {
              return Center(child: Text(state.error));
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  Widget buildMealItem(MealModel meal) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(15),
              ),
              child: Image.network(
                meal.strMealThumb,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  meal.strMeal,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.access_time, size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      "25 mins",
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
