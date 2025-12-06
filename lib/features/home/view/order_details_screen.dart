import 'package:cleclo/utils/images/images.dart';
import 'package:cleclo/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          'Track Order',
          style: TextStyle(
            color: Color(0xFF1B263B),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // 1. Order ID Card (Top)
            _buildOrderIdCard(),
            const SizedBox(height: 20),

            // 2. Vertical Timeline Card
            _buildTimelineCard(),
            const SizedBox(height: 20),

            // 3. Map Card
            _buildMapCard(),
            const SizedBox(height: 20),

            // 4. Order Summary Card
            _buildOrderSummaryCard(),
            const SizedBox(height: 20),

            // 5. Pricing Details Card
            _buildPricingCard(),
            const SizedBox(height: 30),

            // 6. Cancel Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _showCancelDialog(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE53935), // Red color
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),

             // 7. Previous Orders Header & Card (Reused from TrackOrderScreen concept)
             Align(
              alignment: Alignment.centerLeft,
               child: const Text(
                  'Previous Orders (1)',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1B263B),
                  ),
                ),
             ),
             const SizedBox(height: 16),
             _buildPreviousOrderCard(),
             const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderIdCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Order ID', style: TextStyle(color: Colors.grey.shade500, fontSize: 12)),
                  const SizedBox(height: 4),
                  const Text('#1D3453A', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1B263B))),
                ],
              ),
               const Icon(Icons.keyboard_arrow_up, color: Colors.black54), // Up arrow for expanded state
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('4, Oct', style: TextStyle(color: Colors.grey.shade500, fontSize: 12)),
              Text('4, Oct', style: TextStyle(color: Colors.grey.shade500, fontSize: 12)),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('10:00 AM', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Text('04:00 PM', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ],
          ),
          const SizedBox(height: 16),
          // Progress Bar
          Stack(
            alignment: Alignment.centerLeft,
            children: [
              Container(width: double.infinity, height: 4, decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(2))),
              Container(width: 150, height: 4, decoration: BoxDecoration(color: const Color(0xFF43A047), borderRadius: BorderRadius.circular(2))),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(width: 16, height: 16, decoration: const BoxDecoration(color: Color(0xFF43A047), shape: BoxShape.circle)),
                  Container(width: 16, height: 16, decoration: BoxDecoration(color: Colors.grey.shade200, shape: BoxShape.circle)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          _buildTimelineItem(
            date: '4 Oct 2024', time: '10:00 Am', title: 'Picked up', subtitle: '10:00 Am, Friday', 
            isCompleted: true, isLast: false,
          ),
          _buildTimelineItem(
            date: '4 Oct 2024', time: '02:10 Pm', title: 'Shipped', subtitle: '02:10 Pm, Friday', 
            isCompleted: true, isLast: false,
          ),
          _buildTimelineItem(
            date: '4 Oct 2024', time: '04:00 Pm', title: 'Delivered', subtitle: 'Expected 04:00 Pm', 
            isCompleted: false, isLast: true, // Only point is green, line is grey if not done? Design shows green dot for last one too but grey line?
            // Actually design shows:
            // Top dot GREEN, Line GREEN.
            // Middle dot GREEN, Line GREY.
            // Bottom dot GREEN.
            // Wait, looking closer at image:
            // 1. Picked up: Green Dot, Green Line down.
            // 2. Shipped: Green Dot, Grey Line down.
            // 3. Delivered: Green Dot.
             // Implies current status is "Shipped" or just arrived there? 
             // Let's replicate exact look.
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineItem({
    required String date, required String time, required String title, required String subtitle, 
    required bool isCompleted, required bool isLast,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Date Column
          SizedBox(
            width: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(date, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                Text(time, style: TextStyle(color: Colors.grey.shade500, fontSize: 10)),
              ],
            ),
          ),
          const SizedBox(width: 16),
          // Timeline Line
          Column(
            children: [
              Container(
                width: 12, height: 12,
                decoration: const BoxDecoration(color: Color(0xFF43A047), shape: BoxShape.circle),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    color: title == 'Picked up' ? const Color(0xFF43A047) : Colors.grey.shade300, // Hardcoded logic to match image
                  ),
                ),
            ],
          ),
          const SizedBox(width: 16),
          // Details Column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                 const SizedBox(height: 4),
                Text(subtitle, style: TextStyle(color: Colors.grey.shade500, fontSize: 12)),
                const SizedBox(height: 30), // Spacing between items
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMapCard() {
    return Container(
      height: 120, // Reduced height for simple visualization
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        children: [
          // Custom Paint or simple layout for line
          // For simplicity, using a Row with Icons and a Dashed Line CustomPainter isn't available easily without package.
          // I will use a simple layout with a rotated container or similar for now, 
          // or just standard row with dotted text if possible.
          // Let's try a custom painter for the dotted line.
          CustomPaint(
            size: const Size(double.infinity, double.infinity),
            painter: _DottedLinePainter(),
          ),
          // Points
          Positioned(
            top: 10, left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.circle, color: Color(0xFF81C784), size: 12), // Light green dot
                const SizedBox(height: 4),
                Text('Pick-up Point', style: TextStyle(color: Colors.grey.shade600, fontSize: 10)),
                Text('123 Main St, City', style: TextStyle(color: Colors.grey.shade500, fontSize: 10)),
              ],
            ),
          ),
          Positioned(
            bottom: 10, right: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Icon(Icons.circle, color: Color(0xFFE57373), size: 12), // Red/Orange dot
                const SizedBox(height: 4),
                Text('Delivery Point', style: TextStyle(color: Colors.grey.shade600, fontSize: 10)),
                Text('456 Oak Ave, City', style: TextStyle(color: Colors.grey.shade500, fontSize: 10)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderSummaryCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Order Summary', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1B263B))),
          const SizedBox(height: 16),
          Row(
            children: [
              Container(
                width: 50, height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xFFE3F2FD),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.local_laundry_service, color: Color(0xFF1976D2)), // Placeholder icon
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Bubble Laundry', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                    Text('Wash separately up to 12 kg', style: TextStyle(color: Colors.grey.shade500, fontSize: 12)),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text('\$21', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                   Text('Edit', style: TextStyle(color: Color(0xFF43A047), fontSize: 12)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPricingCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
            _buildPriceRow('Collection Time', 'Today 11:00 AM', isValueBold: true),
            const SizedBox(height: 12),
            _buildPriceRow('Delivery Time', 'Tomorrow 11:30 PM', isValueBold: true),
            
            const Padding(padding: EdgeInsets.symmetric(vertical: 16), child: Divider()),

            _buildPriceRow('Service Charge Incl. tax', '\$21', isLink: true),
            const SizedBox(height: 12),
            _buildPriceRow('Collection & Delivery Charge', '\$5'),
            const SizedBox(height: 12),
            _buildPriceRow('Promo Code', 'Enter', isGreen: true),
            
            const Padding(padding: EdgeInsets.symmetric(vertical: 16), child: Divider()),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Order Subtotal', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1B263B))),
                Text('\$26', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1B263B))),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildPriceRow(String label, String value, {bool isValueBold = false, bool isLink = false, bool isGreen = false}) {
     return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        isLink 
        ? RichText(
          text: TextSpan(
            text: 'Service Charge ',
             style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
             children: const [
               TextSpan(text: 'Incl. tax', style: TextStyle(color: Color(0xFF4285F4), fontSize: 12)),
             ]
          ),
        )
        : Text(label, style: TextStyle(color: Colors.grey.shade600, fontSize: 14)),
        Text(
          value, 
          style: TextStyle(
            color: isGreen ? const Color(0xFF43A047) : const Color(0xFF1B263B),
            fontWeight: isValueBold ? FontWeight.bold : FontWeight.normal,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

   Widget _buildPreviousOrderCard() {
     // Reusing simplified logic for previous order display
      return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
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
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Order ID', style: TextStyle(color: Colors.grey.shade500, fontSize: 12)),
                  const SizedBox(height: 4),
                  const Text('#1C3123A', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1B263B))),
                ],
              ),
               const Icon(Icons.keyboard_arrow_down, color: Colors.black54),
            ],
          ),
           const SizedBox(height: 20),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('1, Oct', style: TextStyle(color: Colors.grey.shade500, fontSize: 12)),
              Text('2, Oct', style: TextStyle(color: Colors.grey.shade500, fontSize: 12)),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('12:00 PM', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Text('04:00 PM', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ],
          ),
           const SizedBox(height: 16),
          // Progress Bar (Full)
          Stack(
            alignment: Alignment.centerLeft,
            children: [
              Container(width: double.infinity, height: 4, decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(2))),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(width: 16, height: 16, decoration: BoxDecoration(color: Colors.grey.shade200, shape: BoxShape.circle)),
                   Container(
                      width: 24, height: 24, 
                      decoration: const BoxDecoration(color: Color(0xFF43A047), shape: BoxShape.circle),
                      child: const Icon(Icons.check, color: Colors.white, size: 16),
                    ),
                ],
              ),
            ],
          ),
        ],
      ),
      );
   }
}

