import 'dart:io';

import 'package:aice/src/feature/sales/view/form/detail_form.dart';
import 'package:aice/src/feature/sales/view/form/image_form.dart';
import 'package:aice/src/feature/sales/view/form/toko_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddView extends HookConsumerWidget {
  const AddView({Key? key}) : super(key: key);

  static const routeName = '/addSales';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentStep = useState(0);
    final namaTokoController = useTextEditingController();
    final kodeTokoController = useTextEditingController();
    final jumlahPOController = useTextEditingController();
    final jumlahItemTerdisplayController = useTextEditingController();
    final saranDanKendalaController = useTextEditingController();
    final productReturController = useTextEditingController();
    final pilihanToko = useState<String?>(null);
    final kualitasProduk = useState<String?>(null);
    final stickerFreezer = useState<String?>(null);
    final dividerSekat = useState<String?>(null);
    final labelHarga = useState<String?>(null);
    final woblerPromo = useState<String?>(null);
    final spanduk = useState<String?>(null);
    final atributBrandLainYangMengambilSpaceAice = useState<String?>(null);
    final stockBrandLainYangMengambilSpaceAice = useState<String?>(null);
    final stockDibawahFreezer = useState<String?>(null);
    final produkPromosi = useState<String?>(null);
    final kebersihanBungaEs = useState<String?>(null);
    final kepenuhanFreezerBagianAtas = useState<String?>(null);
    final debuFreezer = useState<String?>(null);
    final bekasLemFreezer = useState<String?>(null);
    final posisiFreezer = useState<String?>(null);
    final fotoSelfie = useState<File?>(null);
    final fotoKulkasJauh = useState<File?>(null);
    final fotoKulkasDekat = useState<File?>(null);
    final fotoFreezerOne = useState<File?>(null);
    final fotoFreezerDua = useState<File?>(null);
    final fotoFreezerTiga = useState<File?>(null);
    final freezerIsland1 = useState<File?>(null);
    final freezerIsland2 = useState<File?>(null);
    final freezerIsland3 = useState<File?>(null);
    final fotoFreezerBawah = useState<File?>(null);
    final fotoPo = useState<File?>(null);
    final fotoPop = useState<File?>(null);
    final fotoPeralatan = useState<File?>(null);
    final fotoKulkasTerbuka = useState<File?>(null);
    final tokoKey = useMemoized(
      () => GlobalKey<FormState>(),
    );
    final detailKey = useMemoized(
      () => GlobalKey<FormState>(),
    );
    final imageKey = useMemoized(
      () => GlobalKey<FormState>(),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Tambah Sales',
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
          } else if (currentStep.value == 2) {}
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
              child: TokoForm(
                  namaTokoController: namaTokoController,
                  kodeTokoController: kodeTokoController),
            ),
            isActive: currentStep.value >= 0,
            state:
                currentStep.value > 0 ? StepState.complete : StepState.editing,
          ),
          Step(
            title: const Icon(Icons.icecream),
            label: const Text("Detail"),
            content: Form(
              key: detailKey,
              child: DetailForm(
                  pilihanToko: pilihanToko,
                  kualitasProduk: kualitasProduk,
                  stickerFreezer: stickerFreezer,
                  dividerSekat: dividerSekat,
                  labelHarga: labelHarga,
                  woblerPromo: woblerPromo,
                  spanduk: spanduk,
                  atributBrandLainYangMengambilSpaceAice:
                      atributBrandLainYangMengambilSpaceAice,
                  stockBrandLainYangMengambilSpaceAice:
                      stockBrandLainYangMengambilSpaceAice,
                  stockDibawahFreezer: stockDibawahFreezer,
                  produkPromosi: produkPromosi,
                  kebersihanBungaEs: kebersihanBungaEs,
                  kepenuhanFreezerBagianAtas: kepenuhanFreezerBagianAtas,
                  debuFreezer: debuFreezer,
                  bekasLemFreezer: bekasLemFreezer,
                  posisiFreezer: posisiFreezer,
                  jumlahPOController: jumlahPOController,
                  jumlahItemTerdisplayController:
                      jumlahItemTerdisplayController,
                  saranDanKendalaController: saranDanKendalaController,
                  productReturController: productReturController),
            ),
            isActive: currentStep.value >= 1,
            state: currentStep.value == 1
                ? StepState.editing
                : currentStep.value > 1
                    ? StepState.complete
                    : StepState.disabled,
          ),
          Step(
            title: const Icon(Icons.camera_alt),
            label: const Text("Gambar"),
            content: Form(
              key: imageKey,
              child: ImageForm(
                tipe: pilihanToko.value ?? "",
                fotoSelfie: fotoSelfie,
                fotoKulkasJauh: fotoKulkasJauh,
                fotoKulkasDekat: fotoKulkasDekat,
                fotoFreezerOne: fotoFreezerOne,
                fotoFreezerDua: fotoFreezerDua,
                fotoFreezerTiga: fotoFreezerTiga,
                freezerIsland1: freezerIsland1,
                freezerIsland2: freezerIsland2,
                freezerIsland3: freezerIsland3,
                fotoFreezerBawah: fotoFreezerBawah,
                fotoPo: fotoPo,
                fotoPop: fotoPop,
                fotoPeralatan: fotoPeralatan,
                fotoKulkasTerbuka: fotoKulkasTerbuka,
              ),
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
      floatingActionButton: currentStep.value == 2
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
