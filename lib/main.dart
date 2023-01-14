import 'package:aice/src/feature/absent/view/absent_view.dart';
import 'package:aice/src/feature/absent/view/check_in_view.dart';
import 'package:aice/src/feature/absent/view/check_out_view.dart';
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
            case AbsensiFormView.routeName:
              return GenRoute.routeDef(page: const AbsensiFormView());
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
