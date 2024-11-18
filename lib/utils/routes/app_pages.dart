import 'package:get/get.dart';
import 'package:task_userlist/controller/controller.dart';
import 'package:task_userlist/utils/utils.dart';
import 'package:task_userlist/view/view.dart';

class AppPages {
  static var transitionDuration = const Duration(
    milliseconds: 350,
  );

  static const initial = RoutesName.splash;

  static final pages = [
    GetPage<SplashView>(
      name: RoutesName.splash,
      transitionDuration: transitionDuration,
      page: SplashView.new,
    ),
    GetPage<UserListView>(
      name: RoutesName.userListView,
      transitionDuration: transitionDuration,
      page: UserListView.new,
      binding: UserBinding(),
    ),
    GetPage<UserDetails>(
      name: RoutesName.userDetails,
      transitionDuration: transitionDuration,
      page: () => UserDetails(user: Get.arguments),
    ),
  ];
}
