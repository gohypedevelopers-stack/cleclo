import 'package:cleclo/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cleclo/routes/route_constants.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  // 0: Credit/Debit Card, 1: Net Banking, 2: UPI, 3: COD
  int _selectedMethod = 0; 
  bool _saveCard = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA), // Light grey background
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F9FA),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black54),
          onPressed: () => context.pop(),
        ),
        centerTitle: true,
        title: const Text(
          'Payment',
          style: TextStyle(
            color: Color(0xFF1B263B), // Dark blue/black
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Total Amount Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: const [
                  Text(
                    'Total Amount',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '₹430',
                    style: TextStyle(
                      color: Color(0xFF1B263B), // Dark blue/black
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            
            // "Select a Payment Method" Label
            const Text(
              'Select a Payment Method',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1B263B),
              ),
            ),
            const SizedBox(height: 16),

            // Credit/Debit Card (Expanded)
            _buildPaymentMethodOption(
              index: 0,
              icon: Icons.credit_card,
              label: 'Credit/Debit Card',
              isExpanded: _selectedMethod == 0,
              content: Column(
                children: [
                   const SizedBox(height: 16),
                   // Card Number
                   TextField(
                     decoration: InputDecoration(
                       filled: true,
                       fillColor: const Color(0xFFF5F5F5),
                       hintText: 'Card Number',
                       hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 13),
                       border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(12),
                         borderSide: BorderSide.none,
                       ),
                       contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                     ),
                   ),
                   const SizedBox(height: 12),
                   // MM/YY & CVV
                   Row(
                     children: [
                       Expanded(
                         child: TextField(
                           decoration: InputDecoration(
                             filled: true,
                             fillColor: const Color(0xFFF5F5F5),
                             hintText: 'MM/YY',
                             hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 13),
                             border: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(12),
                               borderSide: BorderSide.none,
                             ),
                             contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                           ),
                         ),
                       ),
                       const SizedBox(width: 12),
                       Expanded(
                         child: TextField(
                           decoration: InputDecoration(
                             filled: true,
                             fillColor: const Color(0xFFF5F5F5),
                             hintText: 'CVV',
                             hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 13),
                             border: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(12),
                               borderSide: BorderSide.none,
                             ),
                             contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                           ),
                         ),
                       ),
                     ],
                   ),
                   const SizedBox(height: 12),
                   // Save Card Checkbox
                   Row(
                     children: [
                       SizedBox(
                         width: 24,
                         height: 24,
                         child: Checkbox(
                           value: _saveCard, 
                           onChanged: (val) => setState(() => _saveCard = val!),
                           activeColor: const Color(0xFF388E3C),
                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                           side: BorderSide(color: Colors.grey.shade600),
                         ),
                       ),
                       const SizedBox(width: 10),
                       Text('Save this card for future payments', style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
                     ],
                   ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Net Banking
             _buildPaymentMethodOption(
              index: 1,
              icon: Icons.account_balance,
              label: 'Net Banking',
              isExpanded: _selectedMethod == 1,
            ),
            const SizedBox(height: 16),

            // UPI
             _buildPaymentMethodOption(
              index: 2,
              icon: Icons.qr_code,
              label: 'UPI',
              isExpanded: _selectedMethod == 2,
            ),
            const SizedBox(height: 16),

            // Cash on Delivery
             _buildPaymentMethodOption(
              index: 3,
              icon: Icons.money,
              label: 'Cash on Delivery',
              isExpanded: _selectedMethod == 3,
            ),
            
            const SizedBox(height: 40),

            // Pay Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                   context.push(RouteConstants.bookingSuccessScreen);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF388E3C), // Green
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Pay ₹430',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
             const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethodOption({
    required int index,
    required IconData icon,
    required String label,
    required bool isExpanded,
    Widget? content,
  }) {
    return GestureDetector(
      onTap: () => setState(() => _selectedMethod = index),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: isExpanded ? Border.all(color: const Color(0xFF00E676), width: 1.5) : null, // Bright green border
          boxShadow: [
             if (!isExpanded) BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4)),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                // Icon Circle
                Container(
                  padding: const EdgeInsets.all(8),
                   decoration: BoxDecoration(
                     color: Colors.grey.shade100,
                     shape: BoxShape.circle,
                   ),
                   child: Icon(icon, color: Colors.black87, size: 20),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    label,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.black87,
                    ),
                  ),
                ),
                // Custom Radio
                Container(
                  width: 22, height: 22,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: isExpanded ? const Color(0xFF2962FF) : Colors.grey.shade400, width: 2), // Blue border for radio
                  ), // Wait, screenshot has Blue filled with white check or just Blue dot? 
                  // Screen shows: Blue filled circle with a white dot inside? Or blue border with blue dot?
                  // Actually looks like standard radio but custom colored. 
                  // I'll stick to Blue Selected state.
                  child: isExpanded 
                    ? Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color(0xFF2962FF), // Blue dot
                            shape: BoxShape.circle,
                          ),
                        ),
                      )
                    : null,
                ),
              ],
            ),
            if (isExpanded && content != null) content,
          ],
        ),
      ),
    );
  }
}
