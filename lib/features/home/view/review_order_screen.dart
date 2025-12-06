import 'package:cleclo/utils/images/images.dart';
import 'package:cleclo/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:cleclo/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cleclo/routes/route_constants.dart';

class ReviewOrderScreen extends StatelessWidget {
  const ReviewOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          'Review Order',
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
                  // Item Card
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                         BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4)),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 60, height: 60,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE3F2FD), // Light Blue bg
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Image.asset(Images.tShirtWash), // Using placeholder
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Separate Wash', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                              const SizedBox(height: 4),
                              Text('Wash separately up to 12 Kg', style: TextStyle(color: Colors.grey.shade600, fontSize: 13)),
                            ],
                          ),
                        ),
                        const Text('₹210', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)), // Using Rupees currency
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Order Details Card
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                         BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4)),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Order Details', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        const SizedBox(height: 20),
                        _buildDetailRow(
                          icon: Icons.access_time_filled, iconColor: const Color(0xFFA5D6A7), iconContentColor: const Color(0xFF2E7D32),
                          label: 'Collection Time',
                          value: 'Today 11:00 AM',
                        ),
                        const SizedBox(height: 16),
                        _buildDetailRow(
                          icon: Icons.local_shipping, iconColor: const Color(0xFFBBDEFB), iconContentColor: const Color(0xFF1565C0),
                          label: 'Delivery Time',
                          value: 'Tomorrow 11:30 PM',
                        ),
                        const SizedBox(height: 16),
                        _buildDetailRow(
                          icon: Icons.location_on, iconColor: const Color(0xFFE1BEE7), iconContentColor: const Color(0xFF7B1FA2),
                          label: 'Delivery Address',
                          value: '2/4 Brucfield, London', // Keeping mock data
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Checkout Details
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                         BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4)),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Checkout Details', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        const SizedBox(height: 20),
                        _buildPriceRow('Service Charge', '₹210'),
                        const SizedBox(height: 12),
                        _buildPriceRow('Delivery', '₹50'),
                        const SizedBox(height: 20),
                        const Divider(),
                        const SizedBox(height: 12),
                        // Promo Code
                        Row(
                          children: [
                            const Icon(Icons.local_offer, color: Colors.orange, size: 20),
                            const SizedBox(width: 8),
                            Expanded(
                              child: TextField(
                                style: const TextStyle(fontSize: 14),
                                decoration: const InputDecoration(
                                  hintText: 'Enter Promo Code',
                                  border: InputBorder.none,
                                  isDense: true,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text('APPLY', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
                            )
                          ],
                        ),
                         const Divider(),
                         const SizedBox(height: 12),
                         _buildPriceRow('Subtotal', '₹260', isBold: true),
                      ],
                    ),
                  ),
                   const SizedBox(height: 80),
                ],
              ),
            ),
          ),
          
          // Bottom Payment Section
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -5)),
              ],
              borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: const [
                     Text('Total Amount', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1B263B))),
                     Text('₹430', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF1B263B))), // Mock Amount
                   ],
                 ),
                 const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                         context.push(RouteConstants.paymentScreen);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF388E3C),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'PAY NOW ₹430',
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
          )
        ],
      ),
    );
  }

  Widget _buildDetailRow({required IconData icon, required Color iconColor, required Color iconContentColor, required String label, required String value}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.3),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: iconContentColor, size: 20),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: TextStyle(color: Colors.grey.shade500, fontSize: 12)),
              const SizedBox(height: 4),
              Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF1B263B))),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPriceRow(String label, String price, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(color: isBold ? const Color(0xFF1B263B) : Colors.grey.shade600, fontSize: 16, fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
        Text(price, style: TextStyle(color: const Color(0xFF1B263B), fontSize: 16, fontWeight: isBold ? FontWeight.bold : FontWeight.w500)),
      ],
    );
  }
}
