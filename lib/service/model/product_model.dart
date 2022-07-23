class Product {
  bool? success;
  String? message;
  Item? item;

  Product({this.success, this.message, this.item});

  Product.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    item = json['item'] != null ? new Item.fromJson(json['item']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.item != null) {
      data['item'] = this.item!.toJson();
    }
    return data;
  }
}

class Item {
  int? id;
  int? userId;
  String? name;
  String? descirption;
  String? location;
  String? category;
  int? price;
  int? quantity;
  int? view;
  String? image;
  String? createdAt;
  String? updatedAt;

  Item(
      {this.id,
        this.userId,
        this.name,
        this.descirption,
        this.location,
        this.category,
        this.price,
        this.quantity,
        this.view,
        this.image,
        this.createdAt,
        this.updatedAt});

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    descirption = json['descirption'];
    location = json['location'];
    category = json['category'];
    price = json['price'];
    quantity = json['quantity'];
    view = json['view'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['descirption'] = this.descirption;
    data['location'] = this.location;
    data['category'] = this.category;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['view'] = this.view;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}