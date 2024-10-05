// class ProductModel {
//   final String name;
//   final int price;
//   final String description;

//   ProductModel({
//     required this.name,
//     required this.price,
//     required this.description,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'name': name,
//       'price': price,
//       'description': description,
//     };
//   }

//   factory ProductModel.fromMap(Map<String, dynamic> map) {
//     return ProductModel(
//       name: map['name'],
//       price: map['price'],
//       description: map['description'],
//     );
//   }
// }
class ProductModel {
  final int? id;
  final String name;
  final int price;
  final String description;

  ProductModel({
    this.id,
    required this.name,
    required this.price,
    required this.description,
  });

  // Convert ProductModel to a map (for insertion and updates in the database)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
    };
  }

  // Convert map to ProductModel
  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      name: map['name'],
      price: map['price'],
      description: map['description'],
    );
  }
}
