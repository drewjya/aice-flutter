import 'dart:io';

import 'package:aice/src/src.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CheckOutView extends HookConsumerWidget {
  static const routeName = "checkOutView";
  const CheckOutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final currentStep = useState(0);
    final namaTokoController = useTextEditingController();
    final namaController = useTextEditingController();
    final kualitasProduk = useState<String?>(null);
    final produkRusak = useTextEditingController();
    final promosiDetail = useTextEditingController();
    final itemKosong = useTextEditingController();
    final periodePromo = useState("");
    final papanHargaFreezer = useState<String?>(null);
    final priceTagTg = useState<String?>(null);
    final priceTagIsland = useState<String?>(null);
    final statusPopPromo = useState<String?>(null);
    final kelengkapanItem = useTextEditingController();
    final kebersihanFreezer = useState<String?>(null);
    final pilihanToko = useState<PilihanToko?>(null);
    final fotoDisplayProdukFreezer1 = useState<File?>(null);
    final fotoDisplayProdukFreezer2 = useState<File?>(null);
    final fotoDisplayProdukFreezer3 = useState<File?>(null);
    final fotoDisplayProdukFreezerIsland1 = useState<File?>(null);
    final fotoPosisiFreezerDariJauh = useState<File?>(null);
    final fotoPopPromosi = useState<File?>(null);
    final isLoading = useState(false);
    final detailKey = useMemoized(
      () => GlobalKey<FormState>(),
    );
    final imageKey = useMemoized(
      () => GlobalKey<FormState>(),
    );

    useEffect(() {
      final absensi = ref.watch(absensiProvider).asData?.value;
      final auth = ref.watch(authProvider).asData?.value;
      namaTokoController.text = absensi?.namaToko ?? '';
      namaController.text = auth?.name ?? '';
      pilihanToko.value = PilihanToko.fromValue(absensi?.pilihanTokoId ?? 0);
      return null;
    }, [ref.watch(absensiProvider), ref.watch(authProvider)]);
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
        loading: () {},
      );
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Check Out',
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
                currentStep.value += 1;
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
            steps: [
              Step(
                title: const Icon(Icons.store),
                label: const Text('Toko'),
                content: TokoForm.absensi(
                  isEnabled: false,
                  checkOut: true,
                  pilihanToko: pilihanToko,
                  namaController: namaController,
                  namaTokoController: namaTokoController,
                ),
                isActive: currentStep.value >= 0,
                state: currentStep.value > 0
                    ? StepState.complete
                    : StepState.editing,
              ),
              Step(
                title: const Icon(Icons.icecream),
                label: const Text("Detail"),
                isActive: currentStep.value >= 1,
                state: currentStep.value == 1
                    ? StepState.editing
                    : currentStep.value > 1
                        ? StepState.complete
                        : StepState.disabled,
                content: Form(
                  key: detailKey,
                  child: CheckOutDetailForm(
                      itemKosong: itemKosong,
                      promosiDetail: promosiDetail,
                      kualitasProduk: kualitasProduk,
                      produkRusak: produkRusak,
                      papanHargaFreezer: papanHargaFreezer,
                      periodePromo: periodePromo,
                      priceTagTg: priceTagTg,
                      priceTagIsland: priceTagIsland,
                      statusPopPromo: statusPopPromo,
                      kelengkapanItem: kelengkapanItem,
                      kebersihanFreezer: kebersihanFreezer),
                ),
              ),
              Step(
                title: const Icon(Icons.camera_alt),
                label: const Text("Gambar"),
                isActive: currentStep.value == 2,
                state: currentStep.value == 2
                    ? StepState.editing
                    : currentStep.value > 2
                        ? StepState.complete
                        : StepState.disabled,
                content: Form(
                  key: imageKey,
                  child: ImageCheckOutForm(
                      fotoDisplayProdukFreezer1: fotoDisplayProdukFreezer1,
                      fotoDisplayProdukFreezer2: fotoDisplayProdukFreezer2,
                      fotoDisplayProdukFreezer3: fotoDisplayProdukFreezer3,
                      fotoDisplayProdukFreezerIsland1:
                          fotoDisplayProdukFreezerIsland1,
                      fotoPosisiFreezerDariJauh: fotoPosisiFreezerDariJauh,
                      fotoPopPromosi: fotoPopPromosi),
                ),
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
                  if (imageKey.currentState?.validate() ?? false) {
                    isLoading.value = true;
                    final id = ref.watch(absensiProvider).asData?.value.id ?? 0;
                    final checkOut = CheckOutModel(
                        kualitasProduk: kualitasProduk.value ?? "",
                        produkRusak: produkRusak.text,
                        papanHargaFreezer: papanHargaFreezer.value ?? "",
                        priceTagTg: priceTagTg.value ?? "",
                        periodePromo: periodePromo.value,
                        priceTagIsland: priceTagIsland.value ?? "",
                        statusPopPromo: statusPopPromo.value ?? "",
                        kelengkapanItem:
                            int.tryParse(kelengkapanItem.text) ?? 0,
                        kebersihanFreezer: kebersihanFreezer.value ?? "",
                        promosiAktif: promosiDetail.text,
                        itemKosong: itemKosong.text,
                        absensiSpgId: id);
                    List<FotoDto> fotos = [];
                    if (fotoDisplayProdukFreezer1.value != null) {
                      final fotoDisplayProdukFreezer1Dto = FotoDto(
                          keteranganFoto: "fotoDisplayProdukFreezer1",
                          foto: fotoDisplayProdukFreezer1.value!);
                      fotos.add(fotoDisplayProdukFreezer1Dto);
                    }
                    if (fotoDisplayProdukFreezer2.value != null) {
                      final fotoDisplayProdukFreezer2Dto = FotoDto(
                          keteranganFoto: "fotoDisplayProdukFreezer2",
                          foto: fotoDisplayProdukFreezer2.value!);
                      fotos.add(fotoDisplayProdukFreezer2Dto);
                    }
                    if (fotoDisplayProdukFreezer3.value != null) {
                      final fotoDisplayProdukFreezer3Dto = FotoDto(
                          keteranganFoto: "fotoDisplayProdukFreezer3",
                          foto: fotoDisplayProdukFreezer3.value!);
                      fotos.add(fotoDisplayProdukFreezer3Dto);
                    }
                    if (fotoDisplayProdukFreezerIsland1.value != null) {
                      final fotoDisplayProdukFreezerIsland1Dto = FotoDto(
                          keteranganFoto: "fotoDisplayProdukFreezerIsland1",
                          foto: fotoDisplayProdukFreezerIsland1.value!);
                      fotos.add(fotoDisplayProdukFreezerIsland1Dto);
                    }
                    if (fotoPosisiFreezerDariJauh.value != null) {
                      final fotoPosisiFreezerDariJauhDto = FotoDto(
                          keteranganFoto: "fotoPosisiFreezerDariJauh",
                          foto: fotoPosisiFreezerDariJauh.value!);
                      fotos.add(fotoPosisiFreezerDariJauhDto);
                    }
                    if (fotoPopPromosi.value != null) {
                      final fotoPopPromosiDto = FotoDto(
                          keteranganFoto: "fotoPopPromosi",
                          foto: fotoPopPromosi.value!);
                      fotos.add(fotoPopPromosiDto);
                    }

                    ref
                        .read(inputAbsensiProvider.notifier)
                        .checkkOut(checkOut, fotos, id);
                  }
                },
              ),
            )
          : null,
    );
  }
}

