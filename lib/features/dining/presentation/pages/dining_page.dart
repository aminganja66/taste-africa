import 'package:flutter/material.dart';
import '../../../../../app/widgets/offer_banner.dart';
import '../../../../../app/widgets/poster_header.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../home/presentation/widgets/featured_restaurants.dart';
import '../../../home/presentation/widgets/food_categories_grid.dart';
import '../../../home/presentation/widgets/top_rated_restaurants.dart';

class DiningPage extends StatelessWidget {
  const DiningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          const PosterSliver(
            locationTitle: 'Home',
            address: '123 Lagos Street, Ikeja',
            firstName: 'Amin',
            expandedHeight: 360,
            media: OfferBannerMedia(),
          ),
          const SliverToBoxAdapter(child: FoodCategoriesGrid()),
          const SliverToBoxAdapter(child: FeaturedRestaurants()),
          const SliverToBoxAdapter(child: TopRatedRestaurants()),
        ],
      ),
    );
  }
}
