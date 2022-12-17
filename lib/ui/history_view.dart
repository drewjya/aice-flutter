import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './saleslist.dart';

class History extends StatelessWidget {
  static final f = DateFormat('dd-MM-yyyy / hh:mm');
  static final DateTime now = DateTime.now();

  static final DateTime today = DateTime(now.year, now.month, now.day);
  static final DateTime lastweek = DateTime(now.year, now.month, now.day - 7);

  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance
              .collection('forms')
              .doc(FirebaseAuth.instance.currentUser?.uid)
              .collection('form')
              .orderBy("Created At", descending: true)
              .where("Created At", isGreaterThanOrEqualTo: lastweek)
              .where("Created At", isLessThanOrEqualTo: now)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            return Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: const <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 10.0, left: 20),
                      child: Text(
                        '1 Minggu Terakhir',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 23),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data?.docs.length ?? 0,
                    itemBuilder: (context, index) {
                      final a = snapshot.data?.docs[index].data();
                      return SalesLists(
                        namaToko: snapshot.data?.docs[index].data()['Nama Toko'],
                        kodeToko: snapshot.data?.docs[index].data()['Kode Toko'],
                        createdAt: f.format(snapshot.data?.docs[index]
                            .data()['Created At']
                            .toDate()),
                        id: snapshot.data?.docs[index].data()['id'],
                      );
                    },
                  ),
                ),
              ],
            );
          }),
    );
  }
}
