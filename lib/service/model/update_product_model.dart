class UpdateProductModel{
  int? quantity;
  int? id;
  String? location;
  double? price;
  String? description;
  String? category;

  UpdateProductModel(this.id,this.category,this.location,this.price,this.quantity,this.description);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['quantity'] = quantity;
    data['location'] = location;
    data['price'] = price;
    data['description'] = description;
    data['category'] = category;
    return data;
  }
}