import 'package:flutter/material.dart';
import '../../common/theme/app_theme.dart';
import 'admin_dashboard_screen.dart';
import 'admin_users_screen.dart';
import 'admin_sellers_screen.dart';
import 'admin_prompts_screen.dart';
import 'admin_orders_screen.dart';
import 'admin_categories_screen.dart';
import 'admin_settings_screen.dart';
import 'admin_login_screen.dart';

class AdminDrawer extends StatelessWidget {
  final String currentRoute;

  const AdminDrawer({
    super.key,
    required this.currentRoute,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            // Drawer Header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              decoration: const BoxDecoration(
                color: Color(0xFFF8FAFC),
                border: Border(
                  bottom: BorderSide(color: Color(0xFFE2E8F0)),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: const BoxDecoration(
                      color: AppTheme.primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.admin_panel_settings_rounded,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Admin Panel',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.textPrimary,
                        ),
                      ),
                      Text(
                        'admin@marketplace.com',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppTheme.textMuted,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // Navigation Items
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                children: [
                  _buildDrawerItem(
                    context,
                    icon: Icons.dashboard_outlined,
                    title: 'Dashboard',
                    routeName: 'Dashboard',
                    destination: const AdminDashboardScreen(),
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.people_outline_rounded,
                    title: 'Users',
                    routeName: 'Users',
                    destination: const AdminUsersScreen(),
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.storefront_outlined,
                    title: 'Seller',
                    routeName: 'Seller',
                    destination: const AdminSellersScreen(),
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.psychology_outlined,
                    title: 'Prompts',
                    routeName: 'Prompts',
                    destination: const AdminPromptsScreen(),
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.shopping_bag_outlined,
                    title: 'Orders',
                    routeName: 'Orders',
                    destination: const AdminOrdersScreen(),
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.category_outlined,
                    title: 'Categories',
                    routeName: 'Categories',
                    destination: const AdminCategoriesScreen(),
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.settings_outlined,
                    title: 'Settings',
                    routeName: 'Settings',
                    destination: const AdminSettingsScreen(),
                  ),
                ],
              ),
            ),

            // Logout
            const Divider(color: Color(0xFFE2E8F0)),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              leading: const Icon(Icons.logout_rounded, color: AppTheme.dangerColor),
              title: const Text(
                'Logout',
                style: TextStyle(
                  color: AppTheme.dangerColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const AdminLoginScreen()),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String routeName,
    required Widget destination,
  }) {
    final isSelected = currentRoute == routeName;
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        selected: isSelected,
        selectedTileColor: AppTheme.primaryColor.withValues(alpha: 0.1),
        leading: Icon(
          icon,
          color: isSelected ? AppTheme.primaryColor : AppTheme.textSecondary,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: isSelected ? AppTheme.primaryColor : AppTheme.textPrimary,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            fontSize: 15,
          ),
        ),
        onTap: () {
          Navigator.pop(context); // Close drawer
          if (!isSelected) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => destination),
            );
          }
        },
      ),
    );
  }
}
