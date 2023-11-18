class ProductModel {
  final num id;
  final String title;
  final String description;
  final num price;
  final num discountPercentage;
  final num rating;
  final num stock;
  final String brand;
  final String category;
  final String thumbnail;
  final List<dynamic> images;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });

  factory ProductModel.fromJson(dynamic json) {
    return ProductModel(
      id: json['id'] as num,
      title: json['title'] as String,
      description: json['description'] as String,
      price: json['price'] as num,
      discountPercentage: json['discountPercentage'] as num,
      rating: json['rating'] as num,
      stock: json['stock'] as num,
      brand: json['brand'] as String,
      category: json['category'] as String,
      thumbnail: json['thumbnail'] as String,
      images: json['images'] as List<dynamic>,
    );
  }
}
