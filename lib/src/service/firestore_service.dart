import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final db = FirebaseFirestore.instance;
  Future<DocumentSnapshot<Map<String, dynamic>>> retrieveCollections() async {
    return await db.collection('forms').doc("00MfZZ1s4CYWH0cjlNpUzP4iQ262").get();
  }
}
