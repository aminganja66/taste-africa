import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../domain/entities/food_category.dart';
import 'food_category_item.dart';

class FoodCategoriesGrid extends StatefulWidget {
  const FoodCategoriesGrid({super.key});

  @override
  State<FoodCategoriesGrid> createState() => _FoodCategoriesGridState();
}

class _FoodCategoriesGridState extends State<FoodCategoriesGrid> {
  final _pageController = PageController();
  int _currentPage = 0;

  static const _columns = 4;
  static const _rows = 2;
  static const _itemsPerPage = _columns * _rows;
  static const _crossSpacing = 30.0;
  static const _mainSpacing = 20.0;
  static const _hPadding = 16.0;
  static const _aspectRatio = 0.75;

  static const _categories = [
    FoodCategory(name: 'Burgers',    imageUrl: 'https://www.themealdb.com/images/media/meals/44bzep1761848278.jpg'),
    FoodCategory(name: 'Pizza',      imageUrl: 'https://www.themealdb.com/images/media/meals/lrfdwz1764438393.jpg'),
    FoodCategory(name: 'Chicken',    imageUrl: 'https://www.themealdb.com/images/media/meals/nlxald1764112200.jpg'),
    FoodCategory(name: 'Sushi',      imageUrl: 'https://www.themealdb.com/images/media/meals/g046bb1663960946.jpg'),
    FoodCategory(name: 'Vegetarian', imageUrl: 'https://www.themealdb.com/images/category/vegetarian.png'),
    FoodCategory(name: 'Seafood',    imageUrl: 'https://www.themealdb.com/images/category/seafood.png'),
    FoodCategory(name: 'Bakery',     imageUrl: 'https://www.themealdb.com/images/category/dessert.png'),
    FoodCategory(name: 'Local Food', imageUrl: 'https://www.themealdb.com/images/category/lamb.png'),
    FoodCategory(name: 'Coffee',     imageUrl: 'https://www.themealdb.com/images/category/breakfast.png'),
    FoodCategory(name: 'Drinks',     imageUrl: 'https://www.themealdb.com/images/category/miscellaneous.png'),
  ];

  List<List<FoodCategory>> get _pages {
    final pages = <List<FoodCategory>>[];
    for (var i = 0; i < _categories.length; i += _itemsPerPage) {
      final end = i + _itemsPerPage < _categories.length ? i + _itemsPerPage : _categories.length;
      pages.add(_categories.sublist(i, end));
    }
    return pages;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pages = _pages;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 20, 16, 16),
          child: Text(
            'What are you craving?',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.textPrimary),
          ),
        ),

        LayoutBuilder(
          builder: (context, constraints) {
            final cellWidth = (constraints.maxWidth - _hPadding * 2 - _crossSpacing * (_columns - 1)) / _columns;
            final cellHeight = cellWidth / _aspectRatio;
            final gridHeight = cellHeight * _rows + _mainSpacing * (_rows - 1);

            return SizedBox(
              height: gridHeight,
              child: PageView.builder(
                controller: _pageController,
                itemCount: pages.length,
                onPageChanged: (i) => setState(() => _currentPage = i),
                itemBuilder: (_, pageIndex) => GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: _hPadding),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: _columns,
                    crossAxisSpacing: _crossSpacing,
                    mainAxisSpacing: _mainSpacing,
                    childAspectRatio: _aspectRatio,
                  ),
                  itemCount: pages[pageIndex].length,
                  itemBuilder: (_, i) => FoodCategoryItem(category: pages[pageIndex][i]),
                ),
              ),
            );
          },
        ),

        const SizedBox(height: 12),

        // Page indicators
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(pages.length, (i) {
            final active = i == _currentPage;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              margin: const EdgeInsets.symmetric(horizontal: 3),
              width: active ? 16 : 6,
              height: 6,
              decoration: BoxDecoration(
                color: active ? AppColors.primary : AppColors.navUnselected.withValues(alpha: 0.4),
                borderRadius: BorderRadius.circular(3),
              ),
            );
          }),
        ),

        const SizedBox(height: 20),
      ],
    );
  }
}
