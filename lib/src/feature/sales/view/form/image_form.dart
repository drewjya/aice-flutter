// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:aice/src/feature/sales/widget/image_sales_picker.dart';
import 'package:aice/src/src.dart';
import 'package:flutter/material.dart';

class ImageForm extends StatelessWidget {
  const ImageForm({
    Key? key,
    required this.tipe,
    required this.fotoSelfie,
    required this.fotoKulkasJauh,
    required this.fotoKulkasDekat,
    required this.fotoFreezerOne,
    required this.fotoFreezerDua,
    required this.fotoFreezerTiga,
    required this.freezerIsland1,
    required this.freezerIsland2,
    required this.freezerIsland3,
    required this.fotoFreezerBawah,
    required this.fotoPo,
    required this.fotoPop,
    required this.fotoPeralatan, required this.fotoKulkasTerbuka,
  }) : super(key: key);
  final String tipe;
  final ValueNotifier<File?> fotoSelfie;
  final ValueNotifier<File?> fotoKulkasJauh;
  final ValueNotifier<File?> fotoKulkasDekat;
  final ValueNotifier<File?> fotoKulkasTerbuka;
  final ValueNotifier<File?> fotoFreezerOne;
  final ValueNotifier<File?> fotoFreezerDua;
  final ValueNotifier<File?> fotoFreezerTiga;
  final ValueNotifier<File?> freezerIsland1;
  final ValueNotifier<File?> freezerIsland2;
  final ValueNotifier<File?> freezerIsland3;
  final ValueNotifier<File?> fotoFreezerBawah;
  final ValueNotifier<File?> fotoPo;
  final ValueNotifier<File?> fotoPop;
  final ValueNotifier<File?> fotoPeralatan;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65.height(context),
      child: GridView(
        primary: false,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        children: <Widget>[
          if (tipe == "Superhyper") ...[
            ImageSalesPicker(
                title: "Foto Selfie Depan Nama Toko", file: fotoSelfie),
            ImageSalesPicker(title: "Foto Kulkas Jauh", file: fotoKulkasJauh),
            ImageSalesPicker(title: "Foto Kulkas Dekat", file: fotoKulkasDekat),
            ImageSalesPicker(title: "Foto Freezer One", file: fotoFreezerOne),
            ImageSalesPicker(title: "Foto Freezer Dua", file: fotoFreezerDua),
            ImageSalesPicker(title: "Foto Freezer Tiga", file: fotoFreezerTiga),
            ImageSalesPicker(title: "Freezer Island 1", file: freezerIsland1),
            ImageSalesPicker(title: "Freezer Island 2", file: freezerIsland2),
            ImageSalesPicker(title: "Freezer Island 3", file: freezerIsland3),
            ImageSalesPicker(
                title: "Foto Freezer Bawah", file: fotoFreezerBawah),
            ImageSalesPicker(title: "Foto PO", file: fotoPo),
            ImageSalesPicker(title: "Foto Pop", file: fotoPop),
            ImageSalesPicker(title: "Foto Peralatan", file: fotoPeralatan),
          ] else ...[
            ImageSalesPicker(
                title: "Foto Selfie Depan Pintu", file: fotoSelfie),
            ImageSalesPicker(title: "Foto Kulkas Jauh", file: fotoKulkasJauh),
            ImageSalesPicker(title: "Foto Kulkas Dekat", file: fotoKulkasDekat),
            ImageSalesPicker(
                title: "Foto Kulkas Terbuka", file: fotoKulkasDekat),
            ImageSalesPicker(title: "Foto PO", file: fotoPo),
            ImageSalesPicker(
                title: "Foto Freezer Bawah", file: fotoFreezerBawah),
          ]
        ],
      ),
    );
  }
}
