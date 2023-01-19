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
              child: TokoForm.absensi(
                  namaTokoController: namaTokoController,
                  kodeTokoController: kodeTokoController),
            ),
            ElevatedButton(
                onPressed: () {
                  if (formKey.currentState?.validate() ?? false) {
                    final checkInModel = CheckInModel(
                        namaToko: namaTokoController.text,
                        kodeToko: kodeTokoController.text);
                    ref
                        .read(absentRepositoryProvider)
                        .checkIn(checkInModel: checkInModel)
                        .then((value) {
                      if (value != null) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(value)));
                      }
                      Navigator.pop(context);
                    });
                  }
                },
                child: const Center(child: Text("Check In"))),
          ],
        ),
      ),
    );
  }
}
