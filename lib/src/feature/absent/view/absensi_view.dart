import 'package:aice/src/feature/absent/view/check_in_view.dart';
import 'package:aice/src/feature/absent/view/check_out_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AbsensiView extends ConsumerWidget {
  const AbsensiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Absensi',
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              const Text("data"),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, CheckInView.routeName);
                },
                child: const Text("Check In"),
              ),
            ],
          ),
          Row(
            children: [
              const Text("data"),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, CheckOutView.routeName);
                },
                child: const Text("Check Out"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
