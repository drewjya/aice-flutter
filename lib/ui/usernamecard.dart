import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import './authentication.dart';
import '../net/flutterfire.dart';

class UsernameCard extends StatelessWidget {
  final String snapshot;
  const UsernameCard({
    Key? key,
    required this.snapshot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
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
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(255, 150, 113, 1),
                        blurRadius: 12,
                        offset: Offset(0, 6),
                      ),
                    ],
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
                              snapshot,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                              ),
                            ),
                            Row(
                              children: const <Widget>[
                                Icon(
                                  Icons.card_travel,
                                  color: Colors.white,
                                  size: 16,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Flexible(
                                  child: Text(
                                    "Sales",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            InkWell(
                              onTap: () {
                                signOut();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const Authentication(),
                                  ),
                                );
                              },
                              child: Row(
                                children: const <Widget>[
                                  Icon(
                                    Icons.logout,
                                    color: Colors.white70,
                                    size: 12,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Flexible(
                                    child: Text(
                                      "Logout",
                                      style: TextStyle(
                                          color: Colors.white70, fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
