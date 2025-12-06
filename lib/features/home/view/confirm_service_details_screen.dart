import 'package:cleclo/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cleclo/routes/route_constants.dart';

class ConfirmServiceDetailsScreen extends StatefulWidget {
  const ConfirmServiceDetailsScreen({super.key});

  @override
  State<ConfirmServiceDetailsScreen> createState() => _ConfirmServiceDetailsScreenState();
}

class _ConfirmServiceDetailsScreenState extends State<ConfirmServiceDetailsScreen> {
  String _selectedWashType = 'Dry Clean';
  String _selectedServiceTime = '48 Hours (Standard)';

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
          'Confirm Service Details',
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Selected Items Card
                   Container(
                     padding: const EdgeInsets.all(20),
                     decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(25),
                       boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                            ),
                       ],
                     ),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                          const Text('Selected Items', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          const SizedBox(height: 16),
                          _buildSummaryRow('T-Shirt × 2', '₹40'),
                          const SizedBox(height: 12),
                          const Divider(),
                          const SizedBox(height: 12),
                          _buildSummaryRow('Jeans × 1', '₹50'),
                          const SizedBox(height: 12),
                          const Divider(),
                          const SizedBox(height: 12),
                          _buildSummaryRow('Bed Sheet × 1', '₹30'),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Total', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                              Text('₹120', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF43A047))),
                            ],
                          ),
                       ],
                     ),
                   ),
                   const SizedBox(height: 24),

                   // Choose Wash Type
                   const Text('Choose Wash Type', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                   const SizedBox(height: 16),
                   _buildWashTypeOption(
                     icon: Icons.water_drop, 
                     title: 'Wash Only', 
                     subtitle: 'Regular wash service', 
                     value: 'Wash Only',
                   ),
                   const SizedBox(height: 12),
                   _buildWashTypeOption(
                     icon: Icons.dry_cleaning, // Or custom icon like hanger
                     title: 'Dry Clean', 
                     subtitle: 'For delicate fabrics', 
                     value: 'Dry Clean',
                   ),
                   const SizedBox(height: 12),
                   _buildWashTypeOption(
                     icon: Icons.iron, 
                     title: 'Wash & Iron', 
                     subtitle: 'Complete care', 
                     value: 'Wash & Iron',
                   ),
                   const SizedBox(height: 24),

                   // Service Time
                   const Text('Service Time', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                   const Text('Choose delivery turnaround', style: TextStyle(color: Colors.grey, fontSize: 12)),
                   const SizedBox(height: 16),
                   Wrap(
                     spacing: 12,
                     runSpacing: 12,
                     children: [
                       _buildServiceTimeChip('24 Hours (Express)'),
                       _buildServiceTimeChip('48 Hours (Standard)'),
                       _buildServiceTimeChip('72 Hours (Economy)'),
                     ],
                   ),
                   const SizedBox(height: 24),

                   // Description
                   Container(
                     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                     decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                            ),
                       ],
                     ),
                     child: const TextField(
                       maxLines: 4,
                       decoration: InputDecoration(
                         border: InputBorder.none,
                         hintText: 'Add description or any special instructions for this item (optional)',
                         hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                       ),
                     ),
                   ),
                   const SizedBox(height: 30),
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
                    const Text(
                      'Selected Items: 7',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF1B263B),
                      ),
                    ),
                    RichText(
                      text: const TextSpan(
                        text: 'Total: ',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF1B263B),
                        ),
                        children: [
                          TextSpan(
                            text: '₹220',
                            style: TextStyle(
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
                      context.push(RouteConstants.pickupAndDeliveryAddressScreen);
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

  Widget _buildSummaryRow(String label, String price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(color: Colors.grey.shade700)),
        Text(price, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildWashTypeOption({required IconData icon, required String title, required String subtitle, required String value}) {
    final isSelected = _selectedWashType == value;
    return GestureDetector(
      onTap: () => setState(() => _selectedWashType = value),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFE8F5E9) : Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: isSelected ? Border.all(color: const Color(0xFF43A047), width: 1.5) : null,
          boxShadow: isSelected ? null : [
             BoxShadow(
                color: Colors.black.withOpacity(0.02),
                blurRadius: 10,
                offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
             Container(
               padding: const EdgeInsets.all(12),
               decoration: BoxDecoration(
                 color: isSelected ? const Color(0xFFC8E6C9) : const Color(0xFFF5F5F5),
                 shape: BoxShape.circle,
               ),
               child: Icon(icon, color: isSelected ? const Color(0xFF2E7D32) : Colors.green.shade700, size: 20),
             ),
             const SizedBox(width: 16),
             Expanded(
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: isSelected ? const Color(0xFF1B5E20) : Colors.black87)),
                   Text(subtitle, style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
                 ],
               ),
             ),
             if (isSelected)
               const Icon(Icons.check_circle, color: Color(0xFF2E7D32)),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceTimeChip(String label) {
    final isSelected = _selectedServiceTime == label;
    return GestureDetector(
      onTap: () => setState(() => _selectedServiceTime = label),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFE8F5E9) : Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: isSelected ? const Color(0xFF43A047) : Colors.grey.shade300),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? const Color(0xFF2E7D32) : Colors.grey.shade700,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
