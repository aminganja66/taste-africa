import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class PageTopBar extends StatelessWidget {
  const PageTopBar({
    super.key,
    required this.locationTitle,
    required this.address,
    required this.firstName,
    this.opacity = 1.0,
  });

  final String locationTitle;
  final String address;
  final String firstName;

  /// 0.0 = fully transparent bg (over poster) → 1.0 = white bg (collapsed)
  final double opacity;

  Color get _iconColor => Color.lerp(Colors.white, AppColors.primary, opacity)!;
  Color get _titleColor => Color.lerp(Colors.white, AppColors.textPrimary, opacity)!;
  Color get _subtitleColor =>
      Color.lerp(Colors.white.withValues(alpha: 0.85), AppColors.textSecondary, opacity)!;
  Color get _avatarBg =>
      Color.lerp(Colors.white.withValues(alpha: 0.25), AppColors.avatarBg, opacity)!;
  Color get _avatarText =>
      Color.lerp(Colors.white, AppColors.primary, opacity)!;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Icon(Icons.location_on_outlined, color: _iconColor, size: 22),
          const SizedBox(width: 6),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      locationTitle,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: _titleColor,
                      ),
                    ),
                    const SizedBox(width: 2),
                    Icon(Icons.keyboard_arrow_down_rounded, size: 18, color: _titleColor),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  address,
                  style: TextStyle(fontSize: 12, color: _subtitleColor),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          CircleAvatar(
            radius: 20,
            backgroundColor: _avatarBg,
            child: Text(
              firstName[0].toUpperCase(),
              style: TextStyle(
                color: _avatarText,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
