import 'package:flutter/material.dart';
import '../../common/theme/app_theme.dart';
import 'admin_drawer.dart';
import 'admin_login_screen.dart';

class AdminSettingsScreen extends StatelessWidget {
  const AdminSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const AdminDrawer(currentRoute: 'Settings'),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu_rounded, color: AppTheme.textPrimary, size: 28),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: const Text(
          'Settings',
          style: TextStyle(
            color: AppTheme.textPrimary,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
          children: [
            _buildSettingTile(
              icon: Icons.settings_outlined,
              title: 'General Setting',
              onTap: () {},
            ),
            const Divider(color: Color(0xFFF1F5F9), height: 1),
            _buildSettingTile(
              icon: Icons.manage_accounts_outlined,
              title: 'Admin Management',
              onTap: () {},
            ),
            const Divider(color: Color(0xFFF1F5F9), height: 1),
            _buildSettingTile(
              icon: Icons.shield_outlined,
              title: 'Security',
              onTap: () {},
            ),
            const Divider(color: Color(0xFFF1F5F9), height: 1),
            _buildSettingTile(
              icon: Icons.email_outlined,
              title: 'Email Setting',
              onTap: () {},
            ),
            const Divider(color: Color(0xFFF1F5F9), height: 1),
            _buildSettingTile(
              icon: Icons.credit_card_outlined,
              title: 'Payment Setting',
              onTap: () {},
            ),
            const Divider(color: Color(0xFFF1F5F9), height: 1),
            _buildSettingTile(
              icon: Icons.logout_rounded,
              title: 'LogOut',
              isDanger: true,
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

  Widget _buildSettingTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isDanger = false,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8),
      leading: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: const Color(0xFFF8FAFC),
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xFFF1F5F9)),
        ),
        child: Icon(
          icon,
          color: isDanger ? const Color(0xFFEF4444) : AppTheme.textPrimary,
          size: 22,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: isDanger ? const Color(0xFFEF4444) : AppTheme.textPrimary,
        ),
      ),
      trailing: const Icon(
        Icons.chevron_right_rounded,
        color: AppTheme.textMuted,
        size: 22,
      ),
      onTap: onTap,
    );
  }
}
