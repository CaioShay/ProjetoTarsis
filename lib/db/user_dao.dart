import 'package:dio/dio.dart';

class UserDao {
  final Dio dio = Dio();

  Future<bool> login(String username, String password) async {
    try {
      final response = await dio.get(
        'https://my-json-server.typicode.com/CaioShay/FakeApi/accounts',
      );

      final data = response.data;

      print(data);
      print(data[0]);
      print(data[0]['username']);

      return data.any((account){
        return account['username'] == username && account['password'] == password;
      });
    } catch (e) {
      // Caso ocorra algum erro na requisição ou estrutura dos dados, retorna false com segurança.
      return false;
    }
  }
}