import 'package:attendance_app/src/bloc/register/register_bloc.dart';
import 'package:attendance_app/src/const.dart';
import 'package:attendance_app/src/page/home_page.dart';
import 'package:attendance_app/src/page/login_page.dart';
import 'package:attendance_app/src/widget/button/main_submit_button.dart';
import 'package:attendance_app/src/widget/dialog/info_dialog.dart';
import 'package:attendance_app/src/widget/dialog/loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);
  static final route =
      ChildRoute('/register', child: (context, args) => const RegisterPage());

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: RegisterBloc.create,
      child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            body: BlocConsumer<RegisterBloc, RegisterState>(
              listener: (context, state) {
                if (state is LoadingRegisterState) {
                  LoadingDialog.showLoadingDialog(context);
                }
                if (state is ErrorRegisterState) {
                  Modular.to.pop();
                  InfoDialog.showInfoDialog(context, state.e.toString());
                }
                if (state is SuccessRegisterState) {
                  Modular.to.pop();
                  Modular.to.pushReplacementNamed(HomePage.route.name);
                }
              },
              builder: (context, state) {
                return SafeArea(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 35.0),
                    child: Column(
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: const Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Register'))),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.6,
                          child: Form(
                            key: formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: nameController,
                                  decoration: kMainInputDecoration.copyWith(
                                      labelText: 'Name'),
                                  validator: (value) {
                                    if (value != null) {
                                      if (value.isEmpty) {
                                        return 'Name required';
                                      }
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 10),
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
                                const SizedBox(height: 10),
                                TextFormField(
                                  controller: confirmPasswordController,
                                  obscureText: true,
                                  decoration: kMainInputDecoration.copyWith(
                                      labelText: 'Confirm Password'),
                                  validator: (value) {
                                    if (value != null) {
                                      if (value.isEmpty) {
                                        return 'Password required';
                                      } else if (value !=
                                          passwordController.text) {
                                        return 'Password mismatch';
                                      }
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: Column(
                            children: [
                              MainSubmitButton(
                                text: 'Register',
                                onPressed: () {
                                  if (formKey.currentState?.validate() ==
                                      true) {
                                    ReadContext(context)
                                        .read<RegisterBloc>()
                                        .add(SignUpEvent(
                                            nameController.text,
                                            emailController.text,
                                            passwordController.text));
                                  }
                                },
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text('Already have an account?'),
                                  TextButton(
                                    child: const Text('Login'),
                                    onPressed: () {
                                      Modular.to.pushReplacementNamed(
                                          LoginPage.route.name);
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )),
    );
  }
}