class _DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = const Color(0xFF81C784)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    var max = size.width;
    var dashWidth = 5;
    var dashSpace = 5;
    double startX = 20;
    double startY = 20;
    double endX = size.width - 20;
    double endY = size.height - 30;

    // Draw simple diagonal line with dashes
    double dx = endX - startX;
    double dy = endY - startY;
    double distance = 150; // Approximated
    // Simplified logic: just draw points along the line
    
    // Actually standard flutter doesn't have easy dash path. 
    // I'll simulate a few dashes.
    
    for (double i = 0; i < 1; i += 0.1) {
       // canvas.drawCircle(Offset(startX + (dx * i), startY + (dy * i)), 2, paint);
       // This is complicated to get right without math. 
       // Let's just draw a faint line for now.
    }
     // paint.color = const Color(0xFF81C784);
     // canvas.drawLine(Offset(startX, startY), Offset(endX, endY), paint);
     // Making it dashed manually:
     
     double currentX = startX;
     double currentY = startY;
     double stepX = dx / 20;
     double stepY = dy / 20;
     
     for (int i = 0; i < 20; i+=2) {
       canvas.drawLine(
         Offset(startX + (stepX*i), startY + (stepY*i)),
         Offset(startX + (stepX*(i+1)), startY + (stepY*(i+1))),
         paint
       );
     }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

void _showCancelDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Cancel Order?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1B263B),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Are you sure you want to cancel this order? This action cannot be undone.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 24),
            Container(
              height: 100,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const TextField(
                maxLines: null,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Reason for cancellation',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => context.pop(),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      backgroundColor: Colors.grey.shade100,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'No, Keep',
                      style: TextStyle(
                        color: Color(0xFF2E7D32), // Green to encourage keeping
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Perform cancellation logic
                      context.pop();
                      context.pop(); // Go back to track order list or home
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE53935),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Confirm',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
