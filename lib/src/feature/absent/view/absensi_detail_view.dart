import 'package:aice/src/src.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AbsensiDetailView extends ConsumerWidget {
  static const routeName = "/absensiDetailView";
  const AbsensiDetailView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            'Absensi Detail',
            style: TextStyle(fontSize: 16),
          ),
          bottom: const TabBar(tabs: [
            Tab(child: Text("Form")),
            Tab(child: Text("Gambar")),
            Tab(
                child: Text(
              "Produk Penjualan",
              textAlign: TextAlign.center,
            )),
          ]),
        ),
        body: Consumer(builder: (context, ref, child) {
          return ref.watch(absensiDetailProvider).when(data: (data) {
            return TabBarView(
              children: [
                AbsensiFormDetail(absen: data),
                AbsensiGambarDetail(absen: data),
                AbsensiProdukPenjualan(
                  absen: data,
                ),
              ],
            );
          }, error: (e) {
            return const SizedBox();
          }, loading: () {
            return const Center(child: Text('Harap Tunggu'));
          });
        }),
        // body: TabBar(tabs: tabs),
      ),
    );
  }
}
