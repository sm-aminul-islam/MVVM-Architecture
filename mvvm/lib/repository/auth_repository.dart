import 'package:mvvm/data/newtork/BaseAPiServices.dart';
import 'package:mvvm/data/newtork/NetworkApiServices.dart';
import 'package:mvvm/resource/app_url.dart';

class AuthRepository {
  BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiServices(AppUrl.loginEndpoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiServices(AppUrl.registeEndpoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
