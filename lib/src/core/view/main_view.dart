import 'package:aice/src/feature/feature.dart';
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
    return Scaffold(
      extendBody: true,
      body: [const FeedView(), const HistoryView()][currIndex.value],
      bottomNavigationBar: BottomNavigationBar(
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddView.routeName);
        },
        backgroundColor: Colors.black,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
