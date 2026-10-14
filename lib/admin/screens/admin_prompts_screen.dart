import 'package:flutter/material.dart';
import '../../common/theme/app_theme.dart';
import '../../common/models/prompt_model.dart';
import 'admin_drawer.dart';
import 'admin_prompt_details_screen.dart';

class AdminPromptsScreen extends StatefulWidget {
  const AdminPromptsScreen({super.key});

  @override
  State<AdminPromptsScreen> createState() => _AdminPromptsScreenState();
}

class _AdminPromptsScreenState extends State<AdminPromptsScreen> {
  final List<Map<String, dynamic>> _adminPrompts = [
    {
      'model': PromptModel(
        id: 'p1',
        title: 'ChatGPT Content Writing Pack',
        category: 'Writing',
        description:
            'A comprehensive collection of 500+ ChatGPT prompts for writing, productivity, marketing and more.',
        price: 299,
        rating: 4.8,
        reviewsCount: 120,
        salesCount: 1200,
        creatorName: 'John Doe',
        creatorRole: 'Creator',
        imageUrl: 'https://images.unsplash.com/photo-1618005182384-a83a8bd57fbe?auto=format&fit=crop&w=600&q=80',
      ),
      'status': 'Approved',
    },
    {
      'model': PromptModel(
        id: 'p2',
        title: 'Midjourney Master Collection',
        category: 'Art',
        description: 'Unlock stunning AI generated art with over 300+ battle-tested Midjourney prompts.',
        price: 199,
        rating: 4.7,
        reviewsCount: 210,
        salesCount: 850,
        creatorName: 'Alice Brown',
        creatorRole: 'AI Creator',
        imageUrl: 'https://images.unsplash.com/photo-1634017839464-5c339ebe3cb4?auto=format&fit=crop&w=600&q=80',
      ),
      'status': 'Approved',
    },
    {
      'model': PromptModel(
        id: 'p3',
        title: 'Coding Assistant Prompts',
        category: 'Coding',
        description: 'Accelerate your development workflow with specialized code generation prompts.',
        price: 249,
        rating: 4.6,
        reviewsCount: 145,
        salesCount: 620,
        creatorName: 'Michael Lee',
        creatorRole: 'Developer',
        imageUrl: 'https://images.unsplash.com/photo-1555066931-4365d14bab8c?auto=format&fit=crop&w=600&q=80',
      ),
      'status': 'Pending',
    },
    {
      'model': PromptModel(
        id: 'p4',
        title: 'Marketing Prompts 2.0',
        category: 'Marketing',
        description: 'High converting ad copies, email newsletters and social captions.',
        price: 199,
        rating: 4.8,
        reviewsCount: 230,
        salesCount: 940,
        creatorName: 'Sophia Clerk',
        creatorRole: 'Marketer',
        imageUrl: 'https://images.unsplash.com/photo-1533750349088-cd871a92f312?auto=format&fit=crop&w=600&q=80',
      ),
      'status': 'Approved',
    },
    {
      'model': PromptModel(
        id: 'p5',
        title: 'Business Ideas Prompts',
        category: 'Business',
        description: 'Streamline business strategy, executive emails, and proposals.',
        price: 149,
        rating: 4.5,
        reviewsCount: 80,
        salesCount: 310,
        creatorName: 'David Wilson',
        creatorRole: 'Strategist',
        imageUrl: 'https://images.unsplash.com/photo-1460925895917-afdab827c52f?auto=format&fit=crop&w=600&q=80',
      ),
      'status': 'Rejected',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const AdminDrawer(currentRoute: 'Prompts'),
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
          'Prompts',
          style: TextStyle(
            color: AppTheme.textPrimary,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Search Bar & Filter Icon
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
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
                          hintText: 'Search prompts...',
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

            // Prompts List
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                itemCount: _adminPrompts.length,
                separatorBuilder: (context, index) => const Divider(
                  height: 28,
                  color: Color(0xFFE2E8F0),
                ),
                itemBuilder: (context, index) {
                  final item = _adminPrompts[index];
                  final PromptModel model = item['model'];
                  final String status = item['status'];

                  Color getStatusColor() {
                    switch (status) {
                      case 'Approved':
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
                      case 'Approved':
                        return const Color(0xFFDCFCE7);
                      case 'Pending':
                        return const Color(0xFFFEF3C7);
                      case 'Rejected':
                        return const Color(0xFFFEE2E2);
                      default:
                        return const Color(0xFFDCFCE7);
                    }
                  }

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AdminPromptDetailsScreen(
                            prompt: model,
                            status: status,
                          ),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            model.imageUrl,
                            width: 72,
                            height: 72,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Container(
                              width: 72,
                              height: 72,
                              color: Colors.deepPurple.shade100,
                              child: const Icon(Icons.image, color: AppTheme.primaryColor),
                            ),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                model.title,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.textPrimary,
                                  height: 1.2,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'By ${model.creatorName}',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: AppTheme.textMuted,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '₹${model.price.toInt()}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.textPrimary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                    ),
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
