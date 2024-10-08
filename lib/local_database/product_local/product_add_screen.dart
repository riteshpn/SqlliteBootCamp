import 'package:flutter/material.dart';
import 'package:widgets_responsive/local_database/local_screen.dart';
import 'package:widgets_responsive/local_database/product_local/db_productMethod.dart';
import 'package:widgets_responsive/local_database/product_local/procuct_list_screen.dart';
import 'package:widgets_responsive/local_database/product_local/product/product_list_ui.dart';
import 'package:widgets_responsive/local_database/product_local/product_model.dart';
import 'package:widgets_responsive/local_database/string_constant.dart';
import 'package:widgets_responsive/local_database/validation_helper.dart';

class ProductAddScreen extends StatefulWidget {
  @override
  _ProductAddScreenState createState() => _ProductAddScreenState();
}

class _ProductAddScreenState extends State<ProductAddScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _poductNameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  late DbProduct productDbService;

  @override
  void initState() {
    super.initState();
    _initializeDb();
  }

  Future<void> _initializeDb() async {
    productDbService = await DbProduct.create();

    // Define your columns
    Map<String, String> columns = {
      'id': 'INTEGER PRIMARY KEY AUTOINCREMENT',
      'product': 'TEXT',
      'price': 'INTEGER',
      'description': 'TEXT',
    };

    // Call createTable
    await productDbService.createTable(columns);
    _clearFields();
  }

  void _clearFields() {
    _poductNameController.clear();
    _priceController.clear();
    _descriptionController.clear();
  }

  @override
  void dispose() {
    _poductNameController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _saveProduct() async {
    if (_formKey.currentState?.validate() == true) {
      String productName = _poductNameController.text;
      String price = _priceController.text;
      String desc = _descriptionController.text;

      var product = ProductModel(
        name: productName,
        price: int.tryParse(price) ?? 0,
        description: desc,
      );
      await productDbService.insertData(product);

      _clearFields();

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductListScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _poductNameController,
              decoration:
                  const InputDecoration(labelText: "product name"),
              validator: ValidationHelper.validateName,
            ),
            TextFormField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              decoration:
                  const InputDecoration(labelText: "price"),
              validator: ValidationHelper.validateAge,
            ),
            TextFormField(
              controller: _descriptionController,
              decoration:
                  const InputDecoration(labelText: "desciption"),
              validator: ValidationHelper.validateName,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveProduct,
              child: const Text("save product"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductListScreen(),
                  ),
                );
              },
              child: const Text('Go to product list'),
            ),
          ],
        ),
      ),
    );
  }
}
