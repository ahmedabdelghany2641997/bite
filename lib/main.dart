import 'package:bite/core/bloc_observer.dart';
import 'package:bite/core/networking/dio_helper.dart';
import 'package:bite/core/networking/supabase_services.dart';
import 'package:bite/features/auth/data/repo/auth_repo.dart';
import 'package:bite/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bite/features/favourites/data/repo/favourites_repo.dart';
import 'package:bite/features/favourites/presentation/cubit/favourites_cubit.dart';
import 'package:bite/features/splash/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();

  try {
    await SupabaseServices.init();
  } catch (e) {
    debugPrint("Supabase Initialization Error: $e");
  }
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit(AuthRepo())),
        BlocProvider(create: (context) => FavoritesCubit(FavoritesRepo())..loadFavorites()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Food App',
        home: SplashScreen(),
      ),
    );
  }
}

