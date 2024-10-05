class UserModel {
  final int? id;
  final String name;
  final int age;

  UserModel({this.id, required this.name, required this.age});

  // Convert a UserModel object into a Map object
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }

  // Convert a Map object into a UserModel object
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      age: map['age'],
    );
  }
}
