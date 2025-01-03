import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_assignment_lanars/bloc/login/login_bloc.dart';
import 'package:test_assignment_lanars/presentation/widgets/login_form.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
          alignment: Alignment.center,
          child: BlocProvider<LoginBloc>(
            create: (context) => LoginBloc(context),
            child: LoginForm(),
          ),
        ),
      ),
    );
  }
}
