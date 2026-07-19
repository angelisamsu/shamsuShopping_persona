class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final double rating;
  final int ratingCount;

  const Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
    required this.ratingCount,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    final ratingValue = json['rating'];
    double rating;
    int ratingCount;

    if (ratingValue is Map<String, dynamic>) {
      rating = (ratingValue['rate'] as num?)?.toDouble() ?? 0.0;
      ratingCount = (ratingValue['count'] as num?)?.toInt() ?? 0;
    } else if (ratingValue is num) {
      rating = ratingValue.toDouble();
      ratingCount = 0;
    } else {
      rating = 0.0;
      ratingCount = 0;
    }

    String stringValue(Object? value) => value is String ? value : '';
    final image = stringValue(json['image']).isNotEmpty
        ? stringValue(json['image'])
        : stringValue(json['thumbnail']);

    return Product(
      id: (json['id'] as num).toInt(),
      title: stringValue(json['title']),
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      description: stringValue(json['description']),
      category: stringValue(json['category']),
      image: image,
      rating: rating,
      ratingCount: ratingCount,
    );
  }
}
