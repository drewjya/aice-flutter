import 'dart:convert';

import 'package:aice/src/src.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

class ApiRequest {
  Future<T?> get<T>(
      {required String url, required TFromJsonBuilder<T> fromJson}) async {
    final token = SharedPrefs.getSession();
    if (token == null) {
      throw ErrorValue(
          status: ApiFailure.unauthorized, message: "Tidak ada token");
    }
    dPrint(Uri.parse(url));
    final req =
        await http.get(Uri.parse(url), headers: {'Authorization': token});

    final status = req.statusCode;
    dPrint(req.body);
    dPrint(status <= 300);

    final dto = ApiDTO<T>.fromMap(jsonDecode(req.body), fromJson, status);
    if (status <= 300) {
      return dto.data;
    }
    dPrint("Masuk");
    throw dto.error!;
  }

  Future<List<T>?> getList<T>(
      {required String url, required TFromJsonBuilder<T> fromJson}) async {
    final token = SharedPrefs.getSession();
    if (token == null) {
      throw ErrorValue(
          status: ApiFailure.unauthorized, message: "Tidak ada token");
    }
    dPrint(Uri.parse(url));
    final req =
        await http.get(Uri.parse(url), headers: {'Authorization': token});

    final status = req.statusCode;
    dPrint(req.body);
    dPrint(status <= 300);

    final dto = ApiDTO<T>.fromMap(jsonDecode(req.body), fromJson, status);
    if (status <= 300) {
      return dto.dataList;
    }
    dPrint("Masuk");
    throw dto.error!;
  }

  Future<T?> post<T>(
      {required String url,
      required Map<String, dynamic>? body,
      required TFromJsonBuilder<T> fromJson,
      bool auth = false}) async {
    try {
      final token = SharedPrefs.getSession();
      if (token == null && !auth) {
        throw ErrorValue(
            status: ApiFailure.unauthorized, message: "Session Sudah Habis");
      }
      final req = await http.post(Uri.parse(url),
          headers: {'Authorization': token ?? ""}, body: body);
      final status = req.statusCode;

      final dto = ApiDTO<T>.fromMap(jsonDecode(req.body), fromJson, status);
      
      if (status <= 300) {
        return dto.data;
      }
      throw dto.error!;
    } catch (e) {
      rethrow;
    }
  }
}

final requestProvider = Provider<ApiRequest>((ref) {
  return ApiRequest();
});
