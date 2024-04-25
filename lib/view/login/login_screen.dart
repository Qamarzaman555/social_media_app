import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../res/color.dart';
import '../../res/components/round_btn.dart';
import '../../res/components/text_field.dart';
import '../../utils/routes/route_name.dart';
import '../../view_model/Controllers/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  TextEditingController passwordController = TextEditingController();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Welcome to Socal Media App',
                      style: Theme.of(context).textTheme.headlineSmall),
                  const Image(
                    image: AssetImage('assets/images/logo.jpg'),
                    height: 60,
                    width: 140,
                  ),
                  const SizedBox(height: 20),
                  UKTextField(
                      controller: emailController,
                      focusNode: emailFocusNode,
                      onFieldSubmitValue: (i) {},
                      formFieldValidator: (i) {
                        return i;
                      },
                      keyboardType: TextInputType.emailAddress,
                      hint: 'Enter Email',
                      obscureText: false,
                      validator: (value) {
                        return value.isEmpty ? 'Enter Your Email' : null;
                      }),
                  const SizedBox(height: 20),
                  UKTextField(
                      controller: passwordController,
                      focusNode: passwordFocusNode,
                      onFieldSubmitValue: (i) {},
                      obscureText: true,
                      formFieldValidator: (i) {
                        return i;
                      },
                      keyboardType: TextInputType.emailAddress,
                      hint: 'Enter Password',
                      validator: (value) {
                        return value.isEmpty ? 'Enter Your Password' : null;
                      }),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      child: Text(
                        "Forgot Password? ",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, RouteName.forgotScreen);
                      },
                    ),
                  ),
                  ChangeNotifierProvider(
                    create: (_) => LoginController(),
                    child: Consumer<LoginController>(
                        builder: (context, provider, child) {
                      return RoundButton(
                        title: 'Login',
                        loading: provider.loading,
                        onPressed: () {
                          debugPrint('Logged In');
                          if (formKey.currentState!.validate()) {
                            provider.login(context, emailController.text,
                                passwordController.text);
                            // Navigator.pushNamed(
                            //     context, RouteName.dashboardScreen);
                          }
                        },
                      );
                    }),
                  ),
                  const SizedBox(height: 20),
                  RoundButton(
                      title: 'Dont have an account? Sign Up',
                      color: AppColors.dialogAlertBackgroundColor,
                      onPressed: () =>
                          Navigator.pushNamed(context, RouteName.signupScreen))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
