import 'package:aice/src/provider/collections_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AdminView extends ConsumerWidget {
  const AdminView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: ref.watch(collectionProvider).maybeWhen(
        orElse: () {
          return const Text("AYan");
        },
        data: (data) {
          return Text(data.data().toString());
        },
      ),
    );
  }
}
