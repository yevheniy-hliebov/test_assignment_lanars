import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Sign in',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 72),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
                helperText: ' ',
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
                helperText: ' ',
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
              obscureText: true,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.maxFinite,
              child: FilledButton(
                style: FilledButton.styleFrom(
                    textStyle: TextStyle(
                  fontSize: 14,
                )),
                onPressed: () {
                  print('email ${emailController.text}');
                  print('password ${passwordController.text}');
                },
                child: Text('Log in'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
