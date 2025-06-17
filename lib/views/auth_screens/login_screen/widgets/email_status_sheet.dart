import 'package:flutter/material.dart';

class EmailStatusSheet extends StatelessWidget {
  final VoidCallback onResend;

  const EmailStatusSheet({super.key, required this.onResend});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.email_outlined, size: 48, color: Colors.orange),
          SizedBox(height: 16),
          Text(
            'Email not verified',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Please check your inbox and verify your email address to continue.',
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: onResend,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              backgroundColor: Color(0xff0070FC),
            ),
            child: Text(
              'Resend Verification Email',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
