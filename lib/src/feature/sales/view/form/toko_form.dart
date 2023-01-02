import 'package:flutter/material.dart';

class TokoForm extends StatelessWidget {
  final TextEditingController namaTokoController;
  final TextEditingController kodeTokoController;
  const TokoForm(
      {super.key,
      required this.namaTokoController,
      required this.kodeTokoController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: namaTokoController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Nama Toko tidak boleh kosong";
            }
            return null;
          },
          decoration: const InputDecoration(labelText: 'Nama Toko'),
        ),
        TextFormField(
          controller: kodeTokoController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Kode Toko tidak boleh kosong";
            }
            return null;
          },
          decoration: const InputDecoration(labelText: 'Kode Toko'),
        ),
      ],
    );
  }
}
