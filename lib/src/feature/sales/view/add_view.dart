import 'dart:io';

import 'package:aice/src/src.dart';
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
    final pilihanToko = useState<PilihanToko?>(null);
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
    final kategoriFreezer = useState<String?>(null);
    final papanHarga = useState<String?>(null);
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
    final isLoading = useState(false);
    ref.listen(salesFormProvider, (previous, ProviderValue next) {
      next.maybeWhen(
        orElse: () {},
        data: (data) {
          ref.read(salesHistoryTodayProvider.notifier).load();
          navigatorKey.currentState?.pop();
        },
        error: (error) {
          isLoading.value = false;
          showToast(context, error.message);
          if (error.status == ApiFailure.unauthorized) {
            ref.invalidate(authProvider);
            navigatorKey.currentState?.pushNamedAndRemoveUntil(
                LoginView.routeName, (route) => false);
          }
        },
      );
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Tambah Sales',
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Stack(
        children: [
          Stepper(
            type: StepperType.horizontal,
            physics: const ScrollPhysics(),
            currentStep: currentStep.value,
            elevation: 1,
            onStepTapped: (value) {
              currentStep.value = value;
            },
            onStepContinue: () {
              if (currentStep.value == 0) {
                if (tokoKey.currentState?.validate() ?? false) {
                  currentStep.value += 1;
                }
              } else if (currentStep.value == 1) {
                if (detailKey.currentState?.validate() ?? false) {
                  currentStep.value += 1;
                }
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
                state: currentStep.value > 0
                    ? StepState.complete
                    : StepState.editing,
              ),
              Step(
                title: const Icon(Icons.icecream),
                label: const Text("Detail"),
                content: Form(
                  key: detailKey,
                  child: DetailForm(
                    papanHarga: papanHarga,
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
                    productReturController: productReturController,
                    kategoriFreezer: kategoriFreezer,
                  ),
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
                    tipe: pilihanToko.value ?? PilihanToko.alfamart,
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
          isLoading.value
              ? Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.grey.shade100.withOpacity(0.1),
                  child: Center(
                    child: Dialog(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.6,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Column(
                          children: const [
                            Spacer(),
                            Text(
                              "Harap Tunggu!",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CircularProgressIndicator(),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Mohon Jangan Mengumpulkan\nBerulang-ulang!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : const SizedBox.shrink()
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
                  dPrint(
                      int.tryParse(jumlahPOController.text.getNumbers()) ?? 0);
                  dPrint(int.tryParse(
                          jumlahItemTerdisplayController.text.getNumbers()) ??
                      0);
                  if ((imageKey.currentState?.validate() ?? false)) {
                    final salesDto = SalesDto(
                        pilihanTokoId: pilihanToko.value?.value ?? 1,
                        namaToko: namaTokoController.text,
                        kodeToko: kodeTokoController.text,
                        kualitasProduk: kualitasProduk.value ?? "",
                        stickerFreezer: stickerFreezer.value ?? "",
                        papanHarga: papanHarga.value ?? "",
                        dividerKulkas: dividerSekat.value ?? '',
                        labelHarga: labelHarga.value ?? "",
                        woblerPromo: woblerPromo.value ?? "",
                        spanduk: spanduk.value ?? "",
                        brandLain:
                            atributBrandLainYangMengambilSpaceAice.value ?? "",
                        stockBrandLain:
                            stockBrandLainYangMengambilSpaceAice.value ?? "",
                        stockDibawahFreezer: stockDibawahFreezer.value ?? "",
                        produkPromosi: produkPromosi.value ?? "",
                        kebersihanBungaEs: kebersihanBungaEs.value ?? "",
                        kepenuhanFreezerAtas:
                            kepenuhanFreezerBagianAtas.value ?? "",
                        kebersihanLemFreezer: bekasLemFreezer.value ?? "",
                        kebersihanDebuFreezer: debuFreezer.value ?? "",
                        posisiFreezer: posisiFreezer.value ?? "",
                        jumlahPO: int.tryParse(
                                jumlahPOController.text.getNumbers()) ??
                            0,
                        jumlahItemTerdisplay: int.tryParse(
                                jumlahItemTerdisplayController.text
                                    .getNumbers()) ??
                            0,
                        saranDanKendala: saranDanKendalaController.text,
                        produkRetur: productReturController.text,
                        kategoriFreezer: kategoriFreezer.value ?? "",
                        namaDistributor:
                            ref.read(authProvider).asData?.value.name ?? "");
                    List<FotoDto> fotoDto = [];
                    if (fotoSelfie.value != null) {
                      fotoDto.add(FotoDto(
                          keteranganFoto: "fotoSelfie",
                          foto: fotoSelfie.value!));
                    }
                    if (fotoKulkasJauh.value != null) {
                      fotoDto.add(FotoDto(
                          keteranganFoto: "fotoKulkasDariJauh",
                          foto: fotoKulkasJauh.value!));
                    }
                    if (fotoKulkasDekat.value != null) {
                      fotoDto.add(FotoDto(
                          keteranganFoto: "fotoKulkasTertutup",
                          foto: fotoKulkasDekat.value!));
                    }
                    if (fotoKulkasTerbuka.value != null) {
                      fotoDto.add(FotoDto(
                          keteranganFoto: "fotoKulkasTerbuka",
                          foto: fotoKulkasTerbuka.value!));
                    }
                    if (fotoFreezerOne.value != null) {
                      fotoDto.add(FotoDto(
                          keteranganFoto: "fotoFreezerOne",
                          foto: fotoFreezerOne.value!));
                    }
                    if (fotoFreezerDua.value != null) {
                      fotoDto.add(FotoDto(
                          keteranganFoto: "fotoFreezerTwo",
                          foto: fotoFreezerDua.value!));
                    }
                    if (fotoFreezerTiga.value != null) {
                      fotoDto.add(FotoDto(
                          keteranganFoto: "fotoFreezerThree",
                          foto: fotoFreezerTiga.value!));
                    }
                    if (freezerIsland1.value != null) {
                      fotoDto.add(FotoDto(
                          keteranganFoto: "fotoFreezerIsland1",
                          foto: freezerIsland1.value!));
                    }
                    if (freezerIsland2.value != null) {
                      fotoDto.add(FotoDto(
                          keteranganFoto: "fotoFreezerIsland2",
                          foto: freezerIsland2.value!));
                    }
                    if (freezerIsland3.value != null) {
                      fotoDto.add(FotoDto(
                          keteranganFoto: "fotoFreezerIsland3",
                          foto: freezerIsland3.value!));
                    }
                    if (fotoFreezerBawah.value != null) {
                      fotoDto.add(FotoDto(
                          keteranganFoto: "fotoFreezerBawah",
                          foto: fotoFreezerBawah.value!));
                    }
                    if (fotoPo.value != null) {
                      fotoDto.add(FotoDto(
                          keteranganFoto: "fotoPo", foto: fotoPo.value!));
                    }
                    if (fotoPop.value != null) {
                      fotoDto.add(FotoDto(
                          keteranganFoto: "fotoPop", foto: fotoPop.value!));
                    }
                    if (fotoPeralatan.value != null) {
                      fotoDto.add(FotoDto(
                          keteranganFoto: "fotoPeralatan",
                          foto: fotoPeralatan.value!));
                    }
                    ref
                        .read(salesFormProvider.notifier)
                        .postSales(sales: salesDto, fotoDto: fotoDto);
                    isLoading.value = true;
                  }
                },
              ),
            )
          : null,
    );
  }
}
