import 'dart:io';

import 'package:aice/src/src.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CheckInView extends HookConsumerWidget {
  static const routeName = "checkInView";
  const CheckInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    ref.listen(inputAbsensiProvider, (previous, ProviderValue next) {
      next.when(
        data: (data) {
          Navigator.pop(
            context,
          );
        },
        error: (error) {
          if (error.message.isNotEmpty) {
            showToast(context, error.message);
            if (error.status == ApiFailure.unauthorized) {
              Navigator.pushNamedAndRemoveUntil(
                  context, LoginView.routeName, (route) => false);
            }
          }
        },
        loading: () {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) =>
                const Center(child: CircularProgressIndicator()),
          );
        },
      );
    });
    final namaTokoController = useTextEditingController();
    final pilihanToko = useState<PilihanToko?>(null);
    final file = useState<File?>(null);
    final formKey = useMemoized(
      () => GlobalKey<FormState>(),
    );
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
            Form(
              key: formKey,
              child: Column(
                children: [
                  TokoForm.absensi(
                    pilihanToko: pilihanToko,
                    namaTokoController: namaTokoController,
                  ),
                  ImageSalesPicker(file: file, title: "Foto Selfie")
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (formKey.currentState?.validate() ?? false) {
                    final checkInModel = CheckInModel(
                        namaToko: namaTokoController.text,
                        pilihanTokoId: pilihanToko.value?.value ?? 1);
                    ref
                        .read(inputAbsensiProvider.notifier)
                        .checkIn(checkInModel, file.value!);

                    Navigator.pop(context);
                  }
                },
                child: const Center(child: Text("Check In"))),
          ],
        ),
      ),
    );
  }
}
