class CategoryModel {
  String? name;

  CategoryModel({
    required this.name,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
