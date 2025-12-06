import 'package:cleclo/routes/route_constants.dart';
import 'package:cleclo/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TrackOrderScreen extends StatelessWidget {
  const TrackOrderScreen({super.key});

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
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildOrderCard(
            context,
            orderId: '#1D3453A',
            startDate: '4, Oct',
            startTime: '10:00 AM',
            endDate: '4, Oct',
            endTime: '04:00 PM',
            progress: 0.5, // 50%
            isCompleted: false,
          ),
          const SizedBox(height: 24),
          const Text(
            'Previous Orders (1)',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1B263B),
            ),
          ),
          const SizedBox(height: 16),
          _buildOrderCard(
            context,
            orderId: '#1C3123A',
            startDate: '1, Oct',
            startTime: '12:00 PM',
            endDate: '2, Oct',
            endTime: '04:00 PM',
            progress: 1.0, 
            isCompleted: true, // Shows checkmark
          ),
        ],
      ),
    );
  }

  Widget _buildOrderCard(
    BuildContext context, {
    required String orderId,
    required String startDate,
    required String startTime,
    required String endDate,
    required String endTime,
    required double progress,
    required bool isCompleted,
  }) {
    return GestureDetector(
      onTap: () => context.push(RouteConstants.orderDetailsScreen),
      child: Container(
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
                  Text(
                    'Order ID',
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    orderId,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1B263B),
                    ),
                  ),
                ],
              ),
              const Icon(Icons.keyboard_arrow_down, color: Colors.black54),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                startDate,
                style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
              ),
              Text(
                endDate,
                style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                startTime,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                endTime,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Progress Bar
          LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                alignment: Alignment.centerLeft,
                children: [
                  // Background Line
                  Container(
                    width: double.infinity,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  // Progress Line (Only if not completed style, match image exactly)
                  // Image 1: Green line part way. Image 2: Grey full line.
                  if (!isCompleted)
                    Container(
                      width: constraints.maxWidth * progress,
                      height: 4,
                      decoration: BoxDecoration(
                        color: const Color(0xFF43A047),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    
                  // Indicators
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Start Dot
                      Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          color: isCompleted ? Colors.grey.shade200 : const Color(0xFF43A047),
                          shape: BoxShape.circle,
                        ),
                      ),
                      // End Dot (Checkmark or Grey)
                      if (isCompleted)
                         Container(
                          width: 24,
                          height: 24,
                          decoration: const BoxDecoration(
                            color: Color(0xFF43A047),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.check, color: Colors.white, size: 16),
                        )
                      else
                        Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            shape: BoxShape.circle,
                          ),
                        ),
                    ],
                  ),
                ],
              );
            },
          ),
        ],
      ),
      ),
    );
  }
}
