import 'package:aice/src/service/firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final collectionProvider =
    FutureProvider<DocumentSnapshot<Map<String, dynamic>>>((ref) async {
  return FirestoreService().retrieveCollections();
});
