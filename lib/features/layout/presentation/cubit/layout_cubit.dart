
import 'package:bite/features/favourites/presentation/screens/favourites_screen.dart';
import 'package:bite/features/home/presentation/screens/home_screen.dart';
import 'package:bite/features/layout/presentation/cubit/layout_states.dart';
import 'package:bite/features/profile/presentation/screens/profile_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutInitState());



  List<Widget> screens = [
    const HomeScreen(),
       const MyFavoritesScreen(),
    const ProfileScreen(),

  ];



   int currentIndex = 0;
  void changeIndex(int val) {
    currentIndex = val;
    emit(ChangeBottomNavIndexState());
  }
}
