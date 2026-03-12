
import 'package:bite/core/constants/app_colors.dart';
import 'package:bite/features/layout/presentation/cubit/layout_cubit.dart';
import 'package:bite/features/layout/presentation/cubit/layout_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutBottomNavBarScreen extends StatelessWidget {
  const LayoutBottomNavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: BlocConsumer<LayoutCubit, LayoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: context
                .read<LayoutCubit>()
                .screens[context.read<LayoutCubit>().currentIndex],
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,blurRadius: 30,
                    offset: Offset(0, 20),
                  )
                ]
              ),
              child: BottomNavigationBar(
                selectedItemColor: AppColors.primaryColor,
                unselectedItemColor: const Color.fromARGB(255, 202, 199, 199),
                selectedIconTheme: IconThemeData(size: 28),
                unselectedIconTheme: IconThemeData(size: 24),
                selectedLabelStyle: TextStyle(fontWeight: .w600, fontSize: 20),
                unselectedLabelStyle: TextStyle(fontWeight: .w500, fontSize: 15),
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.white,
                currentIndex: context.read<LayoutCubit>().currentIndex,
              
                onTap: (int index) {
                  context.read<LayoutCubit>().changeIndex(index);
                },
                items: [
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: "HOME"),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.favorite),
                    label: "FAVORITES",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: "PROFILE",
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
