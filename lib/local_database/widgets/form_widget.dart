import 'package:flutter/material.dart';
import 'package:widgets_responsive/local_database/local_screen.dart';
import 'package:widgets_responsive/local_database/loclal_data.dart';
import 'package:widgets_responsive/local_database/string_constant.dart';
import 'package:widgets_responsive/local_database/user_db_service.dart';
import 'package:widgets_responsive/local_database/validation_helper.dart';

class UserForm extends StatefulWidget {
  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  late UserDbMethods userDbService;

  @override
  void initState() {
    super.initState();
    _initializeDb(); // Call the async method without awaiting
  }

  Future<void> _initializeDb() async {
    userDbService = await UserDbMethods.create();

    // Define your columns
    Map<String, String> columns = {
      'id': 'INTEGER PRIMARY KEY AUTOINCREMENT',
      'name': 'TEXT',
      'age': 'INTEGER',
    };

    // Call createTable
    await userDbService.createTable(columns);
    _clearFields();
  }

  void _clearFields() {
    _nameController.clear();
    _ageController.clear();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  Future<void> _saveUser() async {
    if (_formKey.currentState?.validate() == true) {
      String name = _nameController.text;
      String age = _ageController.text;

      var user = UserModel(
          name: name, age: int.tryParse(age) ?? 0); // Convert age to integer
      await userDbService.insertData(user);

      _clearFields();

      // Navigate to UserListScreen after saving the user
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => UserListScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _nameController,
            decoration:
                const InputDecoration(labelText: StringConstants.nameLabel),
            validator: ValidationHelper.validateName,
          ),
          TextFormField(
            controller: _ageController,
            keyboardType: TextInputType.number,
            decoration:
                const InputDecoration(labelText: StringConstants.ageLabel),
            validator: ValidationHelper.validateAge,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _saveUser,
            child: const Text(StringConstants.saveButton),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserListScreen(),
                ),
              );
            },
            child: const Text('Go to User List'),
          ),
        ],
      ),
    );
  }
}
