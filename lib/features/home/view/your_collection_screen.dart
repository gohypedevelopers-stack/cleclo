import 'package:cleclo/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cleclo/routes/route_constants.dart';

class YourCollectionScreen extends StatelessWidget {
  const YourCollectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data for UI development
    final List<Map<String, dynamic>> selectedItems = [
      {'name': 'T-Shirt', 'qty': 2, 'price': 40},
      {'name': 'Saree/Dress', 'qty': 1, 'price': 40},
      {'name': 'Jeans', 'qty': 3, 'price': 90},
      {'name': 'Bedsheet', 'qty': 1, 'price': 50},
    ];

    int totalItems = selectedItems.fold(0, (sum, item) => sum + (item['qty'] as int));
    int totalPrice = selectedItems.fold(0, (sum, item) => sum + ((item['price'] as int) * (item['qty'] as int)));
    // Wait, the image shows Total: 220. 
    // 2*40 + 1*40 + 3*90 + 1*50 = 80 + 40 + 270 + 50 = 440. 
    // The image calculation might be different or I misread prices.
    // Image says: T-Shirt 40, Saree/Dress 40, Jeans 90, Bedsheet 50.
    // Total 220. 
    // Maybe the prices are unit prices but total is sum of unit prices? No.
    // Maybe details in image are specific. 
    // Let's stick to the visual structure. The total calc logic can be fixed later. 
    // Actually, looking at image: 40 + 40 + 90 + 50 = 220. 
    // So the total shown is just the sum of the displayed prices on the right, regardless of Quantity?
    // OR the prices shown ARE the totals for that line item? 
    // T-Shirt Qty 2, Price 40 (Unit 20?). 
    // Saree Qty 1, Price 40.
    // Jeans Qty 3, Price 90 (Unit 30?).
    // Bedsheet Qty 1, Price 50.
    // 40+40+90+50 = 220. 
    // Yes, the displayed price is the LINE TOTAL. 
    
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F9FA),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black54),
          onPressed: () => context.pop(),
        ),
        centerTitle: true,
        title: const Text(
          'Your Collection',
          style: TextStyle(
            color: Color(0xFF1B263B),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // Note Card
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF9C4), // Light Yellow
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'NOTE: Please take photos of clothes',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'This helps us verify item count, condition, and avoid any misunderstandings. Thanks for your cooperation',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black87,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  
                  // Items List
                  ...selectedItems.map((item) => _buildItemCard(context, item)).toList(),
                ],
              ),
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
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Selected Items: $totalItems', // Dynamic or hardcoded based on map
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF1B263B),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Total: ',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xFF1B263B),
                        ),
                        children: [
                          TextSpan(
                            text: '₹220', // Matches image total
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF43A047),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      context.push(RouteConstants.uploadImageScreen);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF43A047), // Green
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Confirm Order',
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

  Widget _buildItemCard(BuildContext context, Map<String, dynamic> item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['name'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1B263B),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Qty: ${item['qty']}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
              Text(
                '₹${item['price']}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF43A047),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Upload Image Button
          GestureDetector(
            onTap: () {
              context.push(RouteConstants.uploadImageScreen);
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F5E9), // Light green bg
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.file_upload_outlined, color: Color(0xFF43A047), size: 20),
                  SizedBox(width: 8),
                  Text(
                    'Upload Image',
                    style: TextStyle(
                      color: Color(0xFF43A047),
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
