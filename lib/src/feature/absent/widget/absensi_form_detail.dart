import 'package:aice/src/src.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AbsensiFormDetail extends ConsumerWidget {
  final AbsensiDetailModel? absen;
  const AbsensiFormDetail({super.key, required this.absen});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const style = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w600,
    );
    const styleTitle = TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w700,
    );
    if (absen == null) {
      return const Center(
        child: Text("Mohon Isi Data Absensi"),
      );
    }
    final absensi = absen!;

    final isi = {
      "Nama Toko": Text(
        absensi.namaToko,
        style: style,
      ),
      "Jenis Toko": Text(
        PilihanToko.values
            .firstWhere((element) => element.value == absensi.pilihanTokoId)
            .name,
        style: style,
      ),
      "Waktu Check-In": Text(
        formatDate(absensi.waktuCheckIn),
        style: style,
      ),
      "Waktu Check-Out": Text(
        formatDate(absensi.waktuCheckOut),
        style: style,
      ),
      "Kualitas Baik": Text(
        "${absensi.kualitasBaik}",
        style: style,
      ),
      "Kualitas Buruk": Text(
        "${absensi.kualitasRusak}",
        style: style,
      ),
      "Item Kosong": Text(
        absensi.itemKosong,
        style: style,
      ),
      "Papan Harga Freezer": Text(
        absensi.papanHargaFreezer,
        style: style,
      ),
      "Price Tag TG": Text(
        absensi.priceTagTg,
        style: style,
      ),
      "Price Tag Island": Text(
        absensi.priceTagIsland,
        style: style,
      ),
      "Status Pop Promo": Text(
        absensi.statusPopPromo,
        style: style,
      ),
      "Promo Aktif": Text(
        absensi.promosiAktif,
        style: style,
      ),
      "Kelengkapan Item": Text(
        "${absensi.kelengkapanItem}",
        style: style,
      ),
      "Koordinat": Text(
        "(${absensi.latitude}, ${absensi.longitude})",
        style: style,
      )
    };

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DataTable(
          headingRowColor: const MaterialStatePropertyAll(Colors.grey),
          columns: const [
            DataColumn(
              label: Text(
                "Form",
                style: styleTitle,
              ),
            ),
            DataColumn(
              label: Text(
                "Isi",
                style: styleTitle,
              ),
            ),
          ],
          rows: [
            for (var item in isi.entries)
              DataRow(cells: [
                DataCell(Text(
                  item.key,
                  style: style,
                )),
                DataCell(item.value),
              ])
          ]),
    );
  }
}
