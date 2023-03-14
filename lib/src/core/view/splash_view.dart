import 'package:aice/src/src.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SplashView extends HookConsumerWidget {
  static const routeName = "/splash";
  const SplashView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.listen(versionProvider).maybeWhen(orElse: () {});
    final isNotTrue = useState(false);
    final errorMessage = useState("");
    ref.listen(versionProvider, (previous, AsyncValue<VersionModel> next) {
      next.maybeWhen(
        orElse: () {},
        data: (data) {
          if (data.version == ApiUrl.version || data.beta) {
            navigatorKey.currentState?.pushNamedAndRemoveUntil(
                LoginView.routeName, (route) => false);
          } else {
            isNotTrue.value = true;
          }
        },
        error: (error, stackTrace) {
          if (error is ErrorValue) {
            errorMessage.value = (error).message;
          } else {
            errorMessage.value = "Harap Hubungi Tim It \n$error, $stackTrace";
          }
        },
      );
    });
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              "assets/launch_image.png",
              width: 150,
            ),
          ),
          if (isNotTrue.value)
            Dialog(
              child: SizedBox(
                height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Mohon Update Aplikasi Anda Ke Versi Yang Terbaru",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          launchUrlString(
                            "https://play.google.com/store/apps/details?id=com.edwardtanoto.aice",
                            mode: LaunchMode.externalNonBrowserApplication,
                          );
                        },
                        child: const Text("Update"))
                  ],
                ),
              ),
            ),
          if (errorMessage.value.isNotEmpty)
            Dialog(
              child: SizedBox(
                height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      errorMessage.value,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 30),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        ref.read(versionProvider.notifier).build();
                      },
                      child: const Text("Reload"),
                    ),
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}
