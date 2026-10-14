import 'package:flutter/material.dart';
import '../../common/theme/app_theme.dart';
import '../../common/models/prompt_model.dart';
import '../../common/widgets/custom_button.dart';

class EditPromptScreen extends StatefulWidget {
  final PromptModel? prompt;

  const EditPromptScreen({
    super.key,
    this.prompt,
  });

  @override
  State<EditPromptScreen> createState() => _EditPromptScreenState();
}

class _EditPromptScreenState extends State<EditPromptScreen> {
  late TextEditingController _titleController;
  late TextEditingController _priceController;
  late TextEditingController _descriptionController;
  late TextEditingController _contentController;

  String? _selectedCategory;
  final List<String> _categories = ['ChatGPT', 'Midjourney', 'Claude', 'DALL-E', 'Gemini'];

  @override
  void initState() {
    super.initState();
    final p = widget.prompt ?? PromptModel.samplePrompts.first;
    _titleController = TextEditingController(text: p.title);
    _priceController = TextEditingController(text: p.price.toInt().toString());
    _descriptionController = TextEditingController(text: p.description);
    _contentController = TextEditingController(text: 'Detailed prompt content text goes here...');
    _selectedCategory = _categories.contains(p.category) ? p.category : 'ChatGPT';
  }

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
          'Edit Prompt',
          style: TextStyle(
            color: AppTheme.textPrimary,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Edit Cover Image Box
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  height: 140,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0xFFE2E8F0),
                      width: 1.5,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: AppTheme.primaryColor.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.cloud_upload_outlined,
                          color: AppTheme.primaryColor,
                          size: 26,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Edit Cover Image',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 2),
                      const Text(
                        '(Recommended 16.9)',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppTheme.textMuted,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Prompt Title
              _buildFormLabel('Prompt Title'),
              _buildInputField(
                controller: _titleController,
                hintText: 'Enter prompt title',
              ),
              const SizedBox(height: 16),

              // Category Dropdown
              _buildFormLabel('Category'),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedCategory,
                    hint: const Text(
                      'Select category',
                      style: TextStyle(color: AppTheme.textMuted, fontSize: 14),
                    ),
                    isExpanded: true,
                    icon: const Icon(Icons.keyboard_arrow_down_rounded, color: AppTheme.textPrimary),
                    items: _categories.map((String cat) {
                      return DropdownMenuItem<String>(
                        value: cat,
                        child: Text(
                          cat,
                          style: const TextStyle(fontSize: 14, color: AppTheme.textPrimary),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? val) {
                      setState(() {
                        _selectedCategory = val;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Price(₹)
              _buildFormLabel('Price(₹)'),
              _buildInputField(
                controller: _priceController,
                hintText: 'Enter price',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),

              // Description
              _buildFormLabel('Description'),
              _buildInputField(
                controller: _descriptionController,
                hintText: 'Enter description',
                maxLines: 2,
              ),
              const SizedBox(height: 16),

              // Prompt Content
              _buildFormLabel('Prompt Content'),
              _buildInputField(
                controller: _contentController,
                hintText: 'Enter prompt content here..',
                maxLines: 3,
              ),
              const SizedBox(height: 28),

              // Update Prompts Button
              CustomButton(
                text: 'Update Prompts',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Prompt updated successfully!'),
                      backgroundColor: AppTheme.successColor,
                    ),
                  );
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppTheme.textPrimary,
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String hintText,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      style: const TextStyle(fontSize: 14, color: AppTheme.textPrimary),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: AppTheme.textMuted, fontSize: 14),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppTheme.primaryColor, width: 1.5),
        ),
      ),
    );
  }
}
