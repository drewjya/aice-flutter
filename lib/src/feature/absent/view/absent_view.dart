import 'package:aice/src/src.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


class AbsensiFormView extends HookConsumerWidget {
  const AbsensiFormView({Key? key}) : super(key: key);

  static const routeName = '/absent';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentStep = useState(0);
    final namaTokoController = useTextEditingController();
    final kodeTokoController = useTextEditingController();

    final tokoKey = useMemoized(
      () => GlobalKey<FormState>(),
    );

    final imageKey = useMemoized(
      () => GlobalKey<FormState>(),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Absensi SPG',
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Stepper(
        type: StepperType.horizontal,
        physics: const ScrollPhysics(),
        currentStep: currentStep.value,
        elevation: 1,
        onStepTapped: (value) {
          currentStep.value = value;
        },
        onStepContinue: () {
          if (currentStep.value == 0) {
            // if (tokoKey.currentState?.validate() ?? false) {
            currentStep.value += 1;
            // }
          } else if (currentStep.value == 1) {
            // if (detailKey.currentState?.validate() ?? false) {
            currentStep.value += 1;
            // }
          }
        },
        controlsBuilder: currentStep.value == 2
            ? (context, details) {
                return TextButton(
                    onPressed: () {
                      details.onStepCancel!();
                    },
                    child: const Text("Batal"));
              }
            : null,
        onStepCancel: () {
          if (currentStep.value == 2) {
            currentStep.value -= 1;
          } else if (currentStep.value == 1) {
            currentStep.value -= 1;
          }
        },
        steps: <Step>[
          Step(
            title: const Icon(Icons.store),
            label: const Text("Toko"),
            content: Form(
              key: tokoKey,
              child: TokoForm.absensi(
                  namaTokoController: namaTokoController,
                  kodeTokoController: kodeTokoController),
            ),
            isActive: currentStep.value >= 0,
            state:
                currentStep.value > 0 ? StepState.complete : StepState.editing,
          ),
          Step(
            title: const Icon(Icons.camera_alt),
            label: const Text("Gambar"),
            content: Form(
              key: imageKey,
              child: const Text("data"),
            ),
            isActive: currentStep.value == 2,
            state: currentStep.value == 2
                ? StepState.editing
                : currentStep.value > 2
                    ? StepState.complete
                    : StepState.disabled,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: currentStep.value == 1
          ? Padding(
              padding: const EdgeInsets.only(bottom: 22.0),
              child: FloatingActionButton(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                child: const Icon(Icons.done),
                onPressed: () {
                  if (imageKey.currentState?.validate() ?? false) {}
                },
              ),
            )
          : null,
    );
  }
}
