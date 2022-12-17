import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './saleslist.dart';
import './usernamecard.dart';
import '../net/flutterfire.dart';

class FeedWidget extends StatelessWidget {
  static final f = DateFormat('dd-MM-yyyy / hh:mm');

  static final DateTime now = DateTime.now();
  static final DateTime today = DateTime(now.year, now.month, now.day);
  static final DateTime tomorrow = DateTime(now.year, now.month, now.day + 1);
  //static final String dt = DateFormat('dd mm yyyy').format(date);
  const FeedWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const SizedBox(
          height: 50,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: FutureBuilder(
            future: getUserName(),
            builder: (_, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              return UsernameCard(
                snapshot: snapshot.data.toString(),
              );
            },
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.7,
          child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance
                  .collection('forms')
                  .doc(FirebaseAuth.instance.currentUser?.uid)
                  .collection("form")
                  .orderBy("Created At", descending: true)
                  .where("Created At", isGreaterThanOrEqualTo: today)
                  .where("Created At", isLessThanOrEqualTo: tomorrow)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                return Column(
                  children: [
                    Row(
                      children: <Widget>[
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0, left: 20),
                          child: Text(
                            'Sales Today',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 23),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0, left: 20),
                          child: Text(
                            "${snapshot.data?.docs.length} / 20",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 9),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data?.docs.length,
                        itemBuilder: (context, index) {
                          return SalesLists(
                              namaToko: snapshot.data?.docs[index]
                                  .data()['Nama Toko'],
                              kodeToko: snapshot.data?.docs[index]
                                  .data()['Kode Toko'],
                              createdAt: f.format(snapshot.data?.docs[index]
                                  .data()['Created At']
                                  .toDate()),
                              id: snapshot.data?.docs[index].data()['id']);
                        },
                      ),
                    ),
                  ],
                );
              }),
        )
      ],
    );
  }
}
