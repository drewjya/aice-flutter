import 'package:aice/src/src.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RegisterView extends HookConsumerWidget {
  /// TODO add your comment here
  const RegisterView({Key? key}) : super(key: key);

  static const routeName = '/registerView';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final usernameController = useTextEditingController();
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
        child: Container(
          width: 100.width(context),
          height: 100.height(context),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/register.svg",
                width: 65,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: (100 / 1.3).width(context),
                child: TextFormField(
                  style: const TextStyle(color: Colors.black),
                  controller: usernameController,
                  decoration: const InputDecoration(
                    hintText: "Justin Bieber",
                    prefixIcon: Icon(Icons.person),
                    hintStyle: TextStyle(
                      color: Colors.black38,
                    ),
                    labelText: "Nama Lengkap",
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
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: "something@email.com",
                    prefixIcon: Icon(Icons.mail),
                    hintStyle: TextStyle(
                      color: Colors.black38,
                    ),
                    labelText: "Email",
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
                    prefixIcon: Icon(Icons.key),
                    hintStyle: TextStyle(
                      color: Colors.black38,
                    ),
                    labelText: "Password",
                    labelStyle: TextStyle(
                      color: Colors.black38,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
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
                    ref.read(authProvider.notifier).register(
                        email: emailController.text,
                        password: passwordController.text,
                        userName: usernameController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                  ),
                  child: const Text("Buat Akun"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    LoginView.routeName,
                    (route) => false,
                  );
                },
                child: const Text(
                  "Sudah punya akun? Login disini",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
