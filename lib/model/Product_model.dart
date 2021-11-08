class Product {
  final int id;
  final String title;
  final dynamic price;
  final String description;
  final String category;
  final String imgge;
  final Rating rating;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.imgge,
    required this.rating,
  });
}

class Rating {
  final dynamic rate;
  final dynamic coutn;
  Rating({required this.rate, required this.coutn});
}
