import 'dart:io';

import 'package:aice/models/form_submit_model.dart';
import 'package:aice/models/other_submit_model.dart';
import 'package:aice/models/superhyper_submit_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

Future<bool> signIn(String email, String password) async {
  try {
    final a = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    print(a);
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}

Future<bool> register(String email, String password, String username) async {
  UserCredential authResult;

  try {
    authResult = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    await FirebaseFirestore.instance
        .collection('users')
        .doc(authResult.user?.uid)
        .set({
      'username': username,
      'email': email,
    });

    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
    return false;
  } catch (e) {
    print(e.toString());
    return false;
  }
}

Future<bool> addSuperHyperSale(
    {required SuperhyperSubmitModel superhyperSubmitModel,
    required FormSubmitModel formSubmitModel}) async {
  try {
    final users = FirebaseFirestore.instance.collection('users');
    final uid = FirebaseAuth.instance.currentUser?.uid;
    final result = await users.doc(uid).get();
    const uuid = Uuid();
    final ref = FirebaseStorage.instance.ref();
    final freezerOne = ref.child('FreezerOne').child('${uuid.v4()}.jpg');
    final freezerTwo = ref.child('FreezerTwo').child('${uuid.v4()}.jpg');
    final freezerThree = ref.child('FreezerThree').child('${uuid.v4()}.jpg');
    final freezerIslandOne =
        ref.child('FreezerIslandOne').child('${uuid.v4()}.jpg');
    final freezerIslandTwo =
        ref.child('FreezerIslandTwo').child('${uuid.v4()}.jpg');
    final freezerIslandThree =
        ref.child('FreezerIslandThree').child('${uuid.v4()}.jpg');
    final selfies = ref.child('Selfies').child('${uuid.v4()}.jpg');
    final farFreezer = ref.child('Far Freezer').child('${uuid.v4()}.jpg');
    final closeFreezer = ref.child('Close Freezer').child('${uuid.v4()}.jpg');
    final bawahFreezer = ref.child('Freezer Bawah').child('${uuid.v4()}.jpg');
    final poFreezer = ref.child('Foto PO').child('${uuid.v4()}.jpg');
    final peralatanFreezer = ref.child('Peralatan').child('${uuid.v4()}.jpg');
    final popFreezer = ref.child('Pop').child('${uuid.v4()}.jpg');
    await freezerOne.putFile(superhyperSubmitModel.freezerOne);
    await freezerTwo.putFile(superhyperSubmitModel.freezerTwo);
    await freezerThree.putFile(superhyperSubmitModel.freezerThree);
    await freezerIslandOne.putFile(superhyperSubmitModel.freezerIslandOne);
    await freezerIslandTwo.putFile(superhyperSubmitModel.freezerIslandTwo);
    await freezerIslandThree.putFile(superhyperSubmitModel.freezerIslandThree);
    await selfies.putFile(superhyperSubmitModel.pickedSelfie);
    await farFreezer.putFile(superhyperSubmitModel.farFreezer);
    await closeFreezer.putFile(superhyperSubmitModel.closeFreezer);
    await bawahFreezer.putFile(superhyperSubmitModel.freezerBawah);
    await poFreezer.putFile(superhyperSubmitModel.po);
    await peralatanFreezer.putFile(superhyperSubmitModel.fotoPeralatan);
    await popFreezer.putFile(superhyperSubmitModel.fotoPop);
    final freezerOneUrl = await freezerOne.getDownloadURL();
    final freezerTwoUrl = await freezerTwo.getDownloadURL();
    final freezerThreeUrl = await freezerThree.getDownloadURL();
    final freezerIslandOneUrl = await freezerIslandOne.getDownloadURL();
    final freezerIslandTwoUrl = await freezerIslandTwo.getDownloadURL();
    final freezerIslandThreeUrl = await freezerIslandThree.getDownloadURL();
    final selfiesUrl = await selfies.getDownloadURL();
    final farFreezerUrl = await farFreezer.getDownloadURL();
    final closeFreezerUrl = await closeFreezer.getDownloadURL();
    final bawahFreezerUrl = await bawahFreezer.getDownloadURL();
    final poFreezerUrl = await poFreezer.getDownloadURL();
    final peralatanFreezerUrl = await peralatanFreezer.getDownloadURL();
    final popFreezerUrl = await popFreezer.getDownloadURL();
    final documentReference = FirebaseFirestore.instance
        .collection('forms')
        .doc(uid)
        .collection('form')
        .doc(formSubmitModel.id);
    FirebaseFirestore.instance.runTransaction((transaction) async {
      final snapshot = await transaction.get(documentReference);
      if (!snapshot.exists) {
        final res = result.data();
        documentReference.set({
          'id': formSubmitModel.id,
          'Nama Distributor': (res != null) ? (res)['username'] : "",
          'Nama Toko': formSubmitModel.storeName,
          'Kode Toko': formSubmitModel.kodeToko,
          'Jumlah PO': formSubmitModel.jumlahPo,
          'Jumlah Item Terdisplay': formSubmitModel.jumlahItemTerdisplay,
          'Saran dan Kendala': formSubmitModel.saranDanKendala,
          'Produk Retur': formSubmitModel.produkRetur,
          'Pilihan Toko': formSubmitModel.pilihanToko,
          'Kualitas Produk': formSubmitModel.kualitasProduk,
          'Sticker Freezer': formSubmitModel.stickerFreezer,
          'Papan Harga': formSubmitModel.papanHarga,
          'Divider Kulkas': formSubmitModel.dividerKulkas,
          'Label Harga': formSubmitModel.labelHarga,
          'Wobler Promo': formSubmitModel.woblerPromo,
          'Spanduk': formSubmitModel.spanduk,
          'Produk Promosi': formSubmitModel.produkPromosi,
          'Kategori Freezer': formSubmitModel.kategoriFreezer,
          'Kebersihan Bunga Es': formSubmitModel.kebersihanBungaEs,
          'Kepenuhan Freezer Atas': formSubmitModel.kepenuhanFreezerAtas,
          'Kebersihan Debu Freezer': formSubmitModel.debuFreezer,
          'Kebersihan Lem Freezer': formSubmitModel.bekasLemFreezer,
          'Brand Lain': formSubmitModel.brandLain,
          'Stock Brand Lain': formSubmitModel.stockBrandLain,
          'Stock Dibawah Freezer': formSubmitModel.stockDibawahFreezer,
          'Posisi Freezer': formSubmitModel.posisiFreezer,
          'Foto Selfie': selfiesUrl,
          'Foto Kulkas Dari Jauh': farFreezerUrl,
          'Foto Kulkas Tertutup': closeFreezerUrl,
          'Foto PO': poFreezerUrl,
          'Foto Freezer Bawah': bawahFreezerUrl,
          "Foto Freezer One": freezerOneUrl,
          "Foto Freezer Two": freezerTwoUrl,
          "Foto Freezer Three": freezerThreeUrl,
          "Foto Freezer Island 1": freezerIslandOneUrl,
          "Foto Freezer Island 2": freezerIslandTwoUrl,
          "Foto Freezer Island 3": freezerIslandThreeUrl,
          "Foto Pop": popFreezerUrl,
          "Foto Peralatan": peralatanFreezerUrl,
          'Created At': FieldValue.serverTimestamp(),
        });
        return true;
      }

      return true;
    });
    return true;
  } catch (e) {
    return false;
  }
}

Future<bool> addOtherSale(
    {required OtherSubmitModel otherSubmitModel,
    required FormSubmitModel formSubmitModel}) async {
  try {
    final users = FirebaseFirestore.instance.collection('users');
    final uid = FirebaseAuth.instance.currentUser?.uid;
    final result = await users.doc(uid).get();
    const uuid = Uuid();
    final ref = FirebaseStorage.instance.ref();

    final selfies = ref.child('Selfies').child('${uuid.v4()}.jpg');
    final farFreezer = ref.child('Far Freezer').child('${uuid.v4()}.jpg');
    final closeFreezer = ref.child('Close Freezer').child('${uuid.v4()}.jpg');
    final bawahFreezer = ref.child('Freezer Bawah').child('${uuid.v4()}.jpg');
    final poFreezer = ref.child('Foto PO').child('${uuid.v4()}.jpg');
    final openedFreezer = ref.child('Opened Freezer').child('${uuid.v4()}.jpg');

    await selfies.putFile(otherSubmitModel.pickedSelfie);
    print("doneSelf");
    await farFreezer.putFile(otherSubmitModel.farFreezer);
    print("done farFreezer");
    await closeFreezer.putFile(otherSubmitModel.closeFreezer);
    print("done closeFreezer");
    await bawahFreezer.putFile(otherSubmitModel.freezerBawah);
    print("done bawahFreezer");
    await poFreezer.putFile(otherSubmitModel.po);
    print("done poFreezer");
    await openedFreezer.putFile(otherSubmitModel.openedFreezer);
    print("done openedFreezer");

    final selfiesUrl = await selfies.getDownloadURL();
    print("done selfies");
    final farFreezerUrl = await farFreezer.getDownloadURL();
    print("done farFreezer");
    final closeFreezerUrl = await closeFreezer.getDownloadURL();
    print("done closeFreezer");
    final bawahFreezerUrl = await bawahFreezer.getDownloadURL();
    print("done bawahFreezer");
    final poFreezerUrl = await poFreezer.getDownloadURL();
    print("done poFreezer");
    final openedFreezerUrl = await openedFreezer.getDownloadURL();
    print("done openedFreezer");
    print("done popFreezer");
    final documentReference = FirebaseFirestore.instance
        .collection('forms')
        .doc(uid)
        .collection('form')
        .doc(formSubmitModel.id);
    FirebaseFirestore.instance.runTransaction((transaction) async {
      final snapshot = await transaction.get(documentReference);
      if (!snapshot.exists) {
        final res = result.data();
        documentReference.set({
          'id': formSubmitModel.id,
          'Nama Distributor': (res != null) ? (res)['username'] : "",
          'Nama Toko': formSubmitModel.storeName,
          'Kode Toko': formSubmitModel.kodeToko,
          'Jumlah PO': formSubmitModel.jumlahPo,
          'Jumlah Item Terdisplay': formSubmitModel.jumlahItemTerdisplay,
          'Saran dan Kendala': formSubmitModel.saranDanKendala,
          'Produk Retur': formSubmitModel.produkRetur,
          'Pilihan Toko': formSubmitModel.pilihanToko,
          'Kualitas Produk': formSubmitModel.kualitasProduk,
          'Sticker Freezer': formSubmitModel.stickerFreezer,
          'Papan Harga': formSubmitModel.papanHarga,
          'Divider Kulkas': formSubmitModel.dividerKulkas,
          'Label Harga': formSubmitModel.labelHarga,
          'Wobler Promo': formSubmitModel.woblerPromo,
          'Spanduk': formSubmitModel.spanduk,
          'Produk Promosi': formSubmitModel.produkPromosi,
          'Kategori Freezer': formSubmitModel.kategoriFreezer,
          'Kebersihan Bunga Es': formSubmitModel.kebersihanBungaEs,
          'Kepenuhan Freezer Atas': formSubmitModel.kepenuhanFreezerAtas,
          'Kebersihan Debu Freezer': formSubmitModel.debuFreezer,
          'Kebersihan Lem Freezer': formSubmitModel.bekasLemFreezer,
          'Brand Lain': formSubmitModel.brandLain,
          'Stock Brand Lain': formSubmitModel.stockBrandLain,
          'Stock Dibawah Freezer': formSubmitModel.stockDibawahFreezer,
          'Posisi Freezer': formSubmitModel.posisiFreezer,
          'Foto Selfie': selfiesUrl,
          'Foto Kulkas Dari Jauh': farFreezerUrl,
          'Foto Kulkas Tertutup': closeFreezerUrl,
          'Foto PO': poFreezerUrl,
          'Foto Freezer Bawah': bawahFreezerUrl,
          'Foto Kulkas Terbuka': openedFreezerUrl,
          'Created At': FieldValue.serverTimestamp(),
        });
        return true;
      }

      return true;
    });
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}

Future<bool> addSale(
    String id,
    String storeName,
    String kodeToko,
    String jumlahPo,
    String jumlahItemTerdisplay,
    String saranDanKendala,
    String produkRetur,
    String pilihanToko,
    String kualitasProduk,
    String kategoriFreezer,
    String stickerFreezer,
    String papanHarga,
    String dividerKulkas,
    String labelHarga,
    String woblerPromo,
    String spanduk,
    String kepenuhanFreezerAtas,
    String debuFreezer,
    String brandLain,
    String stockBrandLain,
    String bekasLemFreezer,
    String posisiFreezer,
    String stockDibawahFreezer,
    String kebersihanBungaEs,
    String produkPromosi,
    File pickedSelfie,
    File farFreezer,
    File openedFreezer,
    File closeFreezer,
    File po,
    File freezerBawah,
    File? fotoSelaFreezer,
    File freezerOne,
    File freezerTwo,
    File freezerThree,
    File freezerIslandOne,
    File freezerIslandTwo,
    File freezerIslandThree,
    File fotoPop,
    File fotoPeralatan) async {
  try {
    final users = FirebaseFirestore.instance.collection('users');

    final uid = FirebaseAuth.instance.currentUser?.uid;

    final result = await users.doc(uid).get();
    var uuid = const Uuid();
    final freezerOneref = FirebaseStorage.instance
        .ref()
        .child('FreezerOne')
        .child('${uuid.v4()}.jpg');

    final freezerTworef = FirebaseStorage.instance
        .ref()
        .child('FreezerTwo')
        .child('${uuid.v4()}.jpg');

    final freezerThreeref = FirebaseStorage.instance
        .ref()
        .child('FreezerThree')
        .child('${uuid.v4()}.jpg');

    final freezerIslandOneRef = FirebaseStorage.instance
        .ref()
        .child('freezerIslandOneRef')
        .child('${uuid.v4()}.jpg');

    final freezerIslandTwoRef = FirebaseStorage.instance
        .ref()
        .child('freezerIslandTwo')
        .child('${uuid.v4()}.jpg');

    final freezerIslandThreeRef = FirebaseStorage.instance
        .ref()
        .child('freezerIslandThree')
        .child('${uuid.v4()}.jpg');

    final popRef =
        FirebaseStorage.instance.ref().child('Pop').child('${uuid.v4()}.jpg');

    final peralatanRef = FirebaseStorage.instance
        .ref()
        .child('Peralatan')
        .child('${uuid.v4()}.jpg');

    final ref = FirebaseStorage.instance
        .ref()
        .child('Selfies')
        .child('${uuid.v4()}.jpg');

    final farFreezerRef = FirebaseStorage.instance
        .ref()
        .child('Far Freezer')
        .child('${uuid.v4()}.jpg');
    final openedFreezerRef = FirebaseStorage.instance
        .ref()
        .child('Opened Freezer')
        .child('${uuid.v4()}.jpg');

    final closedFreezerRef = FirebaseStorage.instance
        .ref()
        .child('Close Freezer')
        .child('${uuid.v4()}.jpg');
    final poRef = FirebaseStorage.instance
        .ref()
        .child('Foto PO')
        .child('${uuid.v4()}.jpg');
    final freezerBawahRef = FirebaseStorage.instance
        .ref()
        .child('Freezer Bawah')
        .child('${uuid.v4()}.jpg');
    final selaFreezerRef = FirebaseStorage.instance
        .ref()
        .child('Sela Freezer')
        .child('${uuid.v4()}.jpg');
    if (fotoSelaFreezer != null) {
      await selaFreezerRef.putFile(fotoSelaFreezer);
    }

    await ref.putFile(pickedSelfie);
    await farFreezerRef.putFile(farFreezer);
    await openedFreezerRef.putFile(openedFreezer);
    await closedFreezerRef.putFile(closeFreezer);
    await poRef.putFile(po);
    await freezerBawahRef.putFile(freezerBawah);
    await freezerOneref.putFile(freezerOne);
    await freezerTworef.putFile(freezerTwo);
    await freezerThreeref.putFile(freezerThree);
    await freezerIslandOneRef.putFile(freezerIslandOne);
    await freezerIslandTwoRef.putFile(freezerIslandTwo);
    await freezerIslandThreeRef.putFile(freezerIslandThree);
    await popRef.putFile(fotoPop);
    await peralatanRef.putFile(fotoPeralatan);

    final url = await ref.getDownloadURL();
    final farFreezerUrl = await farFreezerRef.getDownloadURL();
    final openedFreezerUrl = await openedFreezerRef.getDownloadURL();
    final closedFreezerUrl = await closedFreezerRef.getDownloadURL();
    final poUrl = await poRef.getDownloadURL();
    final freezerBawahUrl = await freezerBawahRef.getDownloadURL();
    final selaFreezerUrl = await selaFreezerRef.getDownloadURL();
    final freezerOneUrl = await freezerOneref.getDownloadURL();
    final freezerTwoUrl = await freezerTworef.getDownloadURL();
    final freezerThreeUrl = await freezerThreeref.getDownloadURL();
    final freezerIslandOneUrl = await freezerIslandOneRef.getDownloadURL();
    final freezerIslandTwoUrl = await freezerIslandTwoRef.getDownloadURL();
    final freezerIslandThreeUrl = await freezerIslandThreeRef.getDownloadURL();
    final fotoPopUrl = await popRef.getDownloadURL();
    final fotoPeralatanUrl = await peralatanRef.getDownloadURL();

    final documentReference = FirebaseFirestore.instance
        .collection('forms')
        .doc(uid)
        .collection('form')
        .doc(id);

    FirebaseFirestore.instance.runTransaction((transaction) async {
      final snapshot = await transaction.get(documentReference);
      if (!snapshot.exists) {
        final res = result.data();
        documentReference.set({
          'id': id,
          'Nama Distributor': (res != null) ? (res)['username'] : "",
          'Nama Toko': storeName,
          'Kode Toko': kodeToko,
          'Jumlah PO': jumlahPo,
          'Jumlah Item Terdisplay': jumlahItemTerdisplay,
          'Saran dan Kendala': saranDanKendala,
          'Produk Retur': produkRetur,
          'Pilihan Toko': pilihanToko,
          'Kualitas Produk': kualitasProduk,
          'Sticker Freezer': stickerFreezer,
          'Papan Harga': papanHarga,
          'Divider Kulkas': dividerKulkas,
          'Label Harga': labelHarga,
          'Wobler Promo': woblerPromo,
          'Spanduk': spanduk,
          'Produk Promosi': produkPromosi,
          'Kategori Freezer': kategoriFreezer,
          'Kebersihan Bunga Es': kebersihanBungaEs,
          'Kepenuhan Freezer Atas': kepenuhanFreezerAtas,
          'Kebersihan Debu Freezer': debuFreezer,
          'Kebersihan Lem Freezer': bekasLemFreezer,
          'Brand Lain': brandLain,
          'Stock Brand Lain': stockBrandLain,
          'Stock Dibawah Freezer': stockDibawahFreezer,
          'Posisi Freezer': posisiFreezer,
          'Foto Selfie': url,
          'Foto Kulkas Dari Jauh': farFreezerUrl,
          'Foto Kulkas Terbuka': openedFreezerUrl,
          'Foto Kulkas Tertutup': closedFreezerUrl,
          'Foto PO': poUrl,
          'Foto Freezer Bawah': freezerBawahUrl,
          "Foto Sela Freezer": selaFreezerUrl,
          "Foto Freezer One": freezerOneUrl,
          "Foto Freezer Two": freezerTwoUrl,
          "Foto Freezer Three": freezerThreeUrl,
          "Foto Freezer Island 1": freezerIslandOneUrl,
          "Foto Freezer Island 2": freezerIslandTwoUrl,
          "Foto Freezer Island 3": freezerIslandThreeUrl,
          "Foto Pop": fotoPopUrl,
          "Foto Peralatan": fotoPeralatanUrl,
          'Created At': FieldValue.serverTimestamp(),
        });
        return true;
      }

      return true;
    });
    return true;
  } catch (e) {
    return false;
  }
}

Future<String> getUserName() async {
  final users = FirebaseFirestore.instance.collection('users');

  final uid = FirebaseAuth.instance.currentUser?.uid;

  final result = await users.doc(uid).get();
  final a = result.data();
  if (a != null) {
    return (a)["username"];
  }
  return "";
}

Future<void> signOut() async {
  try {
    await FirebaseAuth.instance.signOut();
  } catch (e) {
    print(e);
  }
}
