import 'package:cleclo/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cleclo/routes/route_constants.dart';

class BookingSuccessScreen extends StatelessWidget {
  const BookingSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA), // Light grey
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F9FA),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black54),
          onPressed: () => context.pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            // Success Icon
            Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                color: Color(0xFF66BB6A), // Light Green
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check,
                color: Colors.white,
                size: 50,
              ),
            ),
            const SizedBox(height: 30),
            
            // Congratulations Text
            const Text(
              'Congratulations!',
              style: TextStyle(
                color: Color(0xFF1B263B),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            
            // Description Text
            const Text(
              'Your Laundry Service Booked',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'You can check your booking on the menu profile',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            
            const Spacer(),
            
            // View My Bookings Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                   // Navigate to Booking History or Home? 
                   // "View My Bookings" likely goes to Track Order or Bookings list.
                   // I'll navigate to 'trackOrderScreen' or similar if available, or just pop for now.
                   // Actually I have 'trackOrderScreen' from previous tasks.
                   context.push(RouteConstants.trackOrderScreen);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF388E3C), // Dark Green
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'View My Bookings',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
