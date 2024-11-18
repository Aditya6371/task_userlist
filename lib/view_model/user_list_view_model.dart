import 'dart:developer';
import 'package:task_userlist/model/model.dart';
import 'package:task_userlist/respository/repository.dart';

class UserListViewModel {
  final UserListRepo _userListRepo;
  UserListViewModel(this._userListRepo);

  Future<List<UserModel>> getUsers() async {
    try {
      final res = await _userListRepo.getUserList();
      if (res is List) {
        return Future.value(
          res.map((json) => UserModel.fromJson(json)).toList(),
        );
      } else {
        throw Exception("Unexpected response format: ${res.runtimeType}");
      }
    } catch (e) {
      log("Exception caught: $e");
      return [];
    }
  }
}
