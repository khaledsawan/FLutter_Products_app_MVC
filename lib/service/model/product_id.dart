class ProductId{
  int? id;
  ProductId({this.id});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id']=this.id;
    return data;
  }
}