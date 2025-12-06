import 'package:cleclo/utils/images/images.dart';
import 'package:cleclo/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ConfirmPhotoScreen extends StatelessWidget {
  const ConfirmPhotoScreen({super.key});

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
          'Confirm Photo',
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
             child: Padding(
               padding: const EdgeInsets.all(24.0),
               child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    Images.whiteTShirt,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
               ),
             ),
           ),
           
           const Text(
            'Ensure the item’s condition is clearly visible.',
             style: TextStyle(
               color: Colors.black54,
               fontSize: 14,
             ),
           ),
           const SizedBox(height: 24),
           
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 24),
             child: Column(
               children: [
                 SizedBox(
                   width: double.infinity,
                   child: OutlinedButton(
                     onPressed: () {
                       context.pop();
                     },
                     style: OutlinedButton.styleFrom(
                       padding: const EdgeInsets.symmetric(vertical: 16),
                       side: BorderSide(color: Colors.grey.shade300),
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(30),
                       ),
                       backgroundColor: Colors.white,
                     ),
                     child: const Text(
                       'Retake Photo',
                       style: TextStyle(
                         color: Color(0xFF1B263B),
                         fontWeight: FontWeight.bold,
                         fontSize: 16,
                       ),
                     ),
                   ),
                 ),
                 const SizedBox(height: 16),
                 SizedBox(
                   width: double.infinity,
                   child: ElevatedButton(
                     onPressed: () {
                        // Logic to use photo - for now maybe go back or show success? 
                        // User hasn't specified what happens next. 
                        // I'll assume it goes back to Collection or just stays there for now.
                        // Actually, logic usually is "Use Photo" -> Returns image to previous screen. 
                        // But for now I'll just pop or do nothing until specified. 
                        // Wait, "Use Photo" likely means confirming the upload. 
                        // I'll make it navigate back to "YourCollection" maybe? Or stay. 
                        // I will add a placeholder action.
                     },
                     style: ElevatedButton.styleFrom(
                       backgroundColor: const Color(0xFF558B2F), // Greenish
                       padding: const EdgeInsets.symmetric(vertical: 16),
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(30),
                       ),
                       elevation: 0,
                     ),
                     child: const Text(
                       'Use Photo',
                       style: TextStyle(
                         color: Colors.white,
                         fontSize: 16,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                   ),
                 ),
                 const SizedBox(height: 30),
               ],
             ),
           ),
        ],
      ),
    );
  }
}
