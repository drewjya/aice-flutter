import 'package:aice/src/src.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginView extends HookConsumerWidget {
  const LoginView({Key? key}) : super(key: key);

  static const routeName = '/loginView';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    ref.listen(authStateChangesProvider, (previous, AsyncValue<User?> next) {
      next.when(
        data: (data) {
          if (data != null) {
            Navigator.pushReplacementNamed(context, MainView.routeName);
          }
        },
        error: (error, stackTrace) {},
        loading: () {},
      );
    });
    ref.listen(authProvider, (previous, AsyncValue next) {
      next.when(
        data: (data) {
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, MainView.routeName);
        },
        error: (error, stackTrace) {
          Navigator.pop(context);
          if (error != "") {
            dPrint(error.runtimeType);
            if (error is FirebaseAuthException) {
              showToast(context, (error).message ?? "");
            }
          }
        },
        loading: () {
          showDialog(
            context: context,
            builder: (context) =>
                const Center(child: CircularProgressIndicator()),
          );
        },
      );
    });

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          child: SizedBox(
            width: 100.width(context),
            height: 100.height(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/aice.png",
                  width: 150,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(height: (100 / 35).height(context)),
                SizedBox(
                  width: (100 / 1.3).width(context),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.black),
                    controller: emailController,
                    decoration: const InputDecoration(
                      hintText: "something@email.com",
                      hintStyle: TextStyle(
                        color: Colors.black38,
                      ),
                      labelText: "Email",
                      prefixIcon: Icon(Icons.mail),
                      labelStyle: TextStyle(
                        color: Colors.black38,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: (100 / 35).height(context)),
                SizedBox(
                  width: (100 / 1.3).width(context),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.black),
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: "password",
                      hintStyle: TextStyle(
                        color: Colors.black38,
                      ),
                      labelText: "Password",
                      prefixIcon: Icon(Icons.key),
                      labelStyle: TextStyle(
                        color: Colors.black38,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: (100 / 35).height(context)),
                Container(
                  width: (100 / 2).width(context),
                  height: 37,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.0),
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 62, 182, 226),
                        Color.fromARGB(255, 148, 231, 225),
                      ],
                    ),
                  ),
                  child: ElevatedButton(
                    onPressed: () async {
                      ref.read(authProvider.notifier).signIn(
                          email: emailController.text,
                          password: passwordController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                    ),
                    child: const Text("Login"),
                  ),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      RegisterView.routeName,
                      (route) => false,
                    );
                  },
                  child: const Text(
                    "Belum punya akun? Register",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
