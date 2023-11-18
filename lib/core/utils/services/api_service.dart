import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio();

  Future<Response> post({
    required String url,
    required body,
    required String token,
    String? contentType,
    Map<String, String>? headers,
  }) async {
    final response = await dio.post(
      url,
      data: body,
      options: Options(
        headers: headers ??
            {
              "Authorization": "Bearer $token",
              "Content-Type": contentType,
            },
      ),
    );
    return response;
  }
}
