import 'package:aice/src/src.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(
    const ProviderScope(
      child: MyApp(),
      // child: DevicePreview(
      //   enabled: !kReleaseMode,
      //   builder: (context) => const MyApp(), // Wrap your app
      // ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // useInheritedMediaQuery: true,
        // locale: DevicePreview.locale(context),
        // builder: DevicePreview.appBuilder,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('id', 'ID'), // English, no country code
        ],
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Poppins'),
        title: 'AICE App',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case LoginView.routeName:
              return GenRoute.routeDef(page: const LoginView());
            case RegisterView.routeName:
              return GenRoute.routeDef(page: const RegisterView());
            case MainView.routeName:
              return GenRoute.routeDef(page: const MainView());
            case AddView.routeName:
              return GenRoute.routeDef(page: const AddView());
            case SalesDetailView.routeName:
              return GenRoute.routeDef(page: const SalesDetailView());
            default:
              return GenRoute.routeDef(page: const Scaffold());
          }
        },
        home: const LoginView());
  }
}
