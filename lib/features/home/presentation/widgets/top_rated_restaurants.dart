import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../data/restaurant_data.dart';
import 'restaurant_card.dart';

class TopRatedRestaurants extends StatelessWidget {
  const TopRatedRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    final restaurants = RestaurantData.byRating;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 14),
          child: Row(
            children: [
              const Icon(Icons.star_outline_rounded, color: AppColors.primary, size: 20),
              const SizedBox(width: 8),
              const Expanded(
                child: Text(
                  'Top Rated',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.textPrimary),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  'See all',
                  style: TextStyle(fontSize: 13, color: AppColors.primary, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 210,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: restaurants.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (_, i) => RestaurantCard(restaurant: restaurants[i]),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
