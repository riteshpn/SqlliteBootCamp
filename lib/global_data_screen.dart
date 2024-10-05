import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgets_responsive/list_map_provider.dart';

class GlobalDataScreen extends StatelessWidget {
  const GlobalDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Note'),
      ),
      body: Center(
        child: IconButton(
            onPressed: () {
              context.read<ListMapProvider>().addData({
                "tittle": "my name ",
                "mobile": "888888888",
              });
            },
            icon: Icon(Icons.add)),
      ),
    );
  }
}
