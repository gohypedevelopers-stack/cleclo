import 'package:cleclo/utils/images/images.dart';
import 'package:cleclo/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:cleclo/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cleclo/routes/route_constants.dart';

class ChooseLocationScreen extends StatelessWidget {
  const ChooseLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, 
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black54),
          onPressed: () => context.pop(),
        ),
        centerTitle: true,
        title: const Text(
          'Choose Location',
          style: TextStyle(
            color: Color(0xFF1B263B),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        children: [
          // Map Background (Mock)
          Positioned.fill(
            child: Image.asset(
              // Assuming locationIllustration is a map-like image or illustration. 
              // If it's just an icon illustration, this might look weird, but let's try.
              // If it's not a full map, I might need to fake a map background with a color or pattern.
              // Given the file size (222KB), it might be a decent illustration.
              // But real maps are usually interactive. 
              // For now, I'll use it as a placeholder.
              // If it's not a map, I'll use a grey placeholder.
              // Wait, the screenshot shows a real map. 
              // Use a Container with a light grey color to simulate map area if image isn't perfect.
              Images.map,
              fit: BoxFit.cover,
            ),
          ),
          
          // Search Bar
          Positioned(
            top: 20, // Adjusted for safe area if app bar is transparent, but here it's separate.
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.purple.shade300), // Magnifying glass
                  const SizedBox(width: 10),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search Location',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Center Marker (Simulated)
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                 Container(
                   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                   decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(8),
                     boxShadow: [
                       BoxShadow(color: Colors.black12, blurRadius: 4),
                     ]
                   ),
                   child: const Text('From 562/11-A', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                 ),
                 const SizedBox(height: 4),
                 const Icon(Icons.location_on, size: 40, color: Colors.black), // Black Marker
                 const SizedBox(height: 40), // Offset to center the tip
              ],
            ),
          ),

          // Saved Button
          Positioned(
            right: 20,
            bottom: 220, // Above bottom sheet
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.bookmark, color: Colors.white),
              label: const Text('Saved', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF388E3C), // Green
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),

          // Bottom Sheet
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(color: Colors.black12, blurRadius: 20, offset: Offset(0, -5)),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.location_on_outlined, color: Colors.purple, size: 24),
                      const SizedBox(width: 8),
                      const Text(
                        'Confirm location',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1B263B),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Haier Wash, IIITD, New Delhi',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        context.push(RouteConstants.pickupAndDeliveryScheduleScreen);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF388E3C),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Confirm Location',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10), // Bottom Safe Area padding
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
