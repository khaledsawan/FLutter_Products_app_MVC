class IndexProductModel {
  bool? success;
  String? message;
   late List<Data> data;
  List<Data> get products=> data;

  IndexProductModel({this.success, this.message,required this.data});

  IndexProductModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['data'] = this.data.map((v) => v.toJson()).toList();
    return data;
  }
}

class Data {
  int? id;
  String? name;
  int? price;
  String? category;
  String? image;
  int? view;
  int? quantity;

  Data({this.id, this.name, this.price, this.category, this.image, this.view,this.quantity});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    category = json['category'];
    image = json['image'];
    view = json['view'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['category'] = this.category;
    data['image'] = this.image;
    data['view'] = this.view;
    data['quantity'] = this.quantity;
    return data;
  }
}
