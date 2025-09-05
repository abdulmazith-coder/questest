import 'package:frontend/network/apiclient.dart';

class UserRepository {
  final ApiClient apiClient = ApiClient();

  Future signup({
    required String email,
    required String username,
    required String password,
  }) async {
    final endpoint = 'signup';
    final body = {'email': email, 'username': username, 'password': password};
    final responsed = await apiClient.authData(endpoint, body);
    if (responsed.isNotEmpty) {
      return responsed;
    } else {
      return null;
    }
  }



  Future login({
    required String email,
    required String password,
  }) async {
    final endpoint = 'login';
    final body = {'email': email, 'password': password};
    final responsed = await apiClient.authData(endpoint, body);
    if (responsed.isNotEmpty) {
      return responsed;
    } else {
      return null;
    }
  }




  Future refreshToken({required String refershToken})async{
    final endpoint = 'refresh-token';
    final body = {"refresh_token":refershToken};
    final responsed = await apiClient.authData(endpoint, body);
    if (responsed.isNotEmpty) {
      return responsed;
    } else {
      return null;
    }
  }
}
