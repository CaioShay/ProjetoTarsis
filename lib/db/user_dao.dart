import 'package:dio/dio.dart';

class UserDao{
  final Dio dio = Dio();

  Future<bool> login(String username, String password) async {
    final response = await dio.get(
      'https://my-json-server.typicode.com/CaioShay/FakeApi',
    );

    final data = response.data;

    final accounts = data['accounts'];

    try {
      final account = accounts.firstWhere(
            (account) =>
        account['username'] == username &&
            account['password'] == password,
      );

      return true;
    } catch (e) {
      return false;
    }

  }
}
