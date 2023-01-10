import 'package:aice/src/src.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseHelper {
  static final FirebaseHelper instance = FirebaseHelper._internal();

  FirebaseHelper._internal();

  init(FirebaseFirestore fireStore) {
    _firestore = fireStore;
  }

  late FirebaseFirestore _firestore;

  Stream<List<T>> firebaseMapper<T>(
      String docId, T Function(Map<String, dynamic>) generator) {
    return _firestore
        .collection(docId)
        .snapshots()
        .map((event) => event.docs.map((e) => generator(e.data())).toList());
  }

  updateBatch(
      String docId, String value, String key, BuildContext context) async {
    final batch = _firestore.batch();

// Set the value of 'NYC'
// /forms/NYwmqBdgGJXyYjp1nkt82LuWnY53/form/02488860-8cc4-11ed-b6cd-55433ce58686
    final forms =
        _firestore.collection('forms/NYwmqBdgGJXyYjp1nkt82LuWnY53/form');
    forms.snapshots().map((event) => dPrint(event.docs.map((e) => e.data())));

    batch.update(forms.doc(), {key: value});
    batch.commit().then((_) {
      dPrint("done");
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Done")));
    }, onError: (e) {
      print(e);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    });
  }

  Future<bool> batchUpdate(
    {required String updateCollection,
    required String newValue,
    required String currentValue,
    required String updateField}
  ) async {
    CollectionReference collectionRef =
        FirebaseFirestore.instance.collection(updateCollection);

    WriteBatch batch = FirebaseFirestore.instance.batch();

    dPrint(newValue);
    dPrint(updateField);
    dPrint(currentValue);
    final a = await collectionRef
        .where(updateField, isEqualTo: currentValue)
        .get()
        .then((querySnapshot) async {
      dPrint(querySnapshot.docs.length);
      for (var document in querySnapshot.docs) {
        dPrint(document);
        batch.update(document.reference, {updateField: newValue});
      }

      try {
        await batch.commit();
        return true;
      } catch (e) {
        dPrint(e);
        return false;
      }
    });
    return a;
  }
}
