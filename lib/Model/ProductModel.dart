class Productmodel {
  final int id;
  final String name;
  final double price;
  final String summary;
  final String category;
  final String image;
  final double rating;

  Productmodel({
    required this.id,
    required this.name,
    required this.price,
    required this.summary,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory Productmodel.fromJson(Map<String, dynamic> json) {
    return Productmodel(
      id: json['id'],
      name: json['name']??"",
      price: json['price'] ?.toDouble() ?? 100.0,
      summary: json['summary']??"",
      category: json['type']?? "",
      image: json['image']?['medium']??"",
      rating: json['rating']?['average'] != null ? json['rating']['average'].toDouble() : 0.0,
    );
  }
}