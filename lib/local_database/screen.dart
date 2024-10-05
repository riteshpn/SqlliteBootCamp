import 'package:flutter/material.dart';
import 'package:widgets_responsive/local_database/string_constant.dart';
import 'package:widgets_responsive/local_database/widgets/form_widget.dart';

class UserFormScreen extends StatelessWidget {
  const UserFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringConstants.addUserTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: UserForm(),
      ),
    );
  }
}
