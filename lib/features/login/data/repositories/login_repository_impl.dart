
import 'package:http/http.dart' as http;

import '../../../../network/network_api_services.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final String baseUrl;

  LoginRepositoryImpl({required this.baseUrl});

  @override
  Future<bool> loginUser(User? user) async {
    final networkApiService = NetworkApiServices();
    final response = await networkApiService.postApi(url: baseUrl, data: {});
    return true;
  }
}
