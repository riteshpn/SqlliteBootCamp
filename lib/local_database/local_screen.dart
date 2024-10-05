import 'package:flutter/material.dart';
import 'package:widgets_responsive/local_database/string_constant.dart';

import 'loclal_data.dart'; // Assuming this is your UserModel file // Import the constants file
import 'user_db_service.dart';

class UserListScreen extends StatefulWidget {
  UserListScreen({super.key});

  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  late UserDbMethods userDbService;

  Future<void> _initializeDb() async {
    userDbService = await UserDbMethods.create();

    _getUsers();
  }

  List<UserModel> _users = [];

  @override
  void initState() {
    super.initState();
    _initializeDb();
  }

  Future<void> _getUsers() async {
    final users = await userDbService.fetchData(TextConstants.userTable);
    setState(() {
      _users = users;
    });
  }

  Future<void> _deleteUser(UserModel user) async {
    await userDbService.deleteData(user);
    _getUsers();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${user.name} deleted')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(TextConstantsList.userListTitle),
      ),
      body: _users.isEmpty
          ? const Center(child: Text(TextConstantsList.noUsersFound))
          : ListView.builder(
              itemCount: _users.length,
              itemBuilder: (context, index) {
                final user = _users[index];
                return Dismissible(
                  key: Key(user.id.toString()),
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    _deleteUser(user);
                  },
                  child: ListTile(
                    title: Text(user.name),
                    subtitle: Text('Age: ${user.age}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () =>
                          _deleteUser(user), // Delete user on icon press
                    ),
                  ),
                );
              },
            ),
    );
  }
}
