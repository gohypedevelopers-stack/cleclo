import 'package:cleclo/routes/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookServiceScreen extends StatefulWidget {
  const BookServiceScreen({super.key});

  @override
  State<BookServiceScreen> createState() => _BookServiceScreenState();
}

class _BookServiceScreenState extends State<BookServiceScreen> {
  String _selectedMainCategory = 'Women';
  String _selectedSubCategory = 'Casual';

  // Women Categories with images (w-xx.jpg format)
  final List<Map<String, String>> _womenCategories = [
    {'name': 'Casual', 'image': 'assets/files/women/w-casual.png'},
    {'name': 'Denim', 'image': 'assets/files/women/w-denim.jpg'},
    {'name': 'Active', 'image': 'assets/files/women/w-active.jpg'},
    {'name': 'Hosiery', 'image': 'assets/files/women/w-Hosiery.jpg'},
    {'name': 'Swimwear', 'image': 'assets/files/women/w- Swimwear.jpg'},
    {'name': 'Bottoms', 'image': 'assets/files/women/w-Bottoms.jpg'},
    {'name': 'Basics', 'image': 'assets/files/women/w-Basics.jpg'},
    {'name': 'Tops', 'image': 'assets/files/women/w-Tops.jpg'},
    {'name': 'Formal', 'image': 'assets/files/women/w-Formal.jpg'},
    {'name': 'Ethnic Wear', 'image': 'assets/files/women/w- Ethnic Wear.jpg'},
    {'name': 'Embellished', 'image': 'assets/files/women/w- Embellished.jpg'},
    {'name': 'Accessories', 'image': 'assets/files/women/w-Accessories.jpg'},
    {'name': 'Outerwear', 'image': 'assets/files/women/w-Outerwear.jpg'},
    {'name': 'Knitwear', 'image': 'assets/files/women/w-Knitwear.jpg'},
    {'name': 'Western', 'image': 'assets/files/women/w-Western.jpg'},
  ];

  // Women Items for Casual category (w-s-xxx.jpg format)
  final List<Map<String, dynamic>> _womenCasualItems = [
    {'name': 'T-Shirt', 'image': 'assets/files/women/w-s-tshirt.png', 'price': 5.00, 'quantity': 0},
    {'name': 'Capri', 'image': 'assets/files/women/w-s-Capri.png', 'price': 6.00, 'quantity': 0},
    {'name': 'Shirt', 'image': 'assets/files/women/w-s-Shirt.jpg', 'price': 12.00, 'quantity': 0},
    {'name': 'Slacks', 'image': 'assets/files/women/w-s-Slacks.jpg', 'price': 12.00, 'quantity': 0},
    {'name': 'Skirt', 'image': 'assets/files/women/w-s-Skirt.jpg', 'price': 12.00, 'quantity': 0},
    {'name': 'Dangree', 'image': 'assets/files/women/w-s-Dangree.jpg', 'price': 17.00, 'quantity': 0},
    {'name': 'Jumpsuit', 'image': 'assets/files/women/w-s-Jumpsuit.jpg', 'price': 12.00, 'quantity': 0},
    {'name': 'Skirt Long', 'image': 'assets/files/women/w-s-Skirt Long.jpg', 'price': 12.00, 'quantity': 0},
  ];

  List<Map<String, dynamic>> get _currentItems {
    // For now, return casual items for Women category
    if (_selectedMainCategory == 'Women') {
      return _womenCasualItems;
    }
    return _womenCasualItems; // Default
  }

  @override
  Widget build(BuildContext context) {
    int selectedCount = _currentItems.fold(0, (sum, item) => sum + (item['quantity'] as int));
    double totalAmount = _currentItems.fold(0, (sum, item) => sum + (item['quantity'] as int) * (item['price'] as double));

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F9FA),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black54, size: 20),
          onPressed: () => context.pop(),
        ),
        centerTitle: true,
        title: const Text(
          'Book Now',
          style: TextStyle(
            color: Color(0xFF1B5E20),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Row(
                children: const [
                  Icon(Icons.search, color: Color(0xFFBDBDBD)),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Search for laundry services',
                      style: TextStyle(color: Color(0xFFBDBDBD)),
                    ),
                  ),
                  Icon(Icons.mic, color: Color(0xFFBDBDBD)),
                ],
              ),
            ),
          ),

          // Main Categories (Men, Women, Kids, Household, Institutions, Others)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: ['Men', 'Women', 'Kids', 'Household', 'Institutions', 'Others'].map((category) {
                  final isSelected = _selectedMainCategory == category;
                  return Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: GestureDetector(
                      onTap: () => setState(() => _selectedMainCategory = category),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                          border: isSelected 
                            ? Border.all(color: const Color(0xFF43A047), width: 1.5)
                            : null,
                        ),
                        child: Text(
                          category,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: isSelected ? const Color(0xFF43A047) : Colors.black54,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),

          // Sub-Categories (Horizontal scroll with images) - Women categories
          if (_selectedMainCategory == 'Women')
            SizedBox(
              height: 140,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                itemCount: _womenCategories.length,
                itemBuilder: (context, index) {
                  final category = _womenCategories[index];
                  final isSelected = _selectedSubCategory == category['name'];
                  return GestureDetector(
                    onTap: () => setState(() => _selectedSubCategory = category['name']!),
                    child: Container(
                      width: 95,
                      margin: const EdgeInsets.only(right: 12),
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isSelected 
                              ? const Color(0xFF43A047) 
                              : const Color(0xFFE8E8E8),
                          width: isSelected ? 2 : 1,
                        ),
                      ),
                      child: Column(
                        children: [
                          // Image container inside the bordered card
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF5F5F5),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  category['image']!,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Center(
                                      child: Icon(Icons.image, color: Colors.grey),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 6),
                          // Label inside the bordered card
                          Text(
                            category['name']!,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

          // Items List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              itemCount: _currentItems.length,
              itemBuilder: (context, index) {
                final item = _currentItems[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.03),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      // Item Image
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            item['image'],
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const Center(
                                child: Icon(Icons.image, color: Colors.grey, size: 24),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      // Item Details
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['name'],
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF1B5E20),
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              '₹${item['price'].toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontSize: 13,
                                color: Color(0xFF43A047),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Quantity Counter
                      Row(
                        children: [
                          _buildCounterButton(
                            icon: Icons.remove,
                            onTap: () {
                              if (item['quantity'] > 0) {
                                setState(() => item['quantity']--);
                              }
                            },
                          ),
                          SizedBox(
                            width: 32,
                            child: Text(
                              '${item['quantity']}',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          _buildCounterButton(
                            icon: Icons.add,
                            isAdd: true,
                            onTap: () {
                              setState(() => item['quantity']++);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Bottom Bar
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Selected Items: $selectedCount',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      'Total: ₹${totalAmount.toStringAsFixed(0)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1B5E20),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      context.push(RouteConstants.yourCollectionScreen);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF43A047),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Select Items',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCounterButton({required IconData icon, required VoidCallback onTap, bool isAdd = false}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: isAdd ? const Color(0xFF43A047) : const Color(0xFFF5F5F5),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 18,
          color: isAdd ? Colors.white : Colors.grey,
        ),
      ),
    );
  }
}
