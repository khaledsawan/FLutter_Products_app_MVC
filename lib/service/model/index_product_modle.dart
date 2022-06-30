class IndexProductModel {
  int id;
  String name;
  int quantity;
  int view;
  int price;
  String image;
  String category;
  String discrption;
  String location;
  IndexProductModel(
      {required this.id,
      required this.location,
      required this.name,
      required this.category,
      required this.discrption,
      required this.image,
      required this.price,
      required this.quantity,
      required this.view});

}
