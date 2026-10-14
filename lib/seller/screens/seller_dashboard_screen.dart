import 'package:flutter/material.dart';
import '../../common/theme/app_theme.dart';

class SellerDashboardScreen extends StatelessWidget {
  const SellerDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seller Dashboard'),
      ),
      body: const Center(
        child: Text(
          'Seller Dashboard Screen',
          style: TextStyle(fontSize: 18, color: AppTheme.textPrimary),
        ),
      ),
    );
  }
}
