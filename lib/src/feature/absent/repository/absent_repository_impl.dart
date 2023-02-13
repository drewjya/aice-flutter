// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:aice/src/feature/absent/model/absensi_detail_model.dart';
import 'package:aice/src/src.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AbsentRepositoryImpl extends AbsentRepository {
  final Ref ref;
  final ApiRequest req;
  AbsentRepositoryImpl({required this.ref, required this.req});
  @override
  Future checkIn({required CheckInModel checkInModel}) async {
    try {
      final res = await req.post(
        url: ApiUrl.postCheckIn,
        body: checkInModel.toMap(),
        fromJson: (p0) => p0,
      );
      return res;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AbsensiModel> getAbsensiToday() async {
    try {
      final res = await req.get(
        url: ApiUrl.getAbsensiToday,
        fromJson: (p0) => AbsensiModel.fromMap(p0),
      );
      dPrint(res);
      return res!;
    } catch (e) {
      rethrow;
    }
  }
  
  @override
  Future postGambar({required FotoDto fotoDto, required int absensiId}) async {
    try {
      final res = await req.sendFile(
          file: fotoDto.foto,
          id: absensiId,
          keteranganFoto: fotoDto.keteranganFoto,
          idParam: "formAbsensiSpgId",
          url: ApiUrl.postImageSpg);
      return res;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future checkOut({required int absensiId}) async {
    try {
      final res = await req.post(
        url: ApiUrl.postCheckOut,
        body: {"absensiSpgId": absensiId.toString()},
        fromJson: (p0) => p0,
      );
      return res;
    } catch (e) {
      rethrow;
    }
  }
  
  @override
  Future postFormAbsensi({required CheckOutModel checkOutModel}) async {
    try {
      final res = await req.post(
        url: ApiUrl.postFormAbsensi,
        body: checkOutModel.toMap(),
        fromJson: (p0) => p0,
      );
      return res;
    } catch (e) {
      rethrow;
    }
  }
  
  @override
  Future<AbsensiDetailModel> getAbsensiDetail() async {
    try {
      final res = await req.get(
        url: ApiUrl.getAbsensiDetailToday,
        fromJson: (p0) => AbsensiDetailModel.fromMap(p0),
      );
      dPrint(res);
      return res!;
    } catch (e) {
      rethrow;
    }
  }
}

final absentRepositoryProvider = Provider<AbsentRepository>((ref) {
  return AbsentRepositoryImpl(ref: ref, req: ref.read(requestProvider));
});
