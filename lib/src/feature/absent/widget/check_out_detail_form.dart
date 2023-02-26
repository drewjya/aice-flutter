// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:aice/src/src.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CheckOutDetailForm extends StatelessWidget {
  final ValueNotifier<String?> kualitasProduk;
  final TextEditingController produkRusak;
  final ValueNotifier<String> periodePromo;
  final TextEditingController promosiDetail;
  final ValueNotifier<String?> papanHargaFreezer;
  final ValueNotifier<String?> priceTagTg;
  final ValueNotifier<String?> priceTagIsland;
  final ValueNotifier<String?> statusPopPromo;
  final TextEditingController kelengkapanItem;
  final TextEditingController itemKosong;
  final ValueNotifier<String?> kebersihanFreezer;

  const CheckOutDetailForm({
    Key? key,
    required this.kualitasProduk,
    required this.produkRusak,
    required this.periodePromo,
    required this.promosiDetail,
    required this.papanHargaFreezer,
    required this.priceTagTg,
    required this.priceTagIsland,
    required this.statusPopPromo,
    required this.kelengkapanItem,
    required this.itemKosong,
    required this.kebersihanFreezer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listTrepasang = ["Terpasang", "Tidak"];
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CustomDropdownButton<String>(
              value: kualitasProduk.value,
              onChanged: (p0) => kualitasProduk.value = p0,
              items: const ["Baik", "Buruk"],
              toDropdownMenuItem: (p0) => DropdownMenuItem(
                value: p0,
                child: Text(p0),
              ),
              title: "Kualitas Produk",
              toName: (p0) => p0 ?? "",
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: produkRusak,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Produk Rusak tidak boleh kosong";
                }
                return null;
              },
              decoration: const InputDecoration(labelText: 'Produk Rusak'),
            ),
            const SizedBox(
              height: 8,
            ),
            CustomDropdownButton<String>(
              value: papanHargaFreezer.value,
              onChanged: (value) {
                papanHargaFreezer.value = value;
              },
              items: listTrepasang,
              toDropdownMenuItem: (value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value),
                );
              },
              title: "Papan Harga Freezer",
              toName: (value) {
                return value ?? "";
              },
            ),
            const SizedBox(
              height: 8,
            ),
            CustomDropdownButton<String>(
              value: priceTagTg.value,
              onChanged: (value) {
                priceTagTg.value = value;
              },
              items: listTrepasang,
              toDropdownMenuItem: (value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value),
                );
              },
              title: "Price Tag Aice",
              toName: (value) {
                return value ?? "";
              },
            ),
            const SizedBox(
              height: 8,
            ),
            CustomDropdownButton<String>(
              value: priceTagIsland.value,
              onChanged: (value) {
                priceTagIsland.value = value;
              },
              items: listTrepasang,
              toDropdownMenuItem: (value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value),
                );
              },
              title: "Price Tag Island",
              toName: (value) {
                return value ?? "";
              },
            ),
            const SizedBox(
              height: 8,
            ),
            CustomDropdownButton<String>(
              value: statusPopPromo.value,
              onChanged: (value) {
                statusPopPromo.value = value;
              },
              items: const [
                "Terpasang",
                "Tidak Terpasang",
                "Sedang Tidak Ada Promo"
              ],
              toDropdownMenuItem: (value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value),
                );
              },
              title: "Status Pop Promo",
              toName: (value) {
                return value ?? "";
              },
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: promosiDetail,
              // keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Promosi Detail tidak boleh kosong";
                }
                return null;
              },
              decoration: const InputDecoration(labelText: 'Promosi Aktif'),
            ),
            const SizedBox(
              height: 8,
            ),
            OnPressedField(
              title: "Periode Promo",
              value: periodePromo.value,
              onPressed: () async {
                final dateRange = await showDateRangePicker(
                  context: context,
                  firstDate: DateTime(DateTime.now().year - 1),
                  lastDate: DateTime(2099),
                );
                final format = DateFormat("dd-MM-yyyy");
                if (dateRange == null) {
                  return;
                }
                periodePromo.value =
                    "${format.format(dateRange.start)} s/d ${format.format(dateRange.end)}";
              },
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: kelengkapanItem,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Kelengkapan Item tidak boleh kosong";
                }
                return null;
              },
              decoration: const InputDecoration(labelText: 'Kelengkapan Item'),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: itemKosong,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Item Kosong tidak boleh kosong";
                }
                return null;
              },
              decoration: const InputDecoration(labelText: 'Item Kosong'),
            ),
            const SizedBox(
              height: 8,
            ),
            CustomDropdownButton<String>(
              value: kebersihanFreezer.value,
              onChanged: (value) {
                kebersihanFreezer.value = value;
              },
              items: const ["Bersih", "Tidak"],
              toDropdownMenuItem: (value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value),
                );
              },
              title: "Kebersihan Freezer",
              toName: (value) {
                return value ?? "";
              },
            ),
          ],
        ),
      ),
    );
  }
}
