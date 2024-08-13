import 'package:flutter/material.dart';
import 'package:okapi_z/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AuthForm extends StatefulWidget {
  final bool isSignupScreen;
  final TextEditingController emailController;
  final TextEditingController nameController;
  final TextEditingController countryController;
  final TextEditingController passwordController;
  final TextEditingController schoolNameController;

  const AuthForm({
    super.key,
    required this.isSignupScreen,
    required this.emailController,
    required this.nameController,
    required this.countryController,
    required this.passwordController,
    required this.schoolNameController,
  });

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  String gender = 'Male';
  String ageRange = '~20';
  XFile? userImage;

  final List<String> ageRanges = [
    '~20',
    '21~22',
    '23~24',
    '25~26',
    '27~28',
    '29~30',
    '30~'
  ];

  void pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      userImage = pickedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.isSignupScreen) ...[
            CustomTextField(
              controller: widget.nameController,
              icon: Icons.account_circle,
              hintText: 'User name',
            ),
            const SizedBox(height: 8),
            CustomTextField(
              controller: widget.emailController,
              icon: Icons.email,
              hintText: 'Email',
            ),
            const SizedBox(height: 8),
            CustomTextField(
              controller: widget.passwordController,
              icon: Icons.lock,
              hintText: 'Password',
              obscureText: true,
            ),
            const SizedBox(height: 8),
            CustomTextField(
              controller: widget.schoolNameController,
              icon: Icons.school,
              hintText: 'School name',
            ),
            const SizedBox(height: 8),
            CustomTextField(
              controller: widget.countryController,
              icon: Icons.public,
              hintText: 'Country of origin',
            ),
            const SizedBox(height: 8),
            const Text('Gender:'),
            Row(
              children: [
                const SizedBox(width: 10),
                Radio<String>(
                  value: 'Male',
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value!;
                    });
                  },
                ),
                const Text('Male'),
                const SizedBox(width: 20),
                Radio<String>(
                  value: 'Female',
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value!;
                    });
                  },
                ),
                const Text('Female'),
              ],
            ),
            const SizedBox(height: 8),
            const Text('Age range:'),
            Row(
              children: [
                const SizedBox(width: 10),
                DropdownButton<String>(
                  value: ageRange,
                  items: ageRanges.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      ageRange = newValue!;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text('Profile Image:'),
            Row(
              children: [
                const SizedBox(width: 10),
                userImage == null
                    ? const Text('No image selected.')
                    : Image.file(
                        File(userImage!.path),
                        height: 50,
                        width: 50,
                      ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: pickImage,
                  child: const Text('Select Image'),
                ),
              ],
            ),
          ] else ...[
            CustomTextField(
              controller: widget.emailController,
              icon: Icons.email,
              hintText: 'Email',
            ),
            const SizedBox(height: 8),
            CustomTextField(
              controller: widget.passwordController,
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
