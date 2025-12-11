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

  // Women Items for Casual category
  final List<Map<String, dynamic>> _womenCasualItems = [
    {'name': 'T-Shirt', 'image': 'assets/files/women/w-s-tshirt.png', 'price': 5.00, 'quantity': 0},
    {'name': 'Capri', 'image': 'assets/files/women/w-s-Capri.png', 'price': 6.00, 'quantity': 0},
    {'name': 'Shirt', 'image': 'assets/files/women/w-s-Shirt.jpg', 'price': 12.00, 'quantity': 0},
    {'name': 'Slacks', 'image': 'assets/files/women/w-s-Slacks.jpg', 'price': 12.00, 'quantity': 0},
    {'name': 'Skirt', 'image': 'assets/files/women/w-s-Skirt.jpg', 'price': 12.00, 'quantity': 0},
    {'name': 'Dangree', 'image': 'assets/files/women/w-s-Dangree.jpg', 'price': 17.00, 'quantity': 0},
    {'name': 'Jumpsuit', 'image': 'assets/files/women/w-s-Jumpsuit.jpg', 'price': 12.00, 'quantity': 0},
    {'name': 'Women Top', 'image': 'assets/files/women/w-s-Women Top.jpg', 'price': 10.00, 'quantity': 0},
  ];

  // Women Items for Denim category
  final List<Map<String, dynamic>> _womenDenimItems = [
    {'name': 'Jeans', 'image': 'assets/files/women/w-s-Jeans.jpg', 'price': 12.00, 'quantity': 0},
    {'name': 'Dangree', 'image': 'assets/files/women/w-s-Dangree.jpg', 'price': 17.00, 'quantity': 0},
    {'name': 'Skirt', 'image': 'assets/files/women/w-s-Skirt.jpg', 'price': 12.00, 'quantity': 0},
  ];

  // Women Items for Active category
  final List<Map<String, dynamic>> _womenActiveItems = [
    {'name': 'T-Shirt', 'image': 'assets/files/women/w-s-tshirt.png', 'price': 5.00, 'quantity': 0},
    {'name': 'Capri', 'image': 'assets/files/women/w-s-Capri.png', 'price': 6.00, 'quantity': 0},
    {'name': 'Jumpsuit', 'image': 'assets/files/women/w-s-Jumpsuit.jpg', 'price': 12.00, 'quantity': 0},
    {'name': 'Women Leggings', 'image': 'assets/files/women/w-s-Women Leggings.jpg', 'price': 8.00, 'quantity': 0},
  ];

  // Women Items for Hosiery category
  final List<Map<String, dynamic>> _womenHosieryItems = [
    {'name': 'Stocking', 'image': 'assets/files/women/w-s-Stocking.jpg', 'price': 8.00, 'quantity': 0},
    {'name': 'Women Leggings', 'image': 'assets/files/women/w-s-Women Leggings.jpg', 'price': 8.00, 'quantity': 0},
    {'name': 'Capri', 'image': 'assets/files/women/w-s-Capri.png', 'price': 6.00, 'quantity': 0},
  ];

  // Women Items for Bottoms category
  final List<Map<String, dynamic>> _womenBottomsItems = [
    {'name': 'Jeans', 'image': 'assets/files/women/w-s-Jeans.jpg', 'price': 12.00, 'quantity': 0},
    {'name': 'Capri', 'image': 'assets/files/women/w-s-Capri.png', 'price': 6.00, 'quantity': 0},
    {'name': 'Slacks', 'image': 'assets/files/women/w-s-Slacks.jpg', 'price': 12.00, 'quantity': 0},
    {'name': 'Skirt', 'image': 'assets/files/women/w-s-Skirt.jpg', 'price': 12.00, 'quantity': 0},
    {'name': 'Skirt Long', 'image': 'assets/files/women/w-s-Skirt Long.jpg', 'price': 12.00, 'quantity': 0},
    {'name': 'Women Leggings', 'image': 'assets/files/women/w-s-Women Leggings.jpg', 'price': 8.00, 'quantity': 0},
    {'name': 'Petticoat', 'image': 'assets/files/women/w-s-Petticoat.jpg', 'price': 10.00, 'quantity': 0},
  ];

  // Women Items for Tops category
  final List<Map<String, dynamic>> _womenTopsItems = [
    {'name': 'T-Shirt', 'image': 'assets/files/women/w-s-tshirt.png', 'price': 5.00, 'quantity': 0},
    {'name': 'Shirt', 'image': 'assets/files/women/w-s-Shirt.jpg', 'price': 12.00, 'quantity': 0},
    {'name': 'Women Top', 'image': 'assets/files/women/w-s-Women Top.jpg', 'price': 10.00, 'quantity': 0},
    {'name': 'Kameez', 'image': 'assets/files/women/w-s-Kameez.jpg', 'price': 15.00, 'quantity': 0},
  ];

  // Women Items for Formal category
  final List<Map<String, dynamic>> _womenFormalItems = [
    {'name': 'Shirt', 'image': 'assets/files/women/w-s-Shirt.jpg', 'price': 12.00, 'quantity': 0},
    {'name': 'Slacks', 'image': 'assets/files/women/w-s-Slacks.jpg', 'price': 12.00, 'quantity': 0},
    {'name': 'Skirt', 'image': 'assets/files/women/w-s-Skirt.jpg', 'price': 12.00, 'quantity': 0},
    {'name': 'Ladies Suit Western', 'image': 'assets/files/women/w-s-Ladies Suit Western.jpg', 'price': 25.00, 'quantity': 0},
    {'name': 'Dress', 'image': 'assets/files/women/w-s-Dress.jpg', 'price': 18.00, 'quantity': 0},
  ];

  // Women Items for Swimwear category
  final List<Map<String, dynamic>> _womenSwimwearItems = [
    {'name': 'Bikini', 'image': 'assets/files/women/w-s-Bikini.jpg', 'price': 15.00, 'quantity': 0},
    {'name': 'Jumpsuit', 'image': 'assets/files/women/w-s-Jumpsuit.jpg', 'price': 12.00, 'quantity': 0},
  ];

  // Women Items for Basics category
  final List<Map<String, dynamic>> _womenBasicsItems = [
    {'name': 'T-Shirt', 'image': 'assets/files/women/w-s-tshirt.png', 'price': 5.00, 'quantity': 0},
    {'name': 'Shirt', 'image': 'assets/files/women/w-s-Shirt.jpg', 'price': 12.00, 'quantity': 0},
    {'name': 'Slacks', 'image': 'assets/files/women/w-s-Slacks.jpg', 'price': 12.00, 'quantity': 0},
    {'name': 'Women Top', 'image': 'assets/files/women/w-s-Women Top.jpg', 'price': 10.00, 'quantity': 0},
    {'name': 'Petticoat', 'image': 'assets/files/women/w-s-Petticoat.jpg', 'price': 10.00, 'quantity': 0},
  ];

  // Women Items for Ethnic Wear category
  final List<Map<String, dynamic>> _womenEthnicWearItems = [
    {'name': 'Kameez', 'image': 'assets/files/women/w-s-Kameez.jpg', 'price': 15.00, 'quantity': 0},
    {'name': 'Salwar', 'image': 'assets/files/women/w-s-Salwar.jpg', 'price': 12.00, 'quantity': 0},
    {'name': 'Lehnga', 'image': 'assets/files/women/w-s-Lehnga.jpg', 'price': 35.00, 'quantity': 0},
    {'name': 'Dupatta', 'image': 'assets/files/women/w-s-Dupatta.jpg', 'price': 8.00, 'quantity': 0},
    {'name': 'Gown', 'image': 'assets/files/women/w-s-Gown.jpg', 'price': 30.00, 'quantity': 0},
    {'name': 'Dress Long', 'image': 'assets/files/women/w-s-Dress Long.jpg', 'price': 22.00, 'quantity': 0},
  ];

  // Women Items for Embellished category
  final List<Map<String, dynamic>> _womenEmbellishedItems = [
    {'name': 'Kameez Embellishment', 'image': 'assets/files/women/w-s-Kameez Embellishment.jpg', 'price': 25.00, 'quantity': 0},
    {'name': 'Salwar Embellishment', 'image': 'assets/files/women/w-s-Salwar Embellishment.jpg', 'price': 20.00, 'quantity': 0},
    {'name': 'Plazzo Embellishment', 'image': 'assets/files/women/w-s-Plazzo Embellishment.jpg', 'price': 22.00, 'quantity': 0},
    {'name': 'Lehnga', 'image': 'assets/files/women/w-s-Lehnga.jpg', 'price': 35.00, 'quantity': 0},
    {'name': 'Gown', 'image': 'assets/files/women/w-s-Gown.jpg', 'price': 30.00, 'quantity': 0},
  ];

  // Women Items for Accessories category
  final List<Map<String, dynamic>> _womenAccessoriesItems = [
    {'name': 'Scarf', 'image': 'assets/files/women/w-s-Scarf.jpg', 'price': 8.00, 'quantity': 0},
    {'name': 'Dupatta', 'image': 'assets/files/women/w-s-Dupatta.jpg', 'price': 8.00, 'quantity': 0},
    {'name': 'Handgloves', 'image': 'assets/files/women/w-s-Handgloves.png', 'price': 6.00, 'quantity': 0},
    {'name': 'Stocking', 'image': 'assets/files/women/w-s-Stocking.jpg', 'price': 8.00, 'quantity': 0},
  ];

  // Women Items for Outerwear category
  final List<Map<String, dynamic>> _womenOuterwearItems = [
    {'name': 'Cardigan', 'image': 'assets/files/women/w-s-Cardigan.jpg', 'price': 18.00, 'quantity': 0},
    {'name': 'Jumper', 'image': 'assets/files/women/w-s-Jumper.jpg', 'price': 20.00, 'quantity': 0},
    {'name': 'Pullover', 'image': 'assets/files/women/w-s-Pullover.jpg', 'price': 15.00, 'quantity': 0},
    {'name': 'Jumpsuit', 'image': 'assets/files/women/w-s-Jumpsuit.jpg', 'price': 12.00, 'quantity': 0},
  ];

  // Women Items for Knitwear category
  final List<Map<String, dynamic>> _womenKnitwearItems = [
    {'name': 'Cardigan', 'image': 'assets/files/women/w-s-Cardigan.jpg', 'price': 18.00, 'quantity': 0},
    {'name': 'Pullover', 'image': 'assets/files/women/w-s-Pullover.jpg', 'price': 15.00, 'quantity': 0},
    {'name': 'Jumper', 'image': 'assets/files/women/w-s-Jumper.jpg', 'price': 20.00, 'quantity': 0},
    {'name': 'Scarf', 'image': 'assets/files/women/w-s-Scarf.jpg', 'price': 8.00, 'quantity': 0},
  ];

  // Women Items for Western category
  final List<Map<String, dynamic>> _womenWesternItems = [
    {'name': 'Jeans', 'image': 'assets/files/women/w-s-Jeans.jpg', 'price': 12.00, 'quantity': 0},
    {'name': 'T-Shirt', 'image': 'assets/files/women/w-s-tshirt.png', 'price': 5.00, 'quantity': 0},
    {'name': 'Ladies Suit Western', 'image': 'assets/files/women/w-s-Ladies Suit Western.jpg', 'price': 25.00, 'quantity': 0},
    {'name': 'Dress', 'image': 'assets/files/women/w-s-Dress.jpg', 'price': 18.00, 'quantity': 0},
    {'name': 'Skirt', 'image': 'assets/files/women/w-s-Skirt.jpg', 'price': 12.00, 'quantity': 0},
  ];

  List<Map<String, dynamic>> get _currentItems {
    if (_selectedMainCategory == 'Women') {
      switch (_selectedSubCategory) {
        case 'Casual':
          return _womenCasualItems;
        case 'Denim':
          return _womenDenimItems;
        case 'Active':
          return _womenActiveItems;
        case 'Hosiery':
          return _womenHosieryItems;
        case 'Bottoms':
          return _womenBottomsItems;
        case 'Tops':
          return _womenTopsItems;
        case 'Formal':
          return _womenFormalItems;
        case 'Swimwear':
          return _womenSwimwearItems;
        case 'Basics':
          return _womenBasicsItems;
        case 'Ethnic Wear':
          return _womenEthnicWearItems;
        case 'Embellished':
          return _womenEmbellishedItems;
        case 'Accessories':
          return _womenAccessoriesItems;
        case 'Outerwear':
          return _womenOuterwearItems;
        case 'Knitwear':
          return _womenKnitwearItems;
        case 'Western':
          return _womenWesternItems;
        default:
          return _womenCasualItems;
      }
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
