import 'package:aice/src/feature/absent/providers/list_produk_provider.dart';
import 'package:aice/src/src.dart';
import 'package:flutter/foundation.dart';
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
    final isObscure = useState(true);
    useEffect(() {
      if (kDebugMode) {
        //Admin SPG 1
        emailController.text = 'aice@adminspg.com';
        passwordController.text = 'Admin123';
        //Admin SPG 2
        emailController.text = 'aice@adminspg2.com';
        passwordController.text = 'Admin123';
        //Admin MD 2
        // emailController.text = 'aice@adminmd.com';
        // passwordController.text = 'Admin123';
      }

      return null;
    }, [""]);
    final isLoading = useState(false);

    ref.listen(authProvider, (previous, ProviderValue<AuthModel> next) {
      next.when(
        data: (data) {
          if (SharedPrefs.getIsFirstTime()) {
            if (data.jenisAkun == "SPG") {
              ref.read(listProdukProvider.notifier).loadData();
            }
            Navigator.pushNamedAndRemoveUntil(
              context,
              MainView.routeName,
              (route) => false,
            );
            return;
          }
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text.rich(
                  TextSpan(text: "Password Anda Saat ini adalah\n", children: [
                    TextSpan(
                        text: passwordController.text,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    const TextSpan(text: "\nMohon Ingat Baik-Baik!")
                  ]),
                  textAlign: TextAlign.center,
                ),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        SharedPrefs.setIsFirstTime();
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          MainView.routeName,
                          (route) => false,
                        );
                      },
                      child: const Center(child: Text("Oke")))
                ],
              );
            },
          );
          isLoading.value = false;
        },
        error: (error) {
          isLoading.value = false;
          if (error.message.isNotEmpty) {
            showToast(context, error.message);
          }
        },
        loading: () {
          isLoading.value = true;
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
                    obscureText: isObscure.value,
                    decoration: InputDecoration(
                        hintText: "password",
                        hintStyle: const TextStyle(
                          color: Colors.black38,
                        ),
                        labelText: "Password",
                        prefixIcon: const Icon(Icons.key),
                        labelStyle: const TextStyle(
                          color: Colors.black38,
                        ),
                        suffixIcon: IconButton(
                            onPressed: () {
                              isObscure.value = !isObscure.value;
                            },
                            icon: const Icon(Icons.remove_red_eye))),
                  ),
                ),
                SizedBox(height: (100 / 35).height(context)),
                Container(
                  width: (100 / 2).width(context),
                  height: 37,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.0),
                    gradient: isLoading.value
                        ? null
                        : const LinearGradient(
                            colors: [
                              Color.fromARGB(255, 62, 182, 226),
                              Color.fromARGB(255, 148, 231, 225),
                            ],
                          ),
                  ),
                  child: ElevatedButton(
                    onPressed: isLoading.value
                        ? null
                        : () async {
                            ref.read(authProvider.notifier).logIn(
                                email: emailController.text,
                                password: passwordController.text);
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                    ),
                    child: isLoading.value
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(),
                          )
                        : const Text("Login"),
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
