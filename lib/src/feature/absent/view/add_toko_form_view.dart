import 'package:aice/src/feature/absent/providers/list_produk_provider.dart';
import 'package:aice/src/src.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddTokoFormView extends HookConsumerWidget {
  const AddTokoFormView({Key? key}) : super(key: key);
  static const routeName = "/addTokoForm";

  @override
  Widget build(BuildContext context, ref) {
    final produkModelList = ref.watch(listProdukProvider).asData?.value ?? [];
    final produkModel = useState<ProdukModel?>(null);
    final hargaProdukController = useTextEditingController();
    final qtyProdukController = useTextEditingController();
    final qtyFocusNode = useFocusNode();
    final priceFocusNode = useFocusNode();
    final formKey = useMemoized(
      () => GlobalKey<FormState>(),
    );
    final listProdukReport = ref.watch(listProdukReportProvider);
    produkModelList.removeWhere((element) =>
        listProdukReport.map((e) => e.kodeProduk).contains(element.kodeProduk));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Tambah Produk',
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Pilih Nama Produk",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      showDropdownSearchDialog<ProdukModel>(
                          item: produkModelList,
                          onTap: (val) {
                            produkModel.value = val;
                          },
                          toName: (val) {
                            return val.namaProduk;
                          },
                          context: context);
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.black,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        produkModel.value?.namaProduk ?? "",
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                ],
              ),
              TextFormField(
                controller: hargaProdukController,
                focusNode: priceFocusNode,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Harga Produk tidak boleh kosong";
                  }
                  return null;
                },
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  FilteringTextInputFormatter.digitsOnly
                ],
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Harga Produk'),
              ),
              TextFormField(
                controller: qtyProdukController,
                focusNode: qtyFocusNode,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Jumlah Produk tidak boleh kosong";
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Jumlah Produk'),
              ),
              ElevatedButton(
                  onPressed: () {
                    priceFocusNode.unfocus();
                    qtyFocusNode.unfocus();
                    final a = formKey.currentState?.validate() ?? false;
                    if (a) {
                      final produkReportModel = ProdukReportModel(
                          namaProduk: produkModel.value?.namaProduk ?? "",
                          kodeProduk: produkModel.value?.kodeProduk ?? "",
                          jumlahProduk:
                              int.tryParse(qtyProdukController.text) ?? 0,
                          harga: int.tryParse(hargaProdukController.text) ?? 0);
                      final res = ref
                          .read(listProdukReportProvider.notifier)
                          .addProduk(produkReportModel);
                      if (res != null) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(res)));
                        return;
                      }
                      Navigator.pop(context);
                    }
                  },
                  child: const Center(
                    child: Text("Tambah Proudk"),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
