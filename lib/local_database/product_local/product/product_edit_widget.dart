import 'package:flutter/material.dart';
import 'package:widgets_responsive/local_database/product_local/product_model.dart';

class EditProductScreen extends StatefulWidget {
  final ProductModel product;

  EditProductScreen({Key? key, required this.product}) : super(key: key);

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.product.name);
    _descriptionController =
        TextEditingController(text: widget.product.description);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _saveChanges() {
    final editedProduct = ProductModel(
      id: widget.product.id,
      name: _nameController.text,
      price:
          widget.product.price, 
      description: _descriptionController.text,
    );

    Navigator.pop(
        context, editedProduct);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveChanges,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Product Name'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveChanges,
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:widgets_responsive/local_database/product_local/product_model.dart';

// class EditProductScreen extends StatefulWidget {
//   final ProductModel productModel;
//   const EditProductScreen({super.key, required this.productModel});

//   @override
//   State<EditProductScreen> createState() => _EditProductScreenState();
// }

// class _EditProductScreenState extends State<EditProductScreen> {
//   TextEditingController _nameController = TextEditingController();
//   TextEditingController _descController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _nameController = TextEditingController(text: widget.productModel.name);
//     _descController =
//         TextEditingController(text: widget.productModel.description);
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _nameController.dispose();
//     _descController.dispose();
//   }

//   saveUpdate() {
//     final editProducts = ProductModel(
//         name: widget.productModel.name,
//         price: widget.productModel.price,
//         description: widget.productModel.description);

//     Navigator.pop(context, editProducts);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Edit Product'),
//         actions: [
//           IconButton(icon: Icon(Icons.save), onPressed: saveUpdate),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _nameController,
//               decoration: InputDecoration(labelText: 'Product Name'),
//             ),
//             TextField(
//               controller: _descController,
//               decoration: InputDecoration(labelText: 'Description'),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: saveUpdate,
//               child: Text('Save Changes'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
