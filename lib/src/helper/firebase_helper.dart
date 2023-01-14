import 'package:aice/src/src.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseHelper {
  static final FirebaseHelper instance = FirebaseHelper._internal();

  FirebaseHelper._internal() {
    _firestore = FirebaseFirestore.instance;
  }

  late FirebaseFirestore _firestore;

  Stream<List<T>> firebaseMapper<T>(
      String docId, T Function(Map<String, dynamic>) generator) {
    return _firestore
        .collection(docId)
        .snapshots()
        .map((event) => event.docs.map((e) => generator(e.data())).toList());
  }

  Future<bool> batchUpdate(
      {required String updateCollection,
      required String newValue,
      required String currentValue,
      required String updateField}) async {
    CollectionReference collectionRef = _firestore.collection(updateCollection);

    WriteBatch batch = _firestore.batch();

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
