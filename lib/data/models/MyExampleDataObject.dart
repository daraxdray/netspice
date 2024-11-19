class MyExampleDataObject {
  String name;
  String description;
  String imageUrl;

  MyExampleDataObject({required this.name, required this.description, required this.imageUrl});

  factory MyExampleDataObject.fromJson(Map<String, dynamic> json) {
    return MyExampleDataObject(
      name: json['name'],
      description: json['description'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
    };
  }
}
