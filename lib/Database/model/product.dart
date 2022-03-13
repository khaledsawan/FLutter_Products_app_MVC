

class Product {
  int? id;
  int? author_id;
  String? name;
  String? category_id;
  String? image;
  String? common_info;
  String? price;
  String? exp_date;
  int? quantity;
  String? phone_number;
  int? date_one;
  int? date_two;
  int? date_three;
  int? likes_count;
  int? dis_one;
  int? dis_two;
  int? dis_three;
  bool? meLike;

  Product({
    required this.id,
    required this.author_id,
    required this.name,
    required this.price,
    required this.image,
    required this.category_id,
    required this.phone_number,
    required this.exp_date,
    required this.quantity,
    required this.date_one,
    required this.date_two,
    required this.date_three,
    required this.likes_count,
    required this.dis_one,
    required this.dis_two,
    required this.dis_three,
    required this.meLike,
    required this.common_info,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        author_id: json['author_id'],
        name: json['name'],
        price: json['price'],
        image: json['image'],
        category_id: json['category_id'],
        phone_number: json['phone_number'],
        common_info: json['common_info'],
        exp_date: json['exp_date'],
        quantity: json['quantity'],
        date_one: json['date_one'],
        date_two: json['date_two'],
        date_three: json['date_three'],
        likes_count: json['likes_count'],
        dis_one: json['dis_one'],
        dis_two: json['dis_two'],
        dis_three: json['dis_three'],
        meLike: json['meLike'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "author_id": author_id,
        "name": name,
        "price": price,
        "image": image,
        "category_id": category_id,
        "phone_number": phone_number,
        "exp_date": exp_date,
        "quantity": quantity,
        "date_one": date_one,
        "date_two": date_two,
        "date_three": date_three,
        "likes_count": likes_count,
        "dis_one": dis_one,
        "dis_two": dis_two,
        "dis_three": dis_three,
        "meLike": meLike,
      };
}
