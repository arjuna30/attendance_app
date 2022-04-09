import 'package:attendance_app/src/bloc/login/login_bloc.dart';
import 'package:attendance_app/src/const.dart';
import 'package:attendance_app/src/page/home_page.dart';
import 'package:attendance_app/src/page/register_page.dart';
import 'package:attendance_app/src/widget/button/main_submit_button.dart';
import 'package:attendance_app/src/widget/dialog/info_dialog.dart';
import 'package:attendance_app/src/widget/dialog/loading_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static final route =
      ChildRoute('/login', child: (context, args) => const LoginPage());

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: LoginBloc.create,
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          body: BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoadingLoginState) {
                LoadingDialog.showLoadingDialog(context);
              }
              if (state is SuccessLoginState) {
                Modular.to.pop();
                Modular.to.pushReplacementNamed(HomePage.route.name);
              }
              if (state is ErrorLoginState) {
                Modular.to.pop();
                InfoDialog.showInfoDialog(context, state.e.toString());
              }
            },
            builder: (context, state) {
              return SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: Column(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: const Center(child: Text('Login'))),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: kMainInputDecoration.copyWith(
                                    labelText: 'Email'),
                                validator: (value) {
                                  if (value != null) {
                                    if (value.isEmpty) {
                                      return 'Email required';
                                    } else if (!kEmailValidation
                                        .hasMatch(value)) {
                                      return 'Must be email format';
                                    }
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                controller: passwordController,
                                obscureText: true,
                                decoration: kMainInputDecoration.copyWith(
                                    labelText: 'Password'),
                                validator: (value) {
                                  if (value != null) {
                                    if (value.isEmpty) {
                                      return 'Password required';
                                    }
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 50),
                              MainSubmitButton(
                                text: 'Login',
                                onPressed: () {
                                  if (formKey.currentState?.validate() ==
                                      true) {
                                    ReadContext(context).read<LoginBloc>().add(
                                        LoggingInEvent(emailController.text,
                                            passwordController.text));
                                  }
                                },
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text('Don\'t have an account?'),
                                  TextButton(
                                    child: const Text('Register'),
                                    onPressed: () {
                                      Modular.to.pushReplacementNamed(
                                          RegisterPage.route.name);
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
