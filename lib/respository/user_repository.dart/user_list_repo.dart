import 'package:task_userlist/data/data.dart';
import 'package:task_userlist/respository/repository.dart';

class UserListRepo extends UserListRepository {
  @override
  Future<dynamic> getUserList() {
    var headers = {
      'Content-Type': 'application/json',
    };
    return ApiMethods.getApi(ApiEndpoints.baseUrl, headers);
  }
}
