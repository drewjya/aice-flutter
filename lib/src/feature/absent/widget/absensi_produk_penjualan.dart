import 'package:aice/src/src.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AbsensiProdukPenjualan extends ConsumerWidget {
  const AbsensiProdukPenjualan({super.key, required this.absen});
  final AbsensiDetailModel absen;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (absen.products.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(8.0).copyWith(left: 16, right: 16),
        child: Column(
          children: [
            const Text("Mohon mengirimkan produk penjualan"),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AddTokoFormView.routeName);
              },
              child: const Text("Tambah Produk Penjualan"),
            ),
            Expanded(
                child: ListProdukReport(
              absen: absen,
            )),
          ],
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: absen.products.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final item = absen.products[index];
          return Column(
            children: [
              Row(
                children: [
                  Text(item.namaProduk),
                ],
              ),
              Row(
                children: [
                  Text(
                    "${item.harga} (x${item.jumlahProduk})",
                  ),
                  const Spacer(),
                  Text(item.totalPrice.toString())
                ],
              ),
              if (index == absen.products.length - 1) ...[
                Row(
                  children: [
                    const Text("Total Harga"),
                    const Spacer(),
                    Text(absen.products.getTotal().toString()),
                  ],
                ),
              ]
            ],
          );
        },
      ),
    );
  }
}
