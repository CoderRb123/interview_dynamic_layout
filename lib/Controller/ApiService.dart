import 'package:dio/dio.dart';
import 'package:interview_dynamic_layout/Model/AppModel.dart';

class ApiService {
  Dio? _dio;

  ApiService() {
    _dio = Dio();
  }

  Future<AppModel> fetchAppData(String url) async {
    try {
      Response response = await _dio!.get(url);
      if (response.statusCode == 200) {
        return AppModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load app data');
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to load app data');
    }
  }
}
