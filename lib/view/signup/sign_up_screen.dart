import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../res/color.dart';
import '../../res/components/round_btn.dart';
import '../../res/components/text_field.dart';
import '../../utils/routes/route_name.dart';
import '../../utils/utils.dart';
import '../../view_model/Controllers/signup_controller.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  FocusNode userNameFocusNode = FocusNode();
  TextEditingController emailController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  TextEditingController passwordController = TextEditingController();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    userNameController.dispose();
    userNameFocusNode.dispose();
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0),
      body: ChangeNotifierProvider(
        create: (_) => SignUpController(),
        child: Consumer<SignUpController>(builder: (context, provider, child) {
          return SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                          controller: userNameController,
                          focusNode: userNameFocusNode,
                          onFieldSubmitValue: (i) {},
                          formFieldValidator: (i) {
                            return i;
                          },
                          keyboardType: TextInputType.name,
                          hint: 'Enter UserName',
                          obscureText: false,
                          validator: (value) {
                            return value.isEmpty ? 'Enter Your UserName' : null;
                          }),
                      const SizedBox(height: 20),
                      UKTextField(
                          controller: emailController,
                          focusNode: emailFocusNode,
                          onFieldSubmitValue: (i) {
                            Utils.fieldFocus(
                                context, emailFocusNode, passwordFocusNode);
                          },
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
                          keyboardType: TextInputType.text,
                          hint: 'Enter Password',
                          validator: (value) {
                            return value.isEmpty ? 'Enter Your Password' : null;
                          }),
                      const SizedBox(height: 20),
                      RoundButton(
                        title: 'Sign Up',
                        loading: provider.loading,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            provider.signUp(context, userNameController.text,
                                emailController.text, passwordController.text);
                          }
                          debugPrint('Signed up');
                        },
                      ),
                      const SizedBox(height: 20),
                      RoundButton(
                          title: 'Already have an account? Login',
                          color: AppColors.dialogAlertBackgroundColor,
                          onPressed: () => Navigator.pushNamed(
                              context, RouteName.loginScreen))
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
