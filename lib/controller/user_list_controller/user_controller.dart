import 'dart:developer';

import 'package:get/get.dart';
import 'package:task_userlist/model/model.dart';

import 'package:task_userlist/view_model/view_model.dart';

class UserController extends GetxController {
  final UserListViewModel _listViewModel;
  UserController(this._listViewModel);

  List<UserModel> users = [];
  List<UserModel> filteredUsers = [];
  String searchQuery = '';

  var isLoading = true;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    try {
      isLoading = true;
      update(['user-list']);
      final res = await _listViewModel.getUsers();
      isLoading = false;
      if (res.isNotEmpty) {
        log(" ___ ${res.toString()}");
        users = res;
        filteredUsers = users;
      } else {
        Get.snackbar('Error', 'Failed to fetch users');
        isLoading = false;
      }
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong: $e');
      isLoading = false;
    }
    update(['user-list']);
  }

  void updateSearchQuery(String query) {
    searchQuery = query;
    filterUsers();
  }

  void filterUsers() {
    if (searchQuery.isEmpty) {
      filteredUsers = users;
    } else {
      filteredUsers = users.where((user) {
        final name = user.name?.toLowerCase() ?? '';
        final username = user.username?.toLowerCase() ?? '';
        final email = user.email?.toLowerCase() ?? '';
        return name.contains(searchQuery.toLowerCase()) ||
            username.contains(searchQuery.toLowerCase()) ||
            email.contains(searchQuery.toLowerCase());
      }).toList();
    }
    update(['user-list']);
  }
}
