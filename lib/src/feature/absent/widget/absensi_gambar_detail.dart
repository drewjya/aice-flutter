import 'package:aice/src/src.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AbsensiGambarDetail extends ConsumerWidget {
  final AbsensiDetailModel? absen;
  const AbsensiGambarDetail({Key? key, required this.absen}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    if (absen == null) {
      return const Center(
        child: Text("Mohon Isi Data Absensi"),
      );
    }
    final absensi = absen!;
    final isi = {
      "Foto Selfie": absensi.fotoSelfie,
      "Foto Display Produk Freezer1": absensi.fotoDisplayProdukFreezer1,
      "Foto Display Produk Freezer2": absensi.fotoDisplayProdukFreezer2,
      "Foto Display Produk Freezer3": absensi.fotoDisplayProdukFreezer3,
      "Foto Display Produk Freezer Island1":
          absensi.fotoDisplayProdukFreezerIsland1,
      "Foto Pop Promosi": absensi.fotoPopPromosi,
      "Foto Posisi Freezer Dari Jauh": absensi.fotoPosisiFreezerDariJauh,
    };

    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        childAspectRatio: 1.0,
      ),
      children: [
        for (var item in isi.entries)
          ImageSalesWidget(
            url: ApiUrl.getImage(item.value) ??
                "https://play-lh.googleusercontent.com/ZyWNGIfzUyoajtFcD7NhMksHEZh37f-MkHVGr5Yfefa-IX7yj9SMfI82Z7a2wpdKCA=w240-h480-rw",
            title: item.key,
          ),
      ],
    );
  }
}
