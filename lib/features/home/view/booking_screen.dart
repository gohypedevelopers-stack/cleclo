import 'package:cleclo/utils/images/images.dart';
import 'package:cleclo/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cleclo/routes/route_constants.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F9FA),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black54, size: 20),
          onPressed: () {
            // If navigating from bottom bar, we might not want to pop, 
            // but the design shows a back arrow, so we include it.
            // In bottom nav context, this might just switch tab or do nothing if it's the root.
             // For now, we keep it visual.
          },
        ),
        centerTitle: true,
        title: const Text(
          'My Bookings',
          style: TextStyle(
            color: Color(0xFF1B263B),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildBookingCard(
            image: Images.bookingCard,
            status: 'Order Confirmed',
            statusColor: const Color(0xFFFFF9C4), // Light yellow
            statusTextColor: const Color(0xFFFBC02D), // Darker yellow text
            title: 'Shoes Service',
            rating: 4.5,
            ratingCount: 234,
            location: 'Balajinagar, Banglore',
            orderId: '#1D3453A',
            date: '4, Oct',
            price: '260',
            primaryButtonText: 'Track Order',
            secondaryButtonText: 'Cancel',
            isPrimaryButtonGreen: true,
          ),
          const SizedBox(height: 20),
          _buildBookingCard(
            image: Images.bookingCard, // Using same image as placeholder/requested
            status: 'Order Delivered',
            statusColor: const Color(0xFFE8F5E9), // Light green
            statusTextColor: const Color(0xFF43A047), // Darker green text
            title: 'Bed Sheet',
            rating: 4.5,
            ratingCount: 230,
            location: 'Balajinagar, Banglore',
            orderId: '#1C3123A',
            date: '1, Oct',
            price: '160',
            primaryButtonText: 'Write Review',
            secondaryButtonText: 'View Bill',
            isPrimaryButtonGreen: true,
            onPrimaryTap: () {
              context.push(RouteConstants.writeReviewScreen);
            },
          ),
           // Add padding at bottom for bottom nav bar
          const SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget _buildBookingCard({
    required String image,
    required String status,
    required Color statusColor,
    required Color statusTextColor,
    required String title,
    required double rating,
    required int ratingCount,
    required String location,
    required String orderId,
    required String date,
    required String price,
    required String primaryButtonText,
    required String secondaryButtonText,
    required bool isPrimaryButtonGreen,
    VoidCallback? onPrimaryTap,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
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
        children: [
          // Top Section: Image + Details
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              // Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Status Chip
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: statusColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        status,
                        style: TextStyle(
                          color: statusTextColor,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1B263B),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Color(0xFF43A047), size: 16),
                        const SizedBox(width: 4),
                        Text(
                          '$rating',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          ' ($ratingCount Ratings)',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.grey.shade400, size: 16),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            location,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          
          // Middle Section: Order Info
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildInfoColumn('Order ID', orderId, isBold: true),
              _buildInfoColumn('Order Date', date),
              _buildInfoColumn('Total Payment', '₹$price', isBold: true),
            ],
          ),
          
          const SizedBox(height: 20),

          // Bottom Section: Buttons
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    side: BorderSide(color: Colors.grey.shade400),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    secondaryButtonText,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: onPrimaryTap ?? () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isPrimaryButtonGreen ? const Color(0xFFE8F5E9) : const Color(0xFF43A047),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    primaryButtonText,
                    style: TextStyle(
                      color: isPrimaryButtonGreen ? const Color(0xFF2E7D32) : Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoColumn(String label, String value, {bool isBold = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.grey.shade500,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            color: const Color(0xFF1B263B),
            fontSize: 16,
            fontWeight: isBold ? FontWeight.bold : FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
