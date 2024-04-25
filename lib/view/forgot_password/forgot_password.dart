import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../res/components/round_btn.dart';
import '../../res/components/text_field.dart';
import '../../view_model/Controllers/forgot_pass_controller.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<ForgotPasswordScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    emailFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Forgot Password',
                      style: Theme.of(context).textTheme.headlineSmall),
                  Text(
                    'Enter Your Email To Recover Password',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
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
                  ChangeNotifierProvider(
                    create: (_) => ForgotPasswordController(),
                    child: Consumer<ForgotPasswordController>(
                        builder: (context, provider, child) {
                      return RoundButton(
                        title: 'Login',
                        loading: provider.loading,
                        onPressed: () {
                          debugPrint('Logged In');
                          if (formKey.currentState!.validate()) {
                            provider.forgotPassword(
                              context,
                              emailController.text,
                            );
                          }
                        },
                      );
                    }),
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
