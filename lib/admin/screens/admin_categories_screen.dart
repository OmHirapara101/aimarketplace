import 'package:flutter/material.dart';
import '../../common/theme/app_theme.dart';
import 'admin_drawer.dart';

class AdminCategoriesScreen extends StatefulWidget {
  const AdminCategoriesScreen({super.key});

  @override
  State<AdminCategoriesScreen> createState() => _AdminCategoriesScreenState();
}

class _AdminCategoriesScreenState extends State<AdminCategoriesScreen> {
  final List<Map<String, dynamic>> _categories = [
    {
      'name': 'Writing',
      'count': '120 prompts',
      'icon': Icons.edit_note_rounded,
    },
    {
      'name': 'Image Generation',
      'count': '90 prompts',
      'icon': Icons.image_outlined,
    },
    {
      'name': 'Coding',
      'count': '110 prompts',
      'icon': Icons.code_rounded,
    },
    {
      'name': 'Marketing',
      'count': '90 prompts',
      'icon': Icons.send_rounded,
    },
    {
      'name': 'Business',
      'count': '70 prompts',
      'icon': Icons.business_center_outlined,
    },
  ];

  void _showAddCategoryDialog() {
    final TextEditingController catController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Text(
            'Add New Category',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          content: TextField(
            controller: catController,
            decoration: InputDecoration(
              hintText: 'Enter category name',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel', style: TextStyle(color: AppTheme.textMuted)),
            ),
            ElevatedButton(
              onPressed: () {
                if (catController.text.isNotEmpty) {
                  setState(() {
                    _categories.add({
                      'name': catController.text,
                      'count': '0 prompts',
                      'icon': Icons.category_outlined,
                    });
                  });
                }
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text('Add', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const AdminDrawer(currentRoute: 'Categories'),
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
          'Categories',
          style: TextStyle(
            color: AppTheme.textPrimary,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: _showAddCategoryDialog,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: const [
                    Text(
                      '+ add',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          itemCount: _categories.length,
          separatorBuilder: (context, index) => const Divider(
            height: 28,
            color: Color(0xFFE2E8F0),
          ),
          itemBuilder: (context, index) {
            final cat = _categories[index];
            return Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFF6FF),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    cat['icon'] as IconData,
                    color: const Color(0xFF3B82F6),
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cat['name'] as String,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        cat['count'] as String,
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppTheme.textMuted,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.more_vert_rounded, color: AppTheme.textMuted, size: 20),
                  onPressed: () {},
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
