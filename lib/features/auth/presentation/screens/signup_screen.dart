import 'package:bite/core/functions.dart';
import 'package:bite/core/widgets/CustomGradientButton.dart';
import 'package:bite/core/widgets/custom_text_form_field.dart';
import 'package:bite/features/auth/data/repo/auth_repo.dart';
import 'package:bite/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bite/features/auth/presentation/cubit/auth_state.dart';
import 'package:bite/features/auth/presentation/screens/signin_screen.dart';
import 'package:bite/features/auth/presentation/screens/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> signupformkey = GlobalKey<FormState>();
  bool isPasswordHidden = true;
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state is SignupSuccessState) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SigninScreen()),
            );
          }
          if (state is SignupErrorState) {
            snackBarMessage(context: context, text:state.error);
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 10,
                ),
                child: Form(
                  key: signupformkey,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Center(
                              child: Image.asset(
                                "assets/images/imagelogo.png",
                                height: 96,
                                width: 96,
                              ),
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'Create Account',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Plus Jakarta Sans',
                                fontWeight: FontWeight.w800,
                                fontSize: 36,
                                height: 40 / 36,
                                letterSpacing: -0.9,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Join our community of food lover',
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
                        Column(
                          crossAxisAlignment: .start,
                          children: [
                            SizedBox(height: 15),
                            CustomText(text: 'Full Name'),
                            SizedBox(height: 15),
                            CustomTextfield(
                              prefixIcon: Icon(Icons.person_4_outlined),
                              controller: nameController,
                              hintText: "John Doe",
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return "enter your Name pls";
                                }
    
                                return null;
                              },
                            ),
                            SizedBox(height: 10),
    
                            CustomText(text: 'Email'),
                            SizedBox(height: 15),
                            CustomTextfield(
                              prefixIcon: Icon(Icons.email_outlined),
                              controller: emailController,
                              hintText: "hello@example.com",
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
                              controller: passwordController,
                              hintText: "••••••••",
                            ),
                            SizedBox(height: 25),
                            CustomGradientButton(
                              text: 'Sign Up',
                              onTap: () {
                                if (signupformkey.currentState!.validate()) {
                                  context.read<AuthCubit>().signup(
                                    password: passwordController.text.trim(),
                                    email: emailController.text.trim(),
                                    name: nameController.text.trim(),
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
                                    'Or sign up with',
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
                                  'Already have an account? ',
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.6),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SigninScreen(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'Sign In',
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
