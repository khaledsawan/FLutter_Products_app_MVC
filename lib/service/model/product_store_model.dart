class ProductStoreModel{
  String? name;
  String? descirption;
  String? category;
  String? location;
  String? image;
  int? quantity;
  double? price;

  ProductStoreModel(this.name, this.descirption,this.category,this.quantity,this.price,this.location,this.image);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['quantity'] = quantity;
    data['image'] = image;
    data['price'] = price;
    data['descirption'] = descirption;
    data['category'] = category;
    data['location'] = location;
    return data;
  }
}