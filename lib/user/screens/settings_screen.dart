import 'package:flutter/material.dart';
import '../../common/theme/app_theme.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: AppTheme.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Settings',
          style: TextStyle(
            color: AppTheme.textPrimary,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
          children: [
            _buildSettingTile(
              icon: Icons.person_outline_rounded,
              title: 'Account Setting',
              onTap: () {},
            ),
            const Divider(color: Color(0xFFF1F5F9), height: 1),
            _buildSettingTile(
              icon: Icons.credit_card_rounded,
              title: 'Payment Methods',
              onTap: () {},
            ),
            const Divider(color: Color(0xFFF1F5F9), height: 1),
            _buildSettingTile(
              icon: Icons.shield_outlined,
              title: 'privacy policy',
              onTap: () {},
            ),
            const Divider(color: Color(0xFFF1F5F9), height: 1),
            _buildSettingTile(
              icon: Icons.help_outline_rounded,
              title: 'Help & Support',
              onTap: () {},
            ),
            const Divider(color: Color(0xFFF1F5F9), height: 1),
            _buildSettingTile(
              icon: Icons.info_outline_rounded,
              title: 'About Us',
              onTap: () {},
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
          color: AppTheme.textPrimary,
          size: 22,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppTheme.textPrimary,
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
