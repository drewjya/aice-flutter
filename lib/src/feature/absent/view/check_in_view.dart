import 'package:aice/src/feature/feature.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CheckInView extends HookConsumerWidget {
  static const routeName = "checkInView";
  const CheckInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final namaTokoController = useTextEditingController();
    final kodeTokoController = useTextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Check In',
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TokoForm.absensi(
                namaTokoController: namaTokoController,
                kodeTokoController: kodeTokoController),
            ElevatedButton(
                onPressed: () {}, child: const Center(child: Text("Check In"))),
          ],
        ),
      ),
    );
  }
}
