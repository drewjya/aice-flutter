import 'package:aice/src/src.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPrefs.init();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: navigatorKey,
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
            case AbsensiDetailView.routeName:
              return GenRoute.routeDef(page: const AbsensiDetailView());
            case LoginView.routeName:
              return GenRoute.routeDef(page: const LoginView());
            case RegisterView.routeName:
              return GenRoute.routeDef(page: const RegisterView());
            case MainView.routeName:
              return GenRoute.routeDef(page: const MainView());
            case AddView.routeName:
              return GenRoute.routeDef(page: const AddView());
            case AddTokoFormView.routeName:
              return GenRoute.routeDef(page: const AddTokoFormView());
            case SalesDetailView.routeName:
              return GenRoute.routeDef(page: const SalesDetailView());
            case CheckInView.routeName:
              return GenRoute.routeDef(page: const CheckInView());
            case CheckOutView.routeName:
              return GenRoute.routeDef(page: const CheckOutView());
            default:
              return GenRoute.routeDef(page: const Scaffold());
          }
        },
        home: const LoginView());
  }
}
