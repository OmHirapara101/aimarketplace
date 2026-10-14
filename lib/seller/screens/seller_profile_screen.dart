import 'package:flutter/material.dart';
import '../../common/theme/app_theme.dart';
import '../../user/screens/settings_screen.dart';
import '../../user/screens/cart_screen.dart';
import '../../user/screens/login_screen.dart';
import 'my_prompts_screen.dart';
import 'earnings_screen.dart';

class SellerProfileScreen extends StatelessWidget {
  const SellerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Purple Header
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF7C5CFF), Color(0xFF5F3BF0)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 20.0),
                  child: Column(
                    children: [
                      // Avatar
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 3),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.15),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const CircleAvatar(
                          radius: 46,
                          backgroundImage: NetworkImage(
                            'https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?auto=format&fit=crop&w=300&q=80',
                          ),
                        ),
                      ),
                      const SizedBox(height: 14),

                      // Name & Email
                      const Text(
                        'Mitanshi Chauhan',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'mitanshi@gmail.com',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Divider Line
                      Container(
                        height: 1,
                        color: Colors.white.withValues(alpha: 0.25),
                      ),
                      const SizedBox(height: 16),

                      // Stats Row (Purchased | Favourites | Uploads)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: const [
                              Text(
                                '24',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                'Purchased',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 30,
                            width: 1,
                            color: Colors.white.withValues(alpha: 0.25),
                          ),
                          Column(
                            children: const [
                              Text(
                                '12',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                'Favourites',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 30,
                            width: 1,
                            color: Colors.white.withValues(alpha: 0.25),
                          ),
                          Column(
                            children: const [
                              Text(
                                '8',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                'Uploads',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Profile Options List
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Column(
                children: [
                  _buildProfileOption(
                    icon: Icons.shopping_bag_outlined,
                    title: 'My Purchases',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CartScreen(),
                        ),
                      );
                    },
                  ),
                  const Divider(color: Color(0xFFF1F5F9), height: 1),
                  _buildProfileOption(
                    icon: Icons.upload_outlined,
                    title: 'My Upload',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyPromptsScreen(),
                        ),
                      );
                    },
                  ),
                  const Divider(color: Color(0xFFF1F5F9), height: 1),
                  _buildProfileOption(
                    icon: Icons.account_balance_wallet_outlined,
                    title: 'Earning',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EarningsScreen(),
                        ),
                      );
                    },
                  ),
                  const Divider(color: Color(0xFFF1F5F9), height: 1),
                  _buildProfileOption(
                    icon: Icons.stars_outlined,
                    title: 'Reviews',
                    onTap: () {},
                  ),
                  const Divider(color: Color(0xFFF1F5F9), height: 1),
                  _buildProfileOption(
                    icon: Icons.settings_outlined,
                    title: 'Settings',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SettingsScreen(),
                        ),
                      );
                    },
                  ),
                  const Divider(color: Color(0xFFF1F5F9), height: 1),
                  _buildProfileOption(
                    icon: Icons.logout_rounded,
                    title: 'Logout',
                    iconColor: const Color(0xFFF97316),
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                        (route) => false,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? iconColor,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 6),
      leading: Icon(
        icon,
        color: iconColor ?? AppTheme.textPrimary,
        size: 24,
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
