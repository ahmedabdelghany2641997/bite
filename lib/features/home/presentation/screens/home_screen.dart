import 'package:bite/core/theme/text_style.dart';
import 'package:bite/core/widgets/custom_text_form_field.dart';
import 'package:bite/features/home/data/repo/category_repo.dart';
import 'package:bite/features/home/presentation/cubit/category_cubit.dart';
import 'package:bite/features/home/presentation/cubit/category_states.dart';
import 'package:bite/features/home/presentation/screens/widgets/gridview_home_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>CategoryCubit(CategoryRepo())..getCategory(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: .max,
                      children: [
                        Text(
                          "Recipe Finder",
                          style: AppTextStyle.s20bold(context),
                        ),
                        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: [
                      CustomTextfield(
                        prefixIcon: Icon(Icons.search),
                        hintText: "Search recipes, ingredients...",
                      ),
                      SizedBox(height: 15),
                      SizedBox(
                        height: 40,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Categories",
                              style: AppTextStyle.s20bold(context),
                            ),
                            Text(
                              "See All",
                              style: AppTextStyle.s10Reglur(context),
                            ),
                          ],
                        ),
                      ),

                      BlocBuilder<CategoryCubit, CategoryStates>(
                        builder: (context, state) {
                          if (state is LoadingCategoryStates) {
                            return const GridviewHomeScreen(
                              category: [],
                              isLoading: true,
                            );
                          } else if (state is ErrorCategoryStates) {
                            return Center(child: Text(state.error));
                          } else if (state is SuccessCategoryStates) {
                            return GridviewHomeScreen(
                              category: state.category,
                              isLoading: false,
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
