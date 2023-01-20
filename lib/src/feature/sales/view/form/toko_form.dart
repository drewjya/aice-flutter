import 'package:flutter/material.dart';

class TokoForm extends StatelessWidget {
  final TextEditingController namaTokoController;
  final TextEditingController kodeTokoController;
  final bool isEnabled;

  const TokoForm(
      {super.key,
      required this.namaTokoController,
      this.isEnabled = true,
      required this.kodeTokoController});

  const TokoForm.absensi(
      {super.key,
      required this.namaTokoController,
      this.isEnabled = true,
      required this.kodeTokoController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: namaTokoController,
          enabled: isEnabled,
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
          enabled: isEnabled,
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