class ListProdukReport extends ConsumerWidget {
  final AbsensiDetailModel absen;
  const ListProdukReport({
    Key? key,
    required this.absen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final listProdukReport = ref.watch(listProdukReportProvider);
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: listProdukReport.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final item = listProdukReport[index];
              return Column(
                children: [
                  Row(
                    children: [
                      Text(item.namaProduk),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "${item.harga} (x${item.jumlahProduk})",
                        ),
                      ),
                      Text(item.totalPrice.toString())
                    ],
                  )
                ],
              );
            },
          ),
        ),
        Row(
          children: [
            const Text("Total Harga"),
            const Spacer(),
            Text(listProdukReport.getTotal().toString()),
          ],
        ),
        ElevatedButton(
            onPressed: () {
              if (listProdukReport.isEmpty) {
                showToast(context, "Harap Mengisi List Produk Terlebih Dahulu");
                return;
              }
              ref.read(inputAbsensiProvider.notifier).sendProdukList(
                  absensiSpgId: absen.absensiId,
                  produkReportModel: listProdukReport,
                  formAbsensiId: absen.formAbsensiId);
            },
            child: Center(
              child: ref.watch(inputAbsensiProvider).isLoading
                  ? Container(
                      constraints: const BoxConstraints(
                        maxWidth: 20,
                        maxHeight: 20,
                      ),
                      child: const CircularProgressIndicator())
                  : const Text("Submit"),
            )),
      ],
    );
  }
}
