import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgets_responsive/provider_class.dart';

class ProviderConcept extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("hiiiiiii");
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(child: Consumer<ConterProvider>(
        builder: (ctx, _, __) {
          print("bmnnbbbbb");
          return Text(
            '${Provider.of<ConterProvider>(ctx, listen: true).getCount()}',
            style: TextStyle(fontSize: 30),
          );
        },
      )),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Provider.of<ConterProvider>(context, listen: false).incrementCount();
      }),
    );
  }
}
