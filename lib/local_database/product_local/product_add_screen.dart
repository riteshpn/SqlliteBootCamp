import 'package:flutter/material.dart';
import 'package:widgets_responsive/local_database/product_local/db_productMethod.dart';
import 'package:widgets_responsive/local_database/product_local/string_product_constant.dart';

class ProductAddScreen extends StatefulWidget {
  const ProductAddScreen({super.key});

  @override
  State<ProductAddScreen> createState() => _ProductAddScreenState();
}

class _ProductAddScreenState extends State<ProductAddScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  late final DbProduct productDbService;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _initializeDb() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringConstantsProduct.addProductTitle),
      ),
    );
  }
}
