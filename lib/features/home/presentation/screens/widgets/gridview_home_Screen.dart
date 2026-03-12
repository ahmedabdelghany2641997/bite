import 'package:bite/core/widgets/loading_shimma.dart';
import 'package:bite/features/home/data/model/category_model.dart';
import 'package:bite/features/meals/presentation/screens/meals_screen.dart';
import 'package:flutter/material.dart';

class GridviewHomeScreen extends StatelessWidget {
  final List<CategoryModel> category;
  final bool isLoading;
  const GridviewHomeScreen({super.key, required this.category, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.7,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      itemCount: isLoading ?6 : category.length ,
      itemBuilder: (context, index) {
if (isLoading) {
          return CategoryShimmerLoading();
        }

        return GestureDetector
        (
          onTap: () {
      print("Selected Category: ${category[index].name}");
      
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MealsScreen(categoryName: category[index].name),
        ),
      );
    },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(45),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(45),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.network(
                      category[index].image,
                      fit: BoxFit.cover,
                    ),
                  ),
          
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.5),
                          ],
                        ),
                      ),
                    ),
                  ),
          
                  Positioned(
                    bottom: 20,
                    left: 20,
                    child: Text(
                      category[index].name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
