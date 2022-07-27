class ProductStoreModel{
  String? name;
  String? descirption;
  String? category;
  String? location;
  int? quantity;
  double? price;

  ProductStoreModel(this.name, this.descirption,this.category,this.quantity,this.price,this.location);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['quantity'] = quantity;
    data['price'] = price;
    data['descirption'] = descirption;
    data['category'] = category;
    data['location'] = location;
    return data;
  }
}