import 'package:aice/src/feature/feature.dart';
import 'package:flutter/material.dart';

class TokoForm extends StatelessWidget {
  final TextEditingController namaTokoController;
  final TextEditingController? kodeTokoController;
  final ValueNotifier<PilihanToko?>? pilihanToko;
  final bool isEnabled;

  const TokoForm(
      {super.key,
      required this.namaTokoController,
      this.isEnabled = true,
      this.pilihanToko,
      this.checkOut = false,
      required this.kodeTokoController});

  const TokoForm.absensi(
      {super.key,
      required this.namaTokoController,
      this.isEnabled = true,
      required this.pilihanToko,
      this.checkOut = false,
      this.kodeTokoController});
  final bool checkOut;

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
        const SizedBox(
          height: 8,
        ),
        if (kodeTokoController != null) ...[
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
          const SizedBox(
            height: 8,
          ),
        ],
        if (pilihanToko != null) ...[
          if (checkOut)
            IgnorePointer(
              child: CustomDropdownButton<PilihanToko>(
                value: pilihanToko?.value,
                onChanged: (value) {
                  pilihanToko?.value = value;
                },
                items: PilihanToko.values,
                toDropdownMenuItem: (value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value.name),
                  );
                },
                title: "Pilihan Toko",
                toName: (value) {
                  return value?.name ?? "";
                },
              ),
            )
          else
            CustomDropdownButton<PilihanToko>(
              value: pilihanToko?.value,
              onChanged: (value) {
                pilihanToko?.value = value;
              },
              items: PilihanToko.values,
              toDropdownMenuItem: (value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value.name),
                );
              },
              title: "Pilihan Toko",
              toName: (value) {
                return value?.name ?? "";
              },
            ),
        ]
          
      ],
    );
  }
}
