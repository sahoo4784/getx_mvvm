abstract class BaseApiServices {
  Future<dynamic> getApi({required String? url});

  Future<dynamic> postApi({required String? url, var data});
}
