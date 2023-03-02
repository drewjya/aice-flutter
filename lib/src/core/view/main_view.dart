import 'package:aice/src/src.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

extension ChangeVal<T> on ValueNotifier<T> {
  changeValue(T? val) {
    final temp = value;
    value = val ?? temp;
  }
}

class MainView extends HookConsumerWidget {
  static const routeName = "/main";
  const MainView({super.key});
  @override
  Widget build(BuildContext context, ref) {
    final currIndex = useState(0);
    ref.listen(authProvider, (previous, ProviderValue<AuthModel> next) {
      next.maybeWhen(
        orElse: () {},
        error: (error) {
          if (error.status == ApiFailure.unauthorized) {
            navigatorKey.currentState?.pushNamedAndRemoveUntil(
                LoginView.routeName, (route) => false);
          }
        },
      );
    });
    return Scaffold(
      body: ref.watch(authProvider).when(data: (data) {
        if (data.jenisAkun == "SPG") {
          return const FeedView();
        }
        return [
          const FeedView(),
          const HistoryView(),
        ][currIndex.value];
      }, error: (error) {
        return null;
      }, loading: () {
        return null;
      }),
      bottomNavigationBar: ref.watch(authProvider).when(
        data: (data) {
          if (data.jenisAkun == "SPG") {
            return null;
          }
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.format_list_bulleted_rounded),
                label: 'History',
              ),
            ],
            currentIndex: currIndex.value,
            onTap: (value) {
              currIndex.changeValue(value);
            },
            selectedItemColor: Colors.black,
          );
        },
        error: (e) {
          return null;
        },
        loading: () {
          return null;
        },
      ),
      floatingActionButton: ref.watch(authProvider).when(
        data: (data) {
          if (data.jenisAkun == "SPG") {
            return null;
          }
          return FloatingActionButton(
            onPressed: () {
              navigatorKey.currentState?.pushNamed(AddView.routeName);
              // dPrint(ref.read(authProvider).asData?.value.uuid);
            },
            backgroundColor: Colors.black,
            child: const Icon(Icons.add),
          );
        },
        error: (error) {
          return null;
        },
        loading: () {
          return null;
        },
      ),
    );
  }
}
