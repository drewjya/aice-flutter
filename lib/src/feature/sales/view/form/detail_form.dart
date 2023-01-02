import 'package:aice/src/feature/sales/widget/custom_dropdown_button.dart';
import 'package:flutter/material.dart';

class DetailForm extends StatelessWidget {
  const DetailForm({
    super.key,
    required this.jumlahPOController,
    required this.jumlahItemTerdisplayController,
    required this.saranDanKendalaController,
    required this.productReturController,
    required this.pilihanToko,
    required this.kualitasProduk,
    required this.stickerFreezer,
    required this.dividerSekat,
    required this.labelHarga,
    required this.woblerPromo,
    required this.spanduk,
    required this.atributBrandLainYangMengambilSpaceAice,
    required this.stockBrandLainYangMengambilSpaceAice,
    required this.stockDibawahFreezer,
    required this.produkPromosi,
    required this.kebersihanBungaEs,
    required this.kepenuhanFreezerBagianAtas,
    required this.debuFreezer,
    required this.bekasLemFreezer,
    required this.posisiFreezer,
  });
  final TextEditingController jumlahPOController;
  final TextEditingController jumlahItemTerdisplayController;
  final TextEditingController saranDanKendalaController;
  final TextEditingController productReturController;
  final ValueNotifier<String?> pilihanToko;
  final ValueNotifier<String?> kualitasProduk;
  final ValueNotifier<String?> stickerFreezer;
  final ValueNotifier<String?> dividerSekat;
  final ValueNotifier<String?> labelHarga;
  final ValueNotifier<String?> woblerPromo;
  final ValueNotifier<String?> spanduk;
  final ValueNotifier<String?> atributBrandLainYangMengambilSpaceAice;
  final ValueNotifier<String?> stockBrandLainYangMengambilSpaceAice;
  final ValueNotifier<String?> stockDibawahFreezer;
  final ValueNotifier<String?> produkPromosi;
  final ValueNotifier<String?> kebersihanBungaEs;
  final ValueNotifier<String?> kepenuhanFreezerBagianAtas;
  final ValueNotifier<String?> debuFreezer;
  final ValueNotifier<String?> bekasLemFreezer;
  final ValueNotifier<String?> posisiFreezer;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomDropdownButton<String>(
          value: pilihanToko.value,
          onChanged: (value) {
            pilihanToko.value = value;
          },
          items: const ['Alfamart', 'Alfamidi', 'Indomaret', 'Superhyper'],
          toDropdownMenuItem: (value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value),
            );
          },
          title: "Pilihan Toko",
          toName: (value) {
            return value ?? "";
          },
        ),
        CustomDropdownButton<String>(
          value: kualitasProduk.value,
          onChanged: (value) {
            kualitasProduk.value = value;
          },
          items: const <String>[
            'Baik',
            '1-10 Pcs Rusak ',
            '11-20 Pcs Rusak',
            'Hampir Semua Rusak',
            'Semua Rusak'
          ],
          toDropdownMenuItem: (value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value),
            );
          },
          title: "Kualitas Produk",
          toName: (value) {
            return value ?? "";
          },
        ),
        CustomDropdownButton<String>(
          value: stickerFreezer.value,
          onChanged: (value) {
            stickerFreezer.value = value;
          },
          items: const <String>[
            'Ada',
            'Tidak Ada',
          ],
          toDropdownMenuItem: (value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value),
            );
          },
          title: "Sticker Freezer",
          toName: (value) {
            return value ?? "";
          },
        ),
        CustomDropdownButton<String>(
          value: dividerSekat.value,
          onChanged: (value) {
            dividerSekat.value = value;
          },
          items: const <String>[
            'Terpasang',
            'Tidak Ada',
          ],
          toDropdownMenuItem: (value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value),
            );
          },
          title: "Divider/Sekat",
          toName: (value) {
            return value ?? "";
          },
        ),
        CustomDropdownButton<String>(
          value: labelHarga.value,
          onChanged: (value) {
            labelHarga.value = value;
          },
          items: const <String>[
            'Ada',
            'Tidak Ada',
          ],
          toDropdownMenuItem: (value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value),
            );
          },
          title: "Label Harga",
          toName: (value) {
            return value ?? "";
          },
        ),
        CustomDropdownButton<String>(
          value: woblerPromo.value,
          onChanged: (value) {
            woblerPromo.value = value;
          },
          items: const <String>[
            'Terpasang',
            'Tidak Ada',
          ],
          toDropdownMenuItem: (value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value),
            );
          },
          title: "Wobler Promo",
          toName: (value) {
            return value ?? "";
          },
        ),
        CustomDropdownButton<String>(
          value: spanduk.value,
          onChanged: (value) {
            spanduk.value = value;
          },
          items: const <String>[
            'Ada',
            'Tidak Ada',
          ],
          toDropdownMenuItem: (value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value),
            );
          },
          title: "Spanduk",
          toName: (value) {
            return value ?? "";
          },
        ),
        CustomDropdownButton<String>(
          value: atributBrandLainYangMengambilSpaceAice.value,
          onChanged: (value) {
            atributBrandLainYangMengambilSpaceAice.value = value;
          },
          items: const <String>[
            'Ada',
            'Tidak Ada',
          ],
          toDropdownMenuItem: (value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value),
            );
          },
          title: "Atribut Brand Lain Yang Mengambil Space AICE",
          toName: (value) {
            return value ?? "";
          },
        ),
        CustomDropdownButton<String>(
          value: stockBrandLainYangMengambilSpaceAice.value,
          onChanged: (value) {
            stockBrandLainYangMengambilSpaceAice.value = value;
          },
          items: const <String>[
            'Ada',
            'Tidak Ada',
          ],
          toDropdownMenuItem: (value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value),
            );
          },
          title: "Stock Brand Lain Yang Mengambil Space AICE",
          toName: (value) {
            return value ?? "";
          },
        ),
        CustomDropdownButton<String>(
          value: stockDibawahFreezer.value,
          onChanged: (value) {
            stockDibawahFreezer.value = value;
          },
          items: const <String>[
            'Ada',
            'Tidak Ada',
          ],
          toDropdownMenuItem: (value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value),
            );
          },
          title: "Stock Dibawah Freezer",
          toName: (value) {
            return value ?? "";
          },
        ),
        CustomDropdownButton<String>(
          value: produkPromosi.value,
          onChanged: (value) {
            produkPromosi.value = value;
          },
          items: const <String>[
            'Ada',
            'Tidak Ada',
          ],
          toDropdownMenuItem: (value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value),
            );
          },
          title: "Produk Promosi",
          toName: (value) {
            return value ?? "";
          },
        ),
        CustomDropdownButton<String>(
          value: kebersihanBungaEs.value,
          onChanged: (value) {
            kebersihanBungaEs.value = value;
          },
          items: const <String>[
            'Bersih',
            'Tidak',
          ],
          toDropdownMenuItem: (value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value),
            );
          },
          title: "Kebersihan Bunga Es",
          toName: (value) {
            return value ?? "";
          },
        ),
        CustomDropdownButton<String>(
          value: kepenuhanFreezerBagianAtas.value,
          onChanged: (value) {
            kepenuhanFreezerBagianAtas.value = value;
          },
          items: const <String>[
            '100%',
            '70 - 90%',
            '50% - 70%',
            '30% - 50%',
            '10% - 30%',
          ],
          toDropdownMenuItem: (value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value),
            );
          },
          title: "Kepenuhan Freezer Bagian Atas",
          toName: (value) {
            return value ?? "";
          },
        ),
        CustomDropdownButton<String>(
          value: debuFreezer.value,
          onChanged: (value) {
            debuFreezer.value = value;
          },
          items: const <String>[
            'Ada Debu',
            'Tidak Ada debu',
          ],
          toDropdownMenuItem: (value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value),
            );
          },
          title: "Debu Freezer",
          toName: (value) {
            return value ?? "";
          },
        ),
        CustomDropdownButton<String>(
          value: bekasLemFreezer.value,
          onChanged: (value) {
            bekasLemFreezer.value = value;
          },
          items: const <String>[
            'Ada Bekas Lem',
            'Tidak ada bekas lem',
          ],
          toDropdownMenuItem: (value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value),
            );
          },
          title: "Bekas Lem Freezer",
          toName: (value) {
            return value ?? "";
          },
        ),
        CustomDropdownButton<String>(
          value: posisiFreezer.value,
          onChanged: (value) {
            posisiFreezer.value = value;
          },
          items: const <String>[
            'Sudah Bagus',
            'Terhalang ATM',
            'Kondisi buruk lainnya'
          ],
          toDropdownMenuItem: (value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value),
            );
          },
          title: "Posisi Freezer",
          toName: (value) {
            return value ?? "";
          },
          padding: false,
        ),
        TextFormField(
          controller: jumlahPOController,
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Jumlah PO tidak boleh kosong";
            }
            return null;
          },
          decoration: const InputDecoration(labelText: 'Jumlah PO'),
        ),
        TextFormField(
          controller: jumlahItemTerdisplayController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Jumlah Item Terdisplay',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Jumlah Item tidak boleh kosong";
            }
            return null;
          },
        ),
        TextFormField(
          controller: saranDanKendalaController,
          decoration: const InputDecoration(labelText: 'Saran dan Kendala'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Saran dan Kendala tidak boleh kosong";
            }
            return null;
          },
        ),
        TextFormField(
          controller: productReturController,
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Produk Retur tidak boleh kosong";
            }
            return null;
          },
          decoration: const InputDecoration(labelText: 'Produk Retur'),
        ),
      ],
    );
  }
}
