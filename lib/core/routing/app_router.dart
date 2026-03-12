
// import 'package:flutter/material.dart';
// import 'routes.dart';

// class AppRouter {
//   Route generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case AppRoutes.signUpScreen:
//         return MaterialPageRoute(builder: (context){
//           return SignupScreen();
//         });
//       case AppRoutes.loginScreen:
//         return MaterialPageRoute(builder: (context){
//           return LoginScreen();
//         });
//       case AppRoutes.layoutBottomNavBarScreen:
//         return MaterialPageRoute(builder: (context){
//           return LayoutBottomNavBarScreen();
//         });

//       case AppRoutes.mycoursesScreen:
//         return MaterialPageRoute(builder: (context){
//           return MycoursesScreen();
//         });
//       // case AppRoutes.courseVideosScreen:
//       //   return MaterialPageRoute(builder: (context){
//       //     return CourseVideosScreen(courseId: '',);
//       //   });

//       case AppRoutes.courseDetailsScreen:

//         return MaterialPageRoute(builder: (context){
//           final course = settings.arguments as CourseModel;
//           return CourseDetailsScreen(courseModel:course ,);
//         });

//       case AppRoutes.homeScreen:
//         return MaterialPageRoute(builder: (context){
//           return HomeScreen();
//         });

//       default:
//         return MaterialPageRoute(
//           builder: (context) {
//             return Scaffold(
//               body: Center(
//                 child: Text('No route defined for ${settings.name}'),
//               ),
//             );
//           },
//         );

//     }
//   }
// }