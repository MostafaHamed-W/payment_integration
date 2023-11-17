import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio();

  Future<Response> post({
    required String url,
    required body,
    required String token,
    String? contentType,
  }) async {
    final response = await dio.post(
      url,
      data: {'amount': 2000, 'currency': 'usd'},
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": contentType,
        },
      ),
    );
    return response;
  }
}
