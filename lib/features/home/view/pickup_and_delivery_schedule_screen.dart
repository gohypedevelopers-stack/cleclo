import 'package:cleclo/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cleclo/routes/route_constants.dart';

class PickupAndDeliveryScheduleScreen extends StatefulWidget {
  const PickupAndDeliveryScheduleScreen({super.key});

  @override
  State<PickupAndDeliveryScheduleScreen> createState() => _PickupAndDeliveryScheduleScreenState();
}

class _PickupAndDeliveryScheduleScreenState extends State<PickupAndDeliveryScheduleScreen> {
  // Managing state for dates and times
  // Default values as placeholders matching design or current date
  DateTime _pickupDate = DateTime.now();
  TimeOfDay _pickupTime = const TimeOfDay(hour: 10, minute: 0);
  
  DateTime _deliveryDate = DateTime.now().add(const Duration(days: 2));
  TimeOfDay _deliveryTime = const TimeOfDay(hour: 16, minute: 0);

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
          'Pickup & Delivery',
          style: TextStyle(
            color: Color(0xFF1B263B),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    // Pick-Up Section
                    const Text(
                      'Pick-Up Date and Time',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1B263B),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(child: _buildDateTimeCard(
                          label: 'Date', 
                          value: _formatDate(_pickupDate), 
                          icon: Icons.calendar_today_outlined,
                          onTap: () => _pickDate(true),
                        )),
                        const SizedBox(width: 16),
                        Expanded(child: _buildDateTimeCard(
                          label: 'Time', 
                          value: _formatTime(_pickupTime), 
                          icon: Icons.access_time,
                          onTap: () => _pickTime(true),
                        )),
                      ],
                    ),
                    
                    const SizedBox(height: 32),
                    
                    // Delivery Section
                    const Text(
                      'Delivery Date and Time',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1B263B),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(child: _buildDateTimeCard(
                          label: 'Date', 
                          value: _formatDate(_deliveryDate), 
                          icon: Icons.calendar_today_outlined,
                          onTap: () => _pickDate(false),
                        )),
                        const SizedBox(width: 16),
                        Expanded(child: _buildDateTimeCard(
                          label: 'Time', 
                          value: _formatTime(_deliveryTime), 
                          icon: Icons.access_time,
                          onTap: () => _pickTime(false),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            
            // Schedule Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  context.push(RouteConstants.reviewOrderScreen);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF388E3C), // Dark green
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Schedule',
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

  Widget _buildDateTimeCard({required String label, required String value, required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5), // Light grey background
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    color: Color(0xFF1B263B),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Container(
               padding: const EdgeInsets.all(4),
               decoration: const BoxDecoration(
                 color: Color(0xFF388E3C), // Green circle for icon
                 shape: BoxShape.circle,
               ),
               child: Icon(icon, color: Colors.white, size: 16),
            ),
             // Wait, image shows icon is green or has green circle? 
             // Image shows green circle with white icon OR green icon. 
             // Looking closely: It's a solid green circle with specific icon inside.
             // Actually looking at image: Calendar has green calendar icon directly? No, it looks like a filled circle.
             // Let's stick to Green Circle with white icon for now, looks cleaner. 
             // Wait, re-examining image: 
             // Time: Dark Green filled circle, white clock hands? Or White icon.
             // Let me assume filled circle.
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    // Basic formatting: 4 Oct 24
    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return '${date.day} ${months[date.month - 1]} ${date.year.toString().substring(2)}';
  }

  String _formatTime(TimeOfDay time) {
    final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final period = time.period == DayPeriod.am ? 'AM' : 'PM';
    final minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute $period';
  }

  Future<void> _pickDate(bool isPickup) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isPickup ? _pickupDate : _deliveryDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2026),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF388E3C),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        if (isPickup) {
          _pickupDate = picked;
        } else {
          _deliveryDate = picked;
        }
      });
    }
  }

  Future<void> _pickTime(bool isPickup) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: isPickup ? _pickupTime : _deliveryTime,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
             colorScheme: const ColorScheme.light(
              primary: Color(0xFF388E3C),
              onSurface: Color(0xFF1B263B), // text color
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        if (isPickup) {
          _pickupTime = picked;
        } else {
          _deliveryTime = picked;
        }
      });
    }
  }
}
