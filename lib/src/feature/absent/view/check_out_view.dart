import 'dart:math';

import 'package:aice/src/core/core.dart';
import 'package:aice/src/feature/feature.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CheckOutView extends HookConsumerWidget {
  static const routeName = "checkOutView";
  const CheckOutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final namaTokoController = useTextEditingController();
    final kodeTokoController = useTextEditingController();
    final produkModelList = ProdukModel.produkList();
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
              TokoForm.absensi(
                  namaTokoController: namaTokoController,
                  kodeTokoController: kodeTokoController),
              ElevatedButton.icon(
                onPressed: () {
                  final item = getRandomElement(produkModelList);
                  ref.read(listProdukReportProvider.notifier).addProduk(
                        ProdukReportModel(
                          namaProduk: item.namaProduk,
                          kodeProduk: item.namaProduk,
                          jumlahProduk: Random().nextInt(25) + 10,
                          harga: Random().nextInt(10000) + 1000,
                        ),
                      );
                },
                icon: const Icon(Icons.add),
                label: const Text("Tambah Produk"),
              ),
              const ListProdukReport(),
              ElevatedButton(
                  onPressed: () {},
                  child: const Center(child: Text("Check In"))),
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
      height: MediaQuery.of(context).size.height * 0.6,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: listProdukReport.length,
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
