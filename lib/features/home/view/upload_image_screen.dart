import 'package:cleclo/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cleclo/routes/route_constants.dart';
import 'dart:ui'; // Needed for PathMetric

class UploadImageScreen extends StatelessWidget {
  const UploadImageScreen({super.key});

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
          'Upload Image',
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
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  // Dashed Upload Area
                  CustomPaint(
                    painter: _DashedRRectPainter(color: Colors.grey.shade400, strokeWidth: 1.5, gap: 5),
                    child: Container(
                      height: 300, // Reduced from 350
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                             padding: const EdgeInsets.all(16), // Reduced padding
                             decoration: BoxDecoration(
                               color: const Color(0xFFE8F5E9), 
                               shape: BoxShape.circle,
                             ),
                             child: const Icon(Icons.camera_alt_outlined, color: Color(0xFF2E7D32), size: 28), // Reduced size
                          ),
                          const SizedBox(height: 12), // Reduced spacing
                          const Text(
                            'Tap to add a photo',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16, // Reduced font size
                              color: Color(0xFF1B263B),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16), // Reduced spacing
                  
                  Text(
                    'Upload a clear photo of your item for best service',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 13, // Slightly reduced
                    ),
                  ),
                  const SizedBox(height: 20), // Reduced spacing
                  
                  // Action Buttons
                  _buildActionButton(
                    icon: Icons.camera_alt_outlined, 
                    label: 'Take Photo',
                    onTap: () {
                      context.push(RouteConstants.confirmPhotoScreen);
                    },
                  ),
                  const SizedBox(height: 12), // Reduced spacing
                  _buildActionButton(
                    icon: Icons.photo_library_outlined, 
                    label: 'Choose from Gallery',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
          
          // Confirm Button
          Padding(
            padding: const EdgeInsets.all(16.0), // Reduced padding
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  context.pop(); // Return to collection
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF388E3C),
                  padding: const EdgeInsets.symmetric(vertical: 14), // Reduced vertical padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Confirm Upload',
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

  Widget _buildActionButton({required IconData icon, required String label, required VoidCallback onTap}) {
    return SizedBox(
       width: double.infinity,
       height: 48, // Reduced from 56
       child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFC8E6C9), // Matches "Take Photo" bg in image
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: const Color(0xFF1B5E20)), // Dark green icon
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                color: Color(0xFF1B5E20), // Dark green text
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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

    // Create RRect path with large radius
    RRect rRect = RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height), 
        const Radius.circular(40) // Radius from design
    ); 
    Path path = Path()..addRRect(rRect);

    // Dashing Logic
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
