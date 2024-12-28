import 'package:flutter/material.dart';
import 'package:test_assignment_lanars/utils/validation/validations/email_validation.dart';
import 'package:test_assignment_lanars/utils/validation/validations/password_validation.dart';
import 'package:test_assignment_lanars/utils/validation/validator.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? _emailErrorText;
  String? _passwordErrorText;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Sign in',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 72),
            _buildEmailField(),
            const SizedBox(height: 16),
            _buildPasswordField(),
            const SizedBox(height: 24),
            _buildSubmitButton(),
          ],
        ),
      ),
    );
  }

  TextFormField _buildEmailField() {
    return TextFormField(
      controller: emailController,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'Enter your email',
        helperText: ' ',
        errorText: _emailErrorText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      onChanged: (_) => _clearEmailError(),
    );
  }

  TextFormField _buildPasswordField() {
    return TextFormField(
      controller: passwordController,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter your password',
        helperText: ' ',
        errorText: _passwordErrorText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      obscureText: true,
      onChanged: (_) => _clearPasswordError(),
    );
  }

  SizedBox _buildSubmitButton() {
    return SizedBox(
      width: double.maxFinite,
      child: FilledButton(
        style: FilledButton.styleFrom(textStyle: TextStyle(fontSize: 14)),
        onPressed: onSubmit,
        child: Text('Log in'),
      ),
    );
  }

  void _clearEmailError() {
    setState(() {
      _emailErrorText = null;
    });
  }

  void _clearPasswordError() {
    setState(() {
      _passwordErrorText = null;
    });
  }

  void onSubmit() {
    String? emailErrorText =
        Validator.applyOne(context, EmailValidation())(emailController.text);
    String? passwordErrorText = Validator.applyOne(
        context, PasswordValidation())(passwordController.text);

    setState(() {
      _emailErrorText = emailErrorText;
      _passwordErrorText = passwordErrorText;
    });

    if (_emailErrorText == null && _passwordErrorText == null) {
      print('email ${emailController.text}');
      print('password ${passwordController.text}');
    } else {
      print('Form is not valid');
    }
  }
}
