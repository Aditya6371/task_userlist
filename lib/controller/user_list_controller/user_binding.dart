import 'package:get/get.dart';
import 'package:task_userlist/controller/controller.dart';
import 'package:task_userlist/respository/repository.dart';
import 'package:task_userlist/view_model/user_list_view_model.dart';

class UserBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => UserController(
        UserListViewModel(
          UserListRepo(),
        ),
      ),
    );
  }
}
