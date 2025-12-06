import 'package:cleclo/utils/images/images.dart';
import 'package:cleclo/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cleclo/routes/route_constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              // Title
              const Center(
                child: Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1B263B), // Dark Blue
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // User Info Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 15, offset: const Offset(0, 5)),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Jane Doe', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFF1B263B))),
                          const SizedBox(height: 8),
                          Text('+1 123-456-7890', style: TextStyle(color: Colors.grey.shade600, fontSize: 13)),
                          const SizedBox(height: 4),
                          Text('jane.doe@email.com', style: TextStyle(color: Colors.grey.shade600, fontSize: 13)),
                          const SizedBox(height: 16),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF1F1F1), // Light Grey Button
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text('Edit', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                  // Avatar
                  // Using ClipOval with Image.asset to show the profile photo.
                  ClipOval(
                    child: SizedBox(
                      width: 80, height: 80,
                      child: Image.asset(
                        Images.profilePhoto,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),

              // Menu Options Card
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                   boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 15, offset: const Offset(0, 5)),
                  ],
                ),
                child: Column(
                  children: [
                    _buildMenuItem(Icons.account_balance_wallet, 'My Wallet', () {}),
                    const Divider(height: 30),
                    _buildMenuItem(Icons.settings, 'Settings', () {}),
                    const Divider(height: 30),
                    _buildMenuItem(Icons.feedback, 'Send Feedback', () {}),
                    const Divider(height: 30),
                    _buildMenuItem(Icons.help, 'Help', () {}),
                    const Divider(height: 30),
                    _buildMenuItem(Icons.logout, 'Logout', () {
                      // Login/Logout logic
                    }),
                  ],
                ),
              ),
              const SizedBox(height: 100), // Spacing for bottom nav
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, color: Colors.grey.shade600, size: 22),
          const SizedBox(width: 16),
          Expanded(child: Text(label, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15, color: Color(0xFF1B263B)))),
          Icon(Icons.chevron_right, color: Colors.grey.shade300, size: 24),
        ],
      ),
    );
  }
}
