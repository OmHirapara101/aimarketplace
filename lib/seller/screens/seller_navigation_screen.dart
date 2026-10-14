import 'package:flutter/material.dart';
import '../../common/theme/app_theme.dart';
import '../../user/screens/home_screen.dart';
import '../../user/screens/explore_screen.dart';
import '../../user/screens/favorites_screen.dart';
import 'seller_profile_screen.dart';
import 'upload_prompt_screen.dart';

class SellerNavigationScreen extends StatefulWidget {
  final int initialIndex;

  const SellerNavigationScreen({
    super.key,
    this.initialIndex = 0,
  });

  @override
  State<SellerNavigationScreen> createState() => _SellerNavigationScreenState();
}

class _SellerNavigationScreenState extends State<SellerNavigationScreen> {
  late int _currentIndex;

  final List<Widget> _screens = [
    const HomeScreen(),
    const ExploreScreen(),
    const UploadPromptScreen(showBackButton: false),
    const FavoritesScreen(),
    const SellerProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: const Border(
            top: BorderSide(
              color: Color(0xFFE2E8F0),
              width: 1,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 10,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildNavItem(
                  index: 0,
                  icon: Icons.home_outlined,
                  activeIcon: Icons.home_rounded,
                  label: 'Home',
                ),
                _buildNavItem(
                  index: 1,
                  icon: Icons.search_outlined,
                  activeIcon: Icons.search_rounded,
                  label: 'Explore',
                ),
                // Center Upload FAB Button
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentIndex = 2;
                    });
                  },
                  behavior: HitTestBehavior.opaque,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 46,
                        height: 46,
                        decoration: BoxDecoration(
                          color: AppTheme.primaryColor,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: AppTheme.primaryColor.withValues(alpha: 0.4),
                              blurRadius: 8,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.add_rounded,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Upload',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: _currentIndex == 2 ? FontWeight.w600 : FontWeight.w400,
                          color: _currentIndex == 2
                              ? AppTheme.primaryColor
                              : const Color(0xFF64748B),
                        ),
                      ),
                    ],
                  ),
                ),
                _buildNavItem(
                  index: 3,
                  icon: Icons.favorite_outline,
                  activeIcon: Icons.favorite_rounded,
                  label: 'Favorites',
                ),
                _buildNavItem(
                  index: 4,
                  icon: Icons.person_outline,
                  activeIcon: Icons.person_rounded,
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required IconData icon,
    required IconData activeIcon,
    required String label,
  }) {
    final bool isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isSelected ? activeIcon : icon,
            color: isSelected ? AppTheme.primaryColor : const Color(0xFF64748B),
            size: 24,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              color: isSelected ? AppTheme.primaryColor : const Color(0xFF64748B),
            ),
          ),
        ],
      ),
    );
  }
}
