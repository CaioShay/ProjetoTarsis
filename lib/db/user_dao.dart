import 'package:dio/dio.dart';

class UserDao {
  final Dio dio = Dio();

  Future<bool> login(String username, String password) async {
    try {
      final response = await dio.get(
        'https://my-json-server.typicode.com/CaioShay/FakeApi',
      );

      final data = response.data;
      final List accounts = data['accounts'] ?? [];

      // .any() retorna true se encontrar pelo menos um elemento correspondente, ou false caso contrário.
      return accounts.any(
            (account) =>
        account['username'] == username &&
            account['password'] == password,
      );
    } catch (e) {
      // Caso ocorra algum erro na requisição ou estrutura dos dados, retorna false com segurança.
      return false;
    }
  }
}