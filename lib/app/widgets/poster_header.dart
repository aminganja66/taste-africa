import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import 'home_search_bar.dart';
import 'page_top_bar.dart';

class PosterSliver extends StatelessWidget {
  const PosterSliver({
    super.key,
    required this.media,
    required this.locationTitle,
    required this.address,
    required this.firstName,
    this.expandedHeight = 300,
  });

  final Widget media;
  final String locationTitle;
  final String address;
  final String firstName;
  final double expandedHeight;

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    return SliverPersistentHeader(
      pinned: true,
      delegate: _PosterDelegate(
        media: media,
        locationTitle: locationTitle,
        address: address,
        firstName: firstName,
        topPadding: topPadding,
        expandedHeight: expandedHeight,
      ),
    );
  }
}

class _PosterDelegate extends SliverPersistentHeaderDelegate {
  const _PosterDelegate({
    required this.media,
    required this.locationTitle,
    required this.address,
    required this.firstName,
    required this.topPadding,
    required this.expandedHeight,
  });

  final Widget media;
  final String locationTitle;
  final String address;
  final String firstName;
  final double topPadding;
  final double expandedHeight;

  // top bar (~68) + gap (8) + search bar (48) + bottom padding (16)
  static const double _contentHeight = 140;

  @override
  double get minExtent => topPadding + _contentHeight;

  @override
  double get maxExtent => topPadding + expandedHeight;

  @override
  bool shouldRebuild(_PosterDelegate old) =>
      old.address != address ||
      old.locationTitle != locationTitle ||
      old.firstName != firstName ||
      old.topPadding != topPadding;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final opacity = (shrinkOffset / 80).clamp(0.0, 1.0);
    final cornerRadius = 24.0 * (1 - opacity);

    return Stack(
      fit: StackFit.expand,
      children: [
        // Background media
        ClipRRect(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(cornerRadius)),
          child: media,
        ),

        // Subtle dark scrim so text stays readable over any image
        Positioned.fill(
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(cornerRadius)),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.25 * (1 - opacity)),
                    Colors.transparent,
                  ],
                  stops: const [0.0, 0.45],
                ),
              ),
            ),
          ),
        ),

        // White background overlay (grows as user scrolls)
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            color: AppColors.surface.withValues(alpha: opacity),
            padding: EdgeInsets.only(top: topPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                PageTopBar(
                  locationTitle: locationTitle,
                  address: address,
                  firstName: firstName,
                  opacity: opacity,
                ),
                const SizedBox(height: 8),
                const HomeSearchBar(),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// Gradient placeholder used until a real media asset is supplied.
class PosterSliverPlaceholder extends StatelessWidget {
  const PosterSliverPlaceholder({
    super.key,
    required this.locationTitle,
    required this.address,
    required this.firstName,
  });

  final String locationTitle;
  final String address;
  final String firstName;

  @override
  Widget build(BuildContext context) {
    return PosterSliver(
      locationTitle: locationTitle,
      address: address,
      firstName: firstName,
      media: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1A8C5B), Color(0xFF56C596)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }
}
