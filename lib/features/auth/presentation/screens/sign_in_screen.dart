import 'package:flavory/core/utils/validators/auth_validator.dart';
import 'package:flavory/features/auth/presentation/cubit/auth_form_cubit/auth_form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _formKey = GlobalKey();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 217, 245, 215),
      appBar: AppBar(
        title: Text("Sign in"),
      ),
      body: BlocConsumer<AuthFormCubit, AuthFormState>(
        listener: (context, state) {
          if (state.status == .error) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(
              SnackBar(
                behavior: SnackBarBehavior.floating,
                backgroundColor: const Color(0xFF1E1E1E),
                elevation: 6,
                margin: const EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                content: Text(state.error ?? "Failed"),
              ),
            );
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 40,
                ),
                child: Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _emailController,
                            validator: (value) =>
                                AuthValidator.emailValidator(value),
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: "e-mail",
                              hintStyle: const TextStyle(
                                color: Color.fromARGB(255, 80, 142, 76),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            obscureText: state.obscure,
                            controller: _passwordController,
                            validator: (value) =>
                                AuthValidator.passwordValidator(value),
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  context.read<AuthFormCubit>().changeObscure();
                                },
                                icon: Icon(
                                  state.obscure
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              ),
                              fillColor: Colors.white,
                              filled: true,

                              hintText: "password",
                              hintStyle: const TextStyle(
                                color: Color.fromARGB(255, 80, 142, 76),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    if (state.status == .loading)
                      const CircularProgressIndicator.adaptive()
                    else
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<AuthFormCubit>().login(
                                _emailController.text,
                                _passwordController.text,
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.green,
                            side: BorderSide(color: Colors.green),
                          ),

                          child: Text(
                            "Sign in",
                            style: TextStyle(),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
