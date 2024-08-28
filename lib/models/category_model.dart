class ImageCategory {
  final String imageAsset;
  final String category;

  ImageCategory({required this.imageAsset, required this.category});

  factory ImageCategory.fromJson(Map<String, dynamic> json) {
    return ImageCategory(
      imageAsset: json['imageAsset'] ?? '',
      category: json['category'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['imageAsset'] = imageAsset;
    data['category'] = category;
    return data;
  }
}