import 'package:flutter/material.dart';
import 'package:todo_app/core/constants/app_colors.dart';
import 'package:todo_app/presentation/onboarding/widgets/age_picker.dart';
import 'package:todo_app/presentation/onboarding/widgets/gender_section.dart';
import 'package:todo_app/presentation/onboarding/widgets/login_button.dart';
import 'package:todo_app/presentation/onboarding/widgets/login_fields.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [_buildTopSection(size), _buildBottomForm(size)],
        ),
      ),
    );
  }

  Widget _buildTopSection(Size size) {
    final bool isTallScreen = size.height > 640;
    final double topOffset = size.height * 0.125;
    final double bottomOffset = size.height * 0.25;
    final double imageSize = isTallScreen ? 140 : 120;

    return Positioned(
      top: 0,
      child: Container(
        height: size.height * 0.5,
        width: size.width,
        color: const Color.fromARGB(255, 91, 187, 144),
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Positioned(
              top: topOffset,
              left: size.width * 0.125,
              height: 50,
              child: Image.asset('images/branding_white.png'),
            ),
            Positioned(
              bottom: bottomOffset,
              right: size.width * 0.05,
              height: imageSize,
              width: imageSize,
              child: Image.asset('images/welcome_woman.png'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomForm(Size size) {
    return Positioned(
      bottom: 0,
      child: Container(
        height: size.height * 0.75,
        width: size.width,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(36)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 26),
                  LoginTitle(size: size),
                  const SizedBox(height: 24),
                  FirstnameField(controllerFirstName: firstNameController),
                  const SizedBox(height: 16),
                  LastnameField(controllerLastName: lastNameController),
                  const SizedBox(height: 16),
                  EmailField(controllerUserEmail: emailController),
                  const SizedBox(height: 12),
                  const GenderTitle(),
                  const SizedBox(height: 4),
                  const GenderContainers(),
                  const SizedBox(height: 8),
                  const AgeTitle(),
                  const AgePicker(),
                  const SizedBox(height: 4),
                  LoginButton(
                    controllerFirstName: firstNameController,
                    controllerLastName: lastNameController,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
