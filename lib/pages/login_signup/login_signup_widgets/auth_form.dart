import 'package:flutter/material.dart';
import 'package:okapi_z/pages/widgets/custom_text_field.dart';

class AuthForm extends StatelessWidget {
  final bool isSignupScreen;
  final TextEditingController emailController;
  final TextEditingController nameController;
  final TextEditingController birthController;
  final TextEditingController passwordController;
  final TextEditingController schoolNameController;
  final TextEditingController schoolPlaceIdController;

  const AuthForm({
    super.key,
    required this.isSignupScreen,
    required this.emailController,
    required this.nameController,
    required this.birthController,
    required this.passwordController,
    required this.schoolNameController,
    required this.schoolPlaceIdController,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          if (isSignupScreen) ...[
            CustomTextField(
              controller: nameController,
              icon: Icons.account_circle,
              hintText: 'User name',
            ),
            const SizedBox(height: 8),
            CustomTextField(
              controller: emailController,
              icon: Icons.email,
              hintText: 'Email',
            ),
            const SizedBox(height: 8),
            CustomTextField(
              controller: birthController,
              icon: Icons.cake,
              hintText: 'Birth date',
            ),
            const SizedBox(height: 8),
            CustomTextField(
              controller: passwordController,
              icon: Icons.lock,
              hintText: 'Password',
              obscureText: true,
            ),
            const SizedBox(height: 8),
            CustomTextField(
              controller: schoolNameController,
              icon: Icons.school,
              hintText: 'School name',
            ),
            const SizedBox(height: 8),
            CustomTextField(
              controller: schoolPlaceIdController,
              icon: Icons.place,
              hintText: 'School place ID',
            ),
          ] else ...[
            CustomTextField(
              controller: emailController,
              icon: Icons.email,
              hintText: 'Email',
            ),
            const SizedBox(height: 8),
            CustomTextField(
              controller: passwordController,
              icon: Icons.lock,
              hintText: 'Password',
              obscureText: true,
            ),
          ],
        ],
      ),
    );
  }
}
