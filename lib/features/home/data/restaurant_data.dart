import '../domain/entities/restaurant.dart';

class RestaurantData {
  RestaurantData._();

  static const all = [
    Restaurant(
      name: 'Jollof House',
      imageUrl: 'https://eatout.co.ke/wp-content/uploads/2024/02/IMG_6192-scaled-540x480.jpeg',
      cuisineType: 'West African',
      location: 'Lagos',
      rating: 4.8,
      deliveryTime: '25 min',
      isNew: true,
    ),
    Restaurant(
      name: 'Ubuntu Grill',
      imageUrl: 'https://eatout.co.ke/wp-content/uploads/2024/07/The-Hide-03-540x480.jpg',
      cuisineType: 'South African',
      location: 'Abuja',
      rating: 4.5,
      deliveryTime: '35 min',
    ),
    Restaurant(
      name: 'Berbere Bistro',
      imageUrl: 'https://eatout.co.ke/wp-content/uploads/2025/01/DSC03335-540x480.jpg',
      cuisineType: 'Ethiopian',
      location: 'Addis Ababa',
      rating: 4.7,
      deliveryTime: '30 min',
      isNew: true,
    ),
    Restaurant(
      name: 'Seafront Lagos',
      imageUrl: 'https://eatout.co.ke/wp-content/uploads/2024/06/1I2A9508-Enhanced-NR-540x480.jpg',
      cuisineType: 'Seafood',
      location: 'Lagos',
      rating: 4.3,
      deliveryTime: '40 min',
    ),
    Restaurant(
      name: 'Acacia Kitchen',
      imageUrl: 'https://eatout.co.ke/wp-content/uploads/2026/01/Emara-Ole-Sereni-26-scaled-540x480.jpg',
      cuisineType: 'Pan African',
      location: 'Nairobi',
      rating: 4.6,
      deliveryTime: '20 min',
    ),
  ];

  static List<Restaurant> get byRating =>
      [...all]..sort((a, b) => b.rating.compareTo(a.rating));
}
