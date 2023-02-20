import 'package:aice/src/src.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CartWidget extends StatelessWidget {
  final AuthModel auth;
  const CartWidget({
    Key? key,
    required this.auth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Stack(
              children: <Widget>[
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    gradient: const LinearGradient(colors: [
                      Color.fromRGBO(255, 111, 145, 1),
                      Color.fromRGBO(255, 150, 113, 1)
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  ),
                ),
                Positioned.fill(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: SvgPicture.asset(
                          'assets/user.svg',
                          height: 64,
                          width: 64,
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              auth.name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                const Icon(
                                  Icons.card_travel,
                                  color: Colors.white,
                                  size: 16,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Flexible(
                                  child: Text(
                                    auth.jenisAkun,
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Consumer(builder: (context, ref, child) {
                              return InkWell(
                                onTap: () async {
                                  ref.read(authProvider.notifier).logOut();
                                  Navigator.pushReplacementNamed(
                                      context, LoginView.routeName);
                                },
                                child: Row(children: <Widget>[
                                  const Icon(
                                    Icons.logout,
                                    color: Colors.white70,
                                    size: 12,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  const Flexible(
                                    child: Text(
                                      "Logout",
                                      style: TextStyle(
                                          color: Colors.white70, fontSize: 12),
                                    ),
                                  ),
                                  if (auth.jenisAkun == "Admin") ...[
                                    const SizedBox(
                                      width: 40,
                                    ),
                                    ElevatedButton(
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return HookBuilder(
                                                    builder: (context) {
                                                  final key =
                                                      useTextEditingController();
                                                  final docID =
                                                      useTextEditingController();
                                                  final value =
                                                      useTextEditingController();
                                                  final currValue =
                                                      useTextEditingController();
                                                  return Dialog(
                                                    child:
                                                        SingleChildScrollView(
                                                      child: SizedBox(
                                                        height: 500,
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.8,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      15),
                                                          child: Column(
                                                            children: [
                                                              const Center(
                                                                child: Text(
                                                                  "EDIT FIELD",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        40,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                  ),
                                                                ),
                                                              ),
                                                              TextField(
                                                                decoration:
                                                                    const InputDecoration(
                                                                  hintText:
                                                                      "forms/NYwmqBdgGJXyYjp1nkt82LusssxnY53/form/",
                                                                  labelText:
                                                                      "Doc ID",
                                                                ),
                                                                minLines: 2,
                                                                maxLines: 5,
                                                                controller:
                                                                    docID,
                                                              ),
                                                              TextField(
                                                                decoration:
                                                                    const InputDecoration(
                                                                  hintText:
                                                                      "Key",
                                                                  labelText:
                                                                      "Key",
                                                                ),
                                                                controller: key,
                                                              ),
                                                              TextField(
                                                                controller:
                                                                    value,
                                                                decoration:
                                                                    const InputDecoration(
                                                                  hintText:
                                                                      "Value",
                                                                  labelText:
                                                                      "Value",
                                                                ),
                                                              ),
                                                              TextField(
                                                                controller:
                                                                    currValue,
                                                                decoration:
                                                                    const InputDecoration(
                                                                  hintText:
                                                                      "Curr Value",
                                                                  labelText:
                                                                      "Curr Value",
                                                                ),
                                                              ),
                                                              ElevatedButton(
                                                                  onPressed:
                                                                      () {
                                                                    // FirebaseHelper
                                                                    //     .instance
                                                                    //     .batchUpdate(
                                                                    //         updateCollection: docID
                                                                    //             .text,
                                                                    //         newValue: value
                                                                    //             .text,
                                                                    //         currentValue: currValue
                                                                    //             .text,
                                                                    //         updateField: key
                                                                    //             .text)
                                                                    //     .then((value) =>
                                                                    //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value.toString()))));
                                                                  },
                                                                  child: const Text(
                                                                      "Submit"))
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                });
                                              });
                                        },
                                        child: const Text("EDIT"))
                                  ],
                                ]),
                              );
                            }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
