import 'package:cleclo/utils/images/images.dart';
import 'package:cleclo/utils/theme/colors.dart';
import 'package:cleclo/routes/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  String _selectedCategory = 'Everyday Wear';

  // Category data with their services
  final Map<String, List<Map<String, dynamic>>> _categoryServices = {
    'Everyday Wear': [
      {
        'section': 'Top Services',
        'items': [
          {'image': 'assets/files/women/w-s-tshirt.png', 'name': 'T-Shirt', 'price': '20', 'category': 'Women'},
          {'image': 'assets/files/women/w-s-Jeans.jpg', 'name': 'Jeans', 'price': '30', 'category': 'Women'},
          {'image': 'assets/files/women/w-s-Shirt.jpg', 'name': 'Shirt', 'price': '25', 'category': 'Women'},
        ],
      },
      {
        'section': 'Men\'s Wear',
        'items': [
          {'image': 'assets/files/women/w-s-Shirt.jpg', 'name': 'Shirt', 'price': '30', 'category': 'Men'},
          {'image': 'assets/files/women/w-s-Jeans.jpg', 'name': 'Jeans', 'price': '35', 'category': 'Men'},
        ],
      },
    ],
    'Formal Wear': [
      {
        'section': 'Formal Services',
        'items': [
          {'image': 'assets/files/women/w-s-Ladies Suit Western.jpg', 'name': 'Suit', 'price': '150', 'category': 'Men'},
          {'image': 'assets/files/women/w-s-Shirt.jpg', 'name': 'Formal Shirt', 'price': '40', 'category': 'Men'},
          {'image': 'assets/files/women/w-s-Slacks.jpg', 'name': 'Trousers', 'price': '45', 'category': 'Men'},
        ],
      },
      {
        'section': 'Women\'s Formal',
        'items': [
          {'image': 'assets/files/women/w-s-Ladies Suit Western.jpg', 'name': 'Ladies Suit', 'price': '120', 'category': 'Women'},
          {'image': 'assets/files/women/w-s-Dress.jpg', 'name': 'Formal Dress', 'price': '80', 'category': 'Women'},
        ],
      },
    ],
    'Women\'s Wear': [
      {
        'section': 'Ethnic Wear',
        'items': [
          {'image': 'assets/files/women/w-s-Kameez.jpg', 'name': 'Kameez', 'price': '40', 'category': 'Women'},
          {'image': 'assets/files/women/w-s-Salwar.jpg', 'name': 'Salwar', 'price': '35', 'category': 'Women'},
          {'image': 'assets/files/women/w-s-Dupatta.jpg', 'name': 'Dupatta', 'price': '25', 'category': 'Women'},
          {'image': 'assets/files/women/w-s-Lehnga.jpg', 'name': 'Lehnga', 'price': '200', 'category': 'Women'},
        ],
      },
      {
        'section': 'Western Wear',
        'items': [
          {'image': 'assets/files/women/w-s-Dress.jpg', 'name': 'Dress', 'price': '60', 'category': 'Women'},
          {'image': 'assets/files/women/w-s-Skirt.jpg', 'name': 'Skirt', 'price': '40', 'category': 'Women'},
          {'image': 'assets/files/women/w-s-Jumpsuit.jpg', 'name': 'Jumpsuit', 'price': '70', 'category': 'Women'},
        ],
      },
      {
        'section': 'Accessories',
        'items': [
          {'image': 'assets/files/women/w-s-Scarf.jpg', 'name': 'Scarf', 'price': '20', 'category': 'Women'},
          {'image': 'assets/files/women/w-s-Stocking.jpg', 'name': 'Stocking', 'price': '15', 'category': 'Women'},
        ],
      },
    ],
    'Kids': [
      {
        'section': 'Boys',
        'items': [
          {'image': 'assets/files/kids/k-s-tshirt.jpg.jpg', 'name': 'T-Shirt', 'price': '15', 'category': 'Kids'},
          {'image': 'assets/files/kids/k-s-shorts.jpg', 'name': 'Shorts', 'price': '12', 'category': 'Kids'},
          {'image': 'assets/files/kids/k-s-jeans.jpg', 'name': 'Jeans', 'price': '20', 'category': 'Kids'},
        ],
      },
      {
        'section': 'Girls',
        'items': [
          {'image': 'assets/files/kids/k-s-dress.jpg', 'name': 'Dress', 'price': '25', 'category': 'Kids'},
          {'image': 'assets/files/kids/k-s-frock.jpg', 'name': 'Frock', 'price': '22', 'category': 'Kids'},
          {'image': 'assets/files/kids/k-s-skirt.jpg', 'name': 'Skirt', 'price': '18', 'category': 'Kids'},
        ],
      },
    ],
    'Household': [
      {
        'section': 'Bedding',
        'items': [
          {'image': 'assets/files/household/h-s-bedsheet.jpg', 'name': 'Bedsheet', 'price': '50', 'category': 'Household'},
          {'image': 'assets/files/household/h-s-pillow.jpg', 'name': 'Pillow Cover', 'price': '20', 'category': 'Household'},
          {'image': 'assets/files/household/h-s-blanket.jpg', 'name': 'Blanket', 'price': '100', 'category': 'Household'},
          {'image': 'assets/files/household/h-s-comforter.jpg', 'name': 'Comforter', 'price': '150', 'category': 'Household'},
        ],
      },
      {
        'section': 'Curtains & Towels',
        'items': [
          {'image': 'assets/files/household/h-s-curtain.jpg', 'name': 'Curtain', 'price': '80', 'category': 'Household'},
          {'image': 'assets/files/household/h-s-towel.jpg', 'name': 'Bath Towel', 'price': '30', 'category': 'Household'},
        ],
      },
    ],
  };

  List<Map<String, dynamic>> get _currentServices {
    return _categoryServices[_selectedCategory] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F9FA),
        elevation: 0,
        title: const Text(
          'Services',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.local_offer_outlined, color: Colors.black54),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xFFF0F2F5),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.search, color: Color(0xFF9E9E9E)),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Search for laundry services',
                        style: TextStyle(color: Color(0xFF9E9E9E)),
                      ),
                    ),
                    Icon(Icons.mic, color: Color(0xFF9E9E9E)),
                  ],
                ),
              ),
            ),

            // Categories
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: ['Everyday Wear', 'Formal Wear', 'Women\'s Wear', 'Kids', 'Household'].map((category) {
                  final isSelected = _selectedCategory == category;
                  return Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: GestureDetector(
                      onTap: () => setState(() => _selectedCategory = category),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: isSelected ? const Color(0xFF43A047) : const Color(0xFFE8F5E9),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          category,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black87,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 20),

            // Dynamic Content based on selected category
            ..._currentServices.map((section) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionHeader(section['section'] as String),
                  _buildHorizontalList(
                    (section['items'] as List).cast<Map<String, dynamic>>(),
                  ),
                  const SizedBox(height: 20),
                ],
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xFF1B263B),
        ),
      ),
    );
  }

  Widget _buildHorizontalList(List<Map<String, dynamic>> items) {
    return SizedBox(
      height: 170,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return GestureDetector(
            onTap: () {
              // Navigate to book service screen with the appropriate category
              final category = item['category'] as String;
              context.push('${RouteConstants.bookServiceScreen}?category=$category');
            },
            child: Container(
              width: 130,
              margin: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F5F5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          item['image'] as String,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          errorBuilder: (context, error, stackTrace) {
                            return const Center(
                              child: Icon(Icons.image, color: Colors.grey, size: 30),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item['name'] as String,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1B263B),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '₹${item['price']}',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF43A047),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Color(0xFFE8F5E9),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.add, size: 16, color: Color(0xFF43A047)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
