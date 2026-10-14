import 'package:flutter/material.dart';
import '../../common/theme/app_theme.dart';
import 'admin_drawer.dart';

class AdminOrdersScreen extends StatefulWidget {
  const AdminOrdersScreen({super.key});

  @override
  State<AdminOrdersScreen> createState() => _AdminOrdersScreenState();
}

class _AdminOrdersScreenState extends State<AdminOrdersScreen> {
  String _selectedStatusFilter = 'All';
  final List<String> _statusFilters = ['All', 'Completed', 'Pending', 'Cancelled'];

  final List<Map<String, String>> _orders = [
    {
      'orderId': 'ORD-0012',
      'customer': 'Rahul Sharma',
      'date': '20 May 2024',
      'status': 'Completed',
      'image': 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=200&q=80',
    },
    {
      'orderId': 'ORD-0011',
      'customer': 'Priya Patel',
      'date': '20 May 2004',
      'status': 'Pending',
      'image': 'https://images.unsplash.com/photo-1517841905240-472988babdf9?auto=format&fit=crop&w=200&q=80',
    },
    {
      'orderId': 'ORD-0010',
      'customer': 'Amit Verma',
      'date': '11 May 2004',
      'status': 'Completed',
      'image': 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=200&q=80',
    },
    {
      'orderId': 'ORD-0009',
      'customer': 'Neha Singh',
      'date': '19 May 2004',
      'status': 'Rejected',
      'image': 'https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?auto=format&fit=crop&w=200&q=80',
    },
    {
      'orderId': 'ORD-0008',
      'customer': 'Vikram Joshi',
      'date': '18 May 2004',
      'status': 'Completed',
      'image': 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=200&q=80',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filteredOrders = _selectedStatusFilter == 'All'
        ? _orders
        : _orders.where((o) => o['status'] == _selectedStatusFilter).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const AdminDrawer(currentRoute: 'Orders'),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.arrow_back_rounded, color: AppTheme.textPrimary),
            onPressed: () {
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              } else {
                Scaffold.of(context).openDrawer();
              }
            },
          ),
        ),
        title: const Text(
          'Orders',
          style: TextStyle(
            color: AppTheme.textPrimary,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Search Bar & Filter Icon
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F5F9),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: 'Search orders...',
                          hintStyle: TextStyle(color: AppTheme.textMuted, fontSize: 14),
                          prefixIcon: Icon(Icons.search_rounded, color: AppTheme.textMuted),
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFFE2E8F0)),
                    ),
                    child: const Icon(Icons.filter_list_rounded, color: AppTheme.textSecondary),
                  ),
                ],
              ),
            ),

            // Status Filter Chips
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Row(
                children: _statusFilters.map((status) {
                  final isSelected = _selectedStatusFilter == status;
                  return Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedStatusFilter = status;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                        decoration: BoxDecoration(
                          color: isSelected ? AppTheme.primaryColor : const Color(0xFFF1F5F9),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          status,
                          style: TextStyle(
                            color: isSelected ? Colors.white : AppTheme.textSecondary,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 8),

            // Orders List
            Expanded(
              child: filteredOrders.isEmpty
                  ? const Center(
                      child: Text(
                        'No orders found',
                        style: TextStyle(color: AppTheme.textMuted, fontSize: 15),
                      ),
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      itemCount: filteredOrders.length,
                      separatorBuilder: (context, index) => const Divider(
                        height: 28,
                        color: Color(0xFFE2E8F0),
                      ),
                      itemBuilder: (context, index) {
                        final order = filteredOrders[index];
                        final status = order['status']!;

                        Color getStatusColor() {
                          switch (status) {
                            case 'Completed':
                              return const Color(0xFF10B981);
                            case 'Pending':
                              return const Color(0xFFD97706);
                            case 'Rejected':
                              return const Color(0xFFEF4444);
                            default:
                              return const Color(0xFF10B981);
                          }
                        }

                        Color getStatusBg() {
                          switch (status) {
                            case 'Completed':
                              return const Color(0xFFDCFCE7);
                            case 'Pending':
                              return const Color(0xFFFEF3C7);
                            case 'Rejected':
                              return const Color(0xFFFEE2E2);
                            default:
                              return const Color(0xFFDCFCE7);
                          }
                        }

                        return Row(
                          children: [
                            CircleAvatar(
                              radius: 26,
                              backgroundImage: NetworkImage(order['image']!),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    order['orderId']!,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: AppTheme.textPrimary,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    order['customer']!,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: AppTheme.textSecondary,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    order['date']!,
                                    style: const TextStyle(
                                      fontSize: 11,
                                      color: AppTheme.textMuted,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: getStatusBg(),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                status,
                                style: TextStyle(
                                  color: getStatusColor(),
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
