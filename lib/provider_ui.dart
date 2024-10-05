import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgets_responsive/global_data_screen.dart';
import 'package:widgets_responsive/list_map_provider.dart';
import 'package:widgets_responsive/settings.dart';

class ProviderUiListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('providerList'),
        actions: [
          PopupMenuButton(itemBuilder: (_) {
            return [
              PopupMenuItem(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingsPage()),
                    );
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.settings),
                      SizedBox(
                        width: 11,
                      ),
                      Text("Settings"),
                    ],
                  ))
            ];
          })
        ],
      ),
      body: Consumer<ListMapProvider>(
        builder: (ctx, provider, __) {
          var allData = provider.getData();
          return allData.isNotEmpty
              ? ListView.builder(
                  itemCount: allData.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                        title: Text('${allData[index]['tittle']}'),
                        subtitle: Text('${allData[index]['mobile']}'),
                        trailing: SizedBox(
                          width: 120,
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  context.read<ListMapProvider>().updateData({
                                    "tittle": "hii name is change ",
                                    "mobile": "0000000",
                                  }, index);
                                },
                                icon: const Icon(Icons.edit),
                              ),
                              IconButton(
                                onPressed: () {
                                  context
                                      .read<ListMapProvider>()
                                      .deleteData(index);
                                },
                                icon: const Icon(Icons.delete),
                              ),
                            ],
                          ),
                        ));
                  },
                )
              : const Center(
                  child: Text('No contacts found'),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const GlobalDataScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
