import 'dart:async';

import 'package:aice/src/core/model/version_model.dart';
import 'package:aice/src/core/repository/version_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class VersionNotifier extends AsyncNotifier<VersionModel> {
  @override
  FutureOr<VersionModel> build() async {
    return ref.read(versionRepositoryProvider).getVersionModel();
  }
}

final versionProvider =
    AsyncNotifierProvider<VersionNotifier, VersionModel>(VersionNotifier.new);
