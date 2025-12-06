import 'package:cleclo/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cleclo/routes/route_constants.dart';
import 'dart:ui'; // Needed for PathMetric

class PickupAndDeliveryAddressScreen extends StatefulWidget {
  const PickupAndDeliveryAddressScreen({super.key});

  @override
  State<PickupAndDeliveryAddressScreen> createState() => _PickupAndDeliveryAddressScreenState();
}

class _PickupAndDeliveryAddressScreenState extends State<PickupAndDeliveryAddressScreen> {
  String _selectedAddress = 'Home'; // Default selection

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
          'Pickup & Delivery Address',
          style: TextStyle(
            color: Color(0xFF1B263B),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                _buildAddressCard(
                  type: 'Home',
                  address: '12A Balajinagar, Near Shiv mandir, Behind PP Collage, Banglore 560005',
                  isSelected: _selectedAddress == 'Home',
                  onTap: () => setState(() => _selectedAddress = 'Home'),
                ),
                const SizedBox(height: 16),
                _buildAddressCard(
                  type: 'Office',
                  address: '22/1/2 Nirmala nagar, Near SP super shop, Behind Ram mandir, Banglore 560009',
                  isSelected: _selectedAddress == 'Office',
                  onTap: () => setState(() => _selectedAddress = 'Office'),
                ),
                const SizedBox(height: 24),
                
                // Add New Address Button (Dashed)
                CustomPaint(
                  painter: _DashedRRectPainter(color: const Color(0xFF43A047), strokeWidth: 1, gap: 5),
                  child: InkWell(
                    onTap: () {
                         // Logic to add new address
                    },
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      alignment: Alignment.center,
                      child: const Text(
                        '+ Add New Address',
                        style: TextStyle(
                          color: Color(0xFF43A047),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                
                // Map Button
                Center(
                  child: ElevatedButton.icon(
                    onPressed: () {
                        // Open Map logic
                    },
                    icon: const Icon(Icons.map_outlined, color: Colors.white),
                    label: const Text('Map', style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF388E3C),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                  ),
                ),
                 // Spacing for bottom button
                const SizedBox(height: 100),
              ],
            ),
          ),
          
          // Bottom Select Location Button
          Positioned(
            left: 20,
            right: 20,
            bottom: 30,
            child: SizedBox(
               width: double.infinity,
               child: ElevatedButton(
                 onPressed: () {
                   context.push(RouteConstants.chooseLocationScreen);
                 },
                 style: ElevatedButton.styleFrom(
                   backgroundColor: const Color(0xFF388E3C), // Darker green
                   padding: const EdgeInsets.symmetric(vertical: 16),
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(30),
                   ),
                   elevation: 0,
                 ),
                 child: const Text(
                   'Select Location',
                   style: TextStyle(
                     color: Colors.white,
                     fontSize: 16,
                     fontWeight: FontWeight.bold,
                   ),
                 ),
               ),
             ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddressCard({required String type, required String address, required bool isSelected, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Icon(Icons.location_on, color: const Color(0xFF66BB6A), size: 28), // Green Location Icon
             const SizedBox(width: 16),
             Expanded(
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                    Text(
                      type,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF1B263B)),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      address,
                      style: TextStyle(color: Colors.grey.shade600, fontSize: 13, height: 1.4),
                    ),
                 ],
               ),
             ),
             const SizedBox(width: 8),
             // Custom Radio
             Container(
               width: 24, height: 24,
               decoration: BoxDecoration(
                 shape: BoxShape.circle,
                 border: Border.all(
                   color: isSelected ? const Color(0xFF43A047) : Colors.grey.shade400,
                   width: 2,
                 ),
               ),
               child: isSelected 
                   ? Center(child: Container(width: 14, height: 14, decoration: const BoxDecoration(color: Color(0xFF43A047), shape: BoxShape.circle)))
                   : null,
             ),
          ],
        ),
      ),
    );
  }
}

// Reusing the DashedRrectPainter from UploadImageScreen (moved to here or duplicated)
// I will duplicate for now to be safe and independent.
class _DashedRRectPainter extends CustomPainter {
  final double strokeWidth;
  final Color color;
  final double gap;

  _DashedRRectPainter({this.strokeWidth = 1.0, this.color = Colors.grey, this.gap = 5.0});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    RRect rRect = RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height), 
        const Radius.circular(30)
    ); 
    Path path = Path()..addRRect(rRect);

    Path dashedPath = Path();
    double dashWidth = 6.0;
    double dashSpace = 4.0;
    
    for (PathMetric metric in path.computeMetrics()) {
      double distance = 0.0;
      while (distance < metric.length) {
        dashedPath.addPath(
          metric.extractPath(distance, distance + dashWidth),
          Offset.zero,
        );
        distance += dashWidth + dashSpace;
      }
    }

    canvas.drawPath(dashedPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
