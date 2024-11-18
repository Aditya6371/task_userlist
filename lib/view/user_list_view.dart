import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_userlist/controller/controller.dart';
import 'package:task_userlist/widgets/widgets.dart';

class UserListView extends StatelessWidget {
  const UserListView({super.key});

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find<UserController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) => userController.updateSearchQuery(value),
              decoration: InputDecoration(
                labelText: 'Search Users',
                hintText: 'Enter name, username, or email',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: GetBuilder<UserController>(
              id: 'user-list',
              builder: (controller) {
                if (controller.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (controller.filteredUsers.isEmpty) {
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: Get.height * .3,
                          width: Get.width * .3,
                          child: Image.asset('assets/nousers.png'),
                        ),
                        const Text(
                          'No users found.',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      ],
                    ),
                  );
                }
                return RefreshIndicator(
                  onRefresh: () async {
                    await userController.fetchUsers();
                  },
                  child: ListView.builder(
                    itemCount: controller.filteredUsers.length,
                    itemBuilder: (context, index) {
                      final user = controller.filteredUsers[index];
                      return UserCard(user: user);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
