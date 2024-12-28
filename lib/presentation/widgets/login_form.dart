import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_assignment_lanars/bloc/login/login_bloc.dart';
import 'package:test_assignment_lanars/bloc/login/login_event.dart';
import 'package:test_assignment_lanars/bloc/login/login_state.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? emailErrorText;
  String? passwordErrorText;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            if (kDebugMode) {
              print('Login success: ${state.email}');
              print('Password: ${state.password}');
            }
          }
        },
        builder: (context, state) {
          if (state is LoginErrorState) {
            emailErrorText = state.emailErrorText;
            passwordErrorText = state.passwordErrorText;
          }

          bool isLoading = state is LoginInProgressState;

          return Form(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Sign in',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 72),
                _buildEmailField(context, isLoading),
                const SizedBox(height: 16),
                _buildPasswordField(context, isLoading),
                const SizedBox(height: 24),
                _buildButtonSubmit(isLoading, context),
              ],
            ),
          );
        },
      ),
    );
  }

  TextFormField _buildEmailField(BuildContext context, bool isLoading) {
    return TextFormField(
      controller: emailController,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'Enter your email',
        helperText: ' ',
        errorText: emailErrorText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      onChanged: (_) => _clearEmailError(context),
      enabled: !isLoading,
      textInputAction: TextInputAction.next,
    );
  }

  void _clearEmailError(BuildContext context) {
    context.read<LoginBloc>().add(
          LoginChangeEmailEvent(
            email: emailController.text,
          ),
        );
  }

  TextFormField _buildPasswordField(BuildContext context, bool isLoading) {
    return TextFormField(
      controller: passwordController,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter your password',
        helperText: ' ',
        errorText: passwordErrorText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      obscureText: true,
      onChanged: (_) => _clearPasswordError(context),
      enabled: !isLoading,
      textInputAction: TextInputAction.done,
    );
  }

  void _clearPasswordError(BuildContext context) {
    context.read<LoginBloc>().add(
          LoginChangePasswordEvent(
            password: emailController.text,
          ),
        );
  }

  SizedBox _buildButtonSubmit(bool isLoading, BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: IgnorePointer(
        ignoring: isLoading,
        child: FilledButton(
          style: FilledButton.styleFrom(
            textStyle: TextStyle(fontSize: 14),
          ),
          onPressed: () => _onSubmit(context),
          child: isLoading ? _loader : Text('Log in'),
        ),
      ),
    );
  }

  void _onSubmit(BuildContext context) {
    FocusScope.of(context).unfocus();
    context.read<LoginBloc>().add(
          LoginSubmitEvent(
            email: emailController.text,
            password: passwordController.text,
          ),
        );
  }

  Widget get _loader {
    return SizedBox(
      width: 24,
      height: 24,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        color: Colors.white,
      ),
    );
  }
}
