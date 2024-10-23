
import '../entities/user.dart';

abstract class LoginRepository {
  Future<bool> loginUser(User user);
}
