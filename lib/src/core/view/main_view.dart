import 'package:aice/src/core/common/fabs_with_icon.dart';
import 'package:aice/src/core/common/overlay_layout.dart';
import 'package:aice/src/feature/absent/view/absensi_view.dart';
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
      // extendBody: true,
      body: [
        const FeedView(),
        const AbsensiView(),
        Container(),
        const HistoryView()
      ][currIndex.value],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_sharp),
            label: 'Absensi SPG',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_rounded),
            label: 'Form MD',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_list_bulleted_rounded),
            label: 'History',
          ),
        ],
        currentIndex: currIndex.value,
        onTap: (value) {
          if (value == 2) {
            Navigator.pushNamed(context, AddView.routeName);
          } else {
            currIndex.changeValue(value);
          }
        },
        selectedItemColor: Colors.black,
      ),
    );
  }

  Widget _buildFab(BuildContext context) {
    final icons = [Icons.sms, Icons.mail];
    return AnchoredOverlay(
      showOverlay: true,
      overlayBuilder: (context, offset) {
        return CenterAbout(
          position: Offset(offset.dx, offset.dy),
          child: FabWithIcons(
            icons: icons,
            onIconTapped: (value) {},
          ),
        );
      },
      child: IconButton(
        onPressed: () {},
        tooltip: 'Increment',
        icon: const Icon(Icons.add),
      ),
    );
  }
  //  Navigator.pushNamed(context, AddView.routeName);
}
