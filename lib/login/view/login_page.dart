import 'package:courtavenue/access_logs/access_logs.dart';
import 'package:courtavenue/l10n/l10n.dart';
import 'package:courtavenue/login/cubit/login_cubit.dart';
import 'package:courtavenue/login/widgets/widgets.dart';
import 'package:data_persistence/data_persistence.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(
        dataPersistence: context.read<DataPersistence>(),
      ),
      child: const LoginView(),
    );
  }
}

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              context.l10n.login,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 60),
              child: BlocConsumer<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state.isSuccess) {
                    Navigator.of(context).push<void>(
                      CupertinoPageRoute(
                        builder: (_) => AccessLogPage(state.accessLog),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return Column(
                    children: [
                      FormFields(
                        formKey: _formKey,
                        usernameController: _usernameController,
                        passwordController: _passwordController,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Builder(
                          builder: (context) {
                            if (state.isFailure) {
                              return Text(
                                'Error creating log: ${state.error}',
                                style: const TextStyle(fontSize: 18),
                              );
                            } else if (state.isLoading) {
                              return const CircularProgressIndicator();
                            }
                            return const SizedBox.shrink();
                          },
                        ),
                      ),
                      const Spacer(),
                      CustomButton(
                        text: context.l10n.login,
                        backgroundColor: const Color(0xFFdc143c),
                        onPressed: login,
                      ),
                      const SizedBox(height: 10),
                      CustomButton(
                        text: context.l10n.accessLogs,
                        backgroundColor: Colors.grey.shade700,
                        onPressed: () {
                          Navigator.of(context).push<void>(
                            CupertinoPageRoute(
                              builder: (_) => const AccessLogListPage(),
                            ),
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
            Align(
              child: Image.asset(
                'assets/images/logo.png',
              ),
            ),
          ],
        ),
      ),
    );
  }

  void login() {
    if (_formKey.currentState!.validate()) {
      context.read<LoginCubit>().login(_usernameController.text);
    }
  }
}
