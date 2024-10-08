// import 'package:flutter/material.dart';
// import 'package:widgets_responsive/local_database/product_local/db_productMethod.dart';
// import 'package:widgets_responsive/local_database/product_local/product_model.dart';
// import 'package:widgets_responsive/local_database/product_local/string_product_constant.dart';
// import 'package:widgets_responsive/local_database/string_constant.dart';

// class ProductListScreen extends StatefulWidget {
//   ProductListScreen({super.key});

//   @override
//   _ProductListScreenState createState() => _ProductListScreenState();
// }

// class _ProductListScreenState extends State<ProductListScreen> {
//   late DbProduct productDbService;

//   Future<void> _initializeDb() async {
//     productDbService = await DbProduct.create();
//     _getUsers();
//   }

//   List<ProductModel> _product = [];

//   @override
//   void initState() {
//     super.initState();
//     _initializeDb();
//   }

//   Future<void> _getUsers() async {
//     final product =
//         await productDbService.fetchData(TextConstantsProduct.productTable);
//     setState(() {
//       _product = product;
//     });
//   }

//   Future<void> _deleteUser(ProductModel product) async {
//     await productDbService.deleteData(product);
//     _getUsers();
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('${product.name} deleted')),
//     );
//   }

//   Future<void> _editProduct(ProductModel product) async {
//     final editedProduct = await Navigator.push<ProductModel>(
//       context,
//       MaterialPageRoute(
//         builder: (context) => EditProductScreen(product: product),
//       ),
//     );

//     if (editedProduct != null) {
//       await productDbService.update(editedProduct); // Update the database
//       _getUsers(); // Refresh the list
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('${editedProduct.name} updated')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Product list"),
//       ),
//       body: _product.isEmpty
//           ? const Center(child: Text(TextConstantsList.noUsersFound))
//           : ListView.builder(
//               itemCount: _product.length,
//               itemBuilder: (context, index) {
//                 final product = _product[index];
//                 return Dismissible(
//                   key: Key(product.id.toString()),
//                   background: Container(
//                     color: Colors.red,
//                     alignment: Alignment.centerRight,
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: const Icon(Icons.delete, color: Colors.white),
//                   ),
//                   direction: DismissDirection.endToStart,
//                   onDismissed: (direction) {
//                     _deleteUser(product);
//                   },
//                   child: ListTile(
//                     title: Text(product.name),
//                     subtitle: Text('Desc: ${product.description}'),
//                     trailing: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         IconButton(
//                           icon: const Icon(Icons.edit, color: Colors.blue),
//                           onPressed: () => _editProduct(
//                               product), // Edit product on icon press
//                         ),
//                         IconButton(
//                           icon: const Icon(Icons.delete, color: Colors.red),
//                           onPressed: () => _deleteUser(
//                               product), // Delete product on icon press
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:widgets_responsive/local_database/product_local/db_productMethod.dart';
import 'package:widgets_responsive/local_database/product_local/product/product_edit_widget.dart';
import 'package:widgets_responsive/local_database/product_local/product_model.dart';
import 'package:widgets_responsive/local_database/product_local/string_product_constant.dart';
import 'package:widgets_responsive/local_database/string_constant.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  late DbProduct productDbService;

  Future<void> _initializeDb() async {
    productDbService = await DbProduct.create();
    _getProduct();
  }

  Future<void> _getProduct() async {
    final product =
        await productDbService.fetchData(TextConstantsProduct.productTable);
    setState(() {
      _product = product;
    });
  }

  Future<void> _deleteProduct(ProductModel product) async {
    await productDbService.deleteData(product);
    _getProduct();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('${product.name} deleted')));
  }

  List<ProductModel> _product = [];

  @override
  void initState() {
    super.initState();
    _initializeDb();
  }

  Future<void> _editProduct(ProductModel product) async {
    final editedProduct = await Navigator.push<ProductModel>(
        context,
        MaterialPageRoute(
            builder: (context) => EditProductScreen(
                  product: product,
                )));

    if (editedProduct != null) {
      await productDbService.update(editedProduct);
      _getProduct();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${editedProduct.name} updated')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product List"),
      ),
      body: _product.isEmpty
          ? const Center(
              child: Text(TextConstantsList.noUsersFound),
            )
          : ListView.builder(
              itemCount: _product.length,
              itemBuilder: (context, index) {
                final product = _product[index];

                return Dismissible(
                    key: Key(product.id.toString()),
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {},
                    child: ListTile(
                      title: Text(product.name),
                      subtitle: Text('Desc: ${product.description}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              icon: const Icon(Icons.edit, color: Colors.blue),
                              onPressed: () {
                                _editProduct(product);
                              }),
                          IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                _deleteProduct(product);
                              }),
                        ],
                      ),
                    ));
              },
            ),
    );
  }
}
