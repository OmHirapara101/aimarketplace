class PromptModel {
  final String id;
  final String title;
  final String category;
  final String description;
  final double price;
  final double rating;
  final int reviewsCount;
  final int salesCount;
  final String creatorName;
  final String creatorRole;
  final String imageUrl;
  bool isFavorite;

  PromptModel({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.price,
    required this.rating,
    required this.reviewsCount,
    required this.salesCount,
    required this.creatorName,
    required this.creatorRole,
    required this.imageUrl,
    this.isFavorite = false,
  });

  static List<PromptModel> samplePrompts = [
    PromptModel(
      id: 'p1',
      title: 'Ultimate ChatGPT Prompt Bundle',
      category: 'ChatGPT',
      description:
          'A comprehensive collection of 500+ ChatGPT prompts for writing, productivity, coding, marketing and more.',
      price: 299,
      rating: 4.8,
      reviewsCount: 320,
      salesCount: 1200,
      creatorName: 'Alex Carter',
      creatorRole: 'Top Creator',
      imageUrl: 'https://images.unsplash.com/photo-1618005182384-a83a8bd57fbe?auto=format&fit=crop&w=600&q=80',
      isFavorite: true,
    ),
    PromptModel(
      id: 'p2',
      title: 'Midjourney Master Collection',
      category: 'Midjourney',
      description: 'Unlock stunning AI generated art with over 300+ battle-tested Midjourney v6 prompts and styles.',
      price: 199,
      rating: 4.7,
      reviewsCount: 210,
      salesCount: 850,
      creatorName: 'Sophia Lin',
      creatorRole: 'AI Artist',
      imageUrl: 'https://images.unsplash.com/photo-1634017839464-5c339ebe3cb4?auto=format&fit=crop&w=600&q=80',
      isFavorite: true,
    ),
    PromptModel(
      id: 'p3',
      title: 'Coding Assistant Prompts',
      category: 'Claude',
      description: 'Accelerate your development workflow with specialized code generation, refactoring, and debugging prompts.',
      price: 179,
      rating: 4.6,
      reviewsCount: 145,
      salesCount: 620,
      creatorName: 'David Miller',
      creatorRole: 'Dev Expert',
      imageUrl: 'https://images.unsplash.com/photo-1555066931-4365d14bab8c?auto=format&fit=crop&w=600&q=80',
      isFavorite: false,
    ),
    PromptModel(
      id: 'p4',
      title: 'Creative Writing Prompts',
      category: 'ChatGPT',
      description: 'Engaging prompts for storytelling, novel writing, character creation, and essay structuring.',
      price: 179,
      rating: 4.6,
      reviewsCount: 98,
      salesCount: 410,
      creatorName: 'Emma Watson',
      creatorRole: 'Pro Author',
      imageUrl: 'https://images.unsplash.com/photo-1455390582262-044cdead277a?auto=format&fit=crop&w=600&q=80',
      isFavorite: true,
    ),
    PromptModel(
      id: 'p5',
      title: 'Business Prompts pack',
      category: 'ChatGPT',
      description: 'Streamline business operations, executive emails, strategy proposals, and market analysis.',
      price: 199,
      rating: 4.7,
      reviewsCount: 180,
      salesCount: 790,
      creatorName: 'Robert Vance',
      creatorRole: 'Biz Strategist',
      imageUrl: 'https://images.unsplash.com/photo-1460925895917-afdab827c52f?auto=format&fit=crop&w=600&q=80',
      isFavorite: true,
    ),
    PromptModel(
      id: 'p6',
      title: 'Marketing Prompts 2.0',
      category: 'Claude',
      description: 'High converting ad copies, email newsletters, social media captions, and SEO content templates.',
      price: 199,
      rating: 4.8,
      reviewsCount: 230,
      salesCount: 940,
      creatorName: 'Sarah Jenkins',
      creatorRole: 'Marketing Guru',
      imageUrl: 'https://images.unsplash.com/photo-1533750349088-cd871a92f312?auto=format&fit=crop&w=600&q=80',
      isFavorite: true,
    ),
    PromptModel(
      id: 'p7',
      title: 'Writing Prompts Mega Pack',
      category: 'ChatGPT',
      description: 'Ultimate library for copywriters, bloggers, and content creators looking for consistent quality.',
      price: 199,
      rating: 4.6,
      reviewsCount: 112,
      salesCount: 520,
      creatorName: 'Liam Evans',
      creatorRole: 'Content Strategist',
      imageUrl: 'https://images.unsplash.com/photo-1519389950473-47ba0277781c?auto=format&fit=crop&w=600&q=80',
      isFavorite: true,
    ),
  ];
}
