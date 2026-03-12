import 'package:bite/core/functions.dart';
import 'package:bite/core/widgets/CustomGradientButton.dart';
import 'package:bite/core/widgets/custom_text_form_field.dart';
import 'package:bite/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bite/features/auth/presentation/cubit/auth_state.dart';
import 'package:bite/features/auth/presentation/screens/signup_screen.dart';
import 'package:bite/features/auth/presentation/screens/widgets/custom_text.dart';
import 'package:bite/features/home/presentation/screens/home_screen.dart';
import 'package:bite/features/layout/presentation/screens/layout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SigninScreen> {
  TextEditingController signinEmailController = TextEditingController();
  TextEditingController signinNameController = TextEditingController();
  TextEditingController signinPasswordController = TextEditingController();
  final GlobalKey<FormState> loginformkey = GlobalKey<FormState>();
  bool isPasswordHidden = true;

  @override
  void dispose() {
    super.dispose();
    signinEmailController.dispose();
    signinPasswordController.dispose();
    signinNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LayoutBottomNavBarScreen(),
              ),
            );
          }
          if (state is LoginErrorState) {
            snackBarMessage(context: context, text: "not found");
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: Form(
                  key: loginformkey,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/imagelogo.png",
                              height: 96,
                              width: 96,
                            ),
                            SizedBox(width: 50),
                            Text(
                              'Recipe Finder',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Plus Jakarta Sans',
                                fontWeight: FontWeight.w800,
                                fontSize: 20,
                                height: 40 / 36,
                                letterSpacing: -0.9,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 8,
                            bottom: 8,
                            left: 8,
                            right: 8,
                          ),
                          child: Column(
                            mainAxisAlignment: .start,
                            crossAxisAlignment: .start,
                            children: [
                              Image.asset(
                                "assets/images/image.png",
                                height: 200,
                                width: double.infinity,
                              ),
                              const SizedBox(height: 16),
                              const Text(
                                'Welcome Back',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Plus Jakarta Sans',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 26,
                                  height: 40 / 36,
                                  letterSpacing: -0.9,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Sign in to continue your culinary journey',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Plus Jakarta Sans',
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14,
                                  letterSpacing: 1.2,
                                  color: Colors.black.withOpacity(0.8),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: .start,
                          children: [
                            SizedBox(height: 15),
                            CustomText(text: 'Email'),
                            SizedBox(height: 15),
                            CustomTextfield(
                              prefixIcon: Icon(Icons.email_outlined),
                              controller: signinEmailController,
                              hintText: "enter your email",
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return "enter your email pls";
                                }
                                if (!val.contains("@")) {
                                  return "write correct email";
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 10),
                            CustomText(text: 'Password'),
                            SizedBox(height: 15),

                            CustomTextfield(
                              obscureText: isPasswordHidden,

                              prefixIcon: Icon(Icons.lock_outline),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  isPasswordHidden
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isPasswordHidden = !isPasswordHidden;
                                  });
                                },
                              ),
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return "enter your password pls";
                                }
                                if (val.length < 6) {
                                  return "write valid password more than 6 chart";
                                }
                                return null;
                              },
                              // prefixIcon: Icon(Icons.password_outlined),
                              controller: signinPasswordController,
                              hintText: "enter your password",
                            ),
                            Align(
                              alignment: .centerRight,
                              child: Text(
                                'Forget Password?',
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            SizedBox(height: 25),
                            CustomGradientButton(
                              text: 'Sign In',
                              onTap: () {
                                if (loginformkey.currentState!.validate()) {
                                  context.read<AuthCubit>().signin(
                                    password: signinPasswordController.text
                                        .trim(),
                                    email: signinEmailController.text.trim(),
                                  );
                                }
                              },
                            ),
                            const SizedBox(height: 24),
                            Row(
                              children: [
                                const Flexible(
                                  fit: .loose,
                                  child: Divider(
                                    thickness: 1,
                                    color: Color(0xFFE2E8F0),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                  child: Text(
                                    'Or continue with',
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(0.5),
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                const Flexible(
                                  fit: .loose,
                                  child: Divider(
                                    thickness: 1,
                                    color: Color(0xFFE2E8F0),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: .center,
                              children: [
                                OutlinedButton(
                                  onPressed: () {},
                                  child: Text("Google"),
                                ),
                                SizedBox(width: 15),

                                OutlinedButton(
                                  onPressed: () {},
                                  child: Text("Apple"),
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Dont have an account? ',
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.6),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SignupScreen(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      color: Color(0xFFEE4327),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
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
        },
      ),
    );
  }
}
