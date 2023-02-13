// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:aice/src/src.dart';
import 'package:flutter/material.dart';

class CheckOutDetailForm extends StatelessWidget {
  final TextEditingController kualitasBaikController;
  final TextEditingController kualitasBurukController;
  final ValueNotifier<String?> papanHargaFreezer;
  final ValueNotifier<String?> priceTagTg;
  final ValueNotifier<String?> priceTagIsland;
  final ValueNotifier<String?> statusPopPromo;
  final TextEditingController kelengkapanItem;
  final TextEditingController itemKosong;
  final ValueNotifier<String?> kebersihanFreezer;
  const CheckOutDetailForm({
    Key? key,
    required this.kualitasBaikController,
    required this.kualitasBurukController,
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
            TextFormField(
              controller: kualitasBaikController,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Kualitas Baik tidak boleh kosong";
                }
                return null;
              },
              decoration: const InputDecoration(labelText: 'Kualitas Baik'),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: kualitasBurukController,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Kualitas Buruk tidak boleh kosong";
                }
                return null;
              },
              decoration: const InputDecoration(labelText: 'Kualitas Buruk'),
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
              title: "Price Tag TG",
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
