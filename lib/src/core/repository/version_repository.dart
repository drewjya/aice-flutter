// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:aice/src/src.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class VersionRepository {
  Future<VersionModel> getVersionModel();
}

class VersionRepositoryImpl implements VersionRepository {
  final ApiRequest req;
  VersionRepositoryImpl({
    required this.req,
  });
  @override
  Future<VersionModel> getVersionModel() async {
    try {
      final res = await req.get(
        url: ApiUrl.versi,
        fromJson: (p0) => VersionModel.fromMap(p0),
      );
      return res!;
    } catch (e) {
      rethrow;
    }
  }
}

final versionRepositoryProvider = Provider<VersionRepository>((ref) {
  return VersionRepositoryImpl(req: ref.read(requestProvider));
});
