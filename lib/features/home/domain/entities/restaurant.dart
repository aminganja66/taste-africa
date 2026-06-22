class Restaurant {
  const Restaurant({
    required this.name,
    required this.imageUrl,
    required this.cuisineType,
    required this.location,
    required this.rating,
    required this.deliveryTime,
    this.isNew = false,
  });

  final String name;
  final String imageUrl;
  final String cuisineType;
  final String location;
  final double rating;
  final String deliveryTime;
  final bool isNew;
}
