import 'package:aice/src/feature/absent/widget/check_out_detail_form.dart';
import 'package:aice/src/src.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CheckOutView extends HookConsumerWidget {
  static const routeName = "checkOutView";
  const CheckOutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final namaTokoController = useTextEditingController();
    final kualitasBaikController = useTextEditingController();
    final kualitasBurukController = useTextEditingController();
    final papanHargaFreezer = useState<String?>(null);
    final priceTagTg = useState<String?>(null);
    final priceTagIsland = useState<String?>(null);
    final statusPopPromo = useState<String?>(null);
    final kelengkapanItem = useTextEditingController();
    final kebersihanFreezer = useState<String?>(null);
    final pilihanToko = useState<PilihanToko?>(null);
    final formKey = useMemoized(
      () => GlobalKey<FormState>(),
    );

    useEffect(() {
      final absensi = ref.watch(absensiProvider).asData?.value;
      namaTokoController.text = absensi?.namaToko ?? '';
      pilihanToko.value = PilihanToko.fromValue(absensi?.pilihanTokoId ?? 0);
      dPrint(pilihanToko.value);
      return null;
    }, [ref.watch(absensiProvider)]);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Check Out',
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Form(
                key: formKey,
                  child: Column(
                    children: [
                      TokoForm.absensi(
                        isEnabled: false,
                        checkOut: true,
                        pilihanToko: pilihanToko,
                        namaTokoController: namaTokoController,
                      ),
                      CheckOutDetailForm(
                          kualitasBaikController: kualitasBaikController,
                          kualitasBurukController: kualitasBurukController,
                          papanHargaFreezer: papanHargaFreezer,
                          priceTagTg: priceTagTg,
                          priceTagIsland: priceTagIsland,
                          statusPopPromo: statusPopPromo,
                          kelengkapanItem: kelengkapanItem,
                          kebersihanFreezer: kebersihanFreezer)
                    ],
                  )
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, AddTokoFormView.routeName);
                },
                icon: const Icon(Icons.add),
                label: const Text("Tambah Produk"),
              ),
              const ListProdukReport(),
              ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState?.validate() ?? false) {
                      // final listProdukReport =
                      //     ref.watch(listProdukReportProvider);
                      // if (listProdukReport.isEmpty) {
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //       const SnackBar(
                      //           content: Text("Mohon lakukan input produk")));
                      //   return;
                      // }
                      // final checkInModel = CheckOutModel(
                      //     listProduk: listProdukReport,
                      //     namaToko: namaTokoController.text,
                      //     kodeToko: kodeTokoController.text);
                      // ref
                      //     .read(absentRepositoryProvider)
                      //     .checkOut(checkInModel: checkInModel)
                      //     .then((value) {
                      //   if (value != null) {
                      //     ScaffoldMessenger.of(context)
                      //         .showSnackBar(SnackBar(content: Text(value)));
                      //   }
                      //   Navigator.pop(context);
                      // });
                    }
                  },
                  child: const Center(child: Text("Check Out"))),
            ],
          ),
        ),
      ),
    );
  }
}

class ListProdukReport extends ConsumerWidget {
  const ListProdukReport({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final listProdukReport = ref.watch(listProdukReportProvider);
    return SizedBox(
      height:
          36 * (listProdukReport.length < 12 ? listProdukReport.length : 12) +
              30,
      child: Column(
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
                        const Spacer(),
                        Text(
                          "${item.harga} (x${item.jumlahProduk})",
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Spacer(),
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
          )
        ],
      ),
    );
  }
}
