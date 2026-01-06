import 'package:flutter/material.dart';
import 'sms_screen.dart';
import 'payment_verification_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Security Status')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _heroCard(),
            const SizedBox(height: 24),

            _statusCard(
              title: 'SMS Fraud Protection',
              subtitle: 'Monitoring transactional messages',
              status: 'Active',
              color: Colors.green,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const SmsProtectionScreen(),
                ),
              ),
            ),
            _statusCard(
              title: 'UPI Payment Verification',
              subtitle: 'Announcements verified before confirmation',
              status: 'Active',
              color: Colors.green,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const PaymentProtectionScreen(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _heroCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Column(
        children: [
          Icon(Icons.shield_outlined,
              size: 48, color: Color(0xFF1A73E8)),
          SizedBox(height: 12),
          Text(
            'Your payments are protected',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 6),
          Text(
            'Real‑time fraud monitoring is active',
            style: TextStyle(color: Colors.black54),
          ),
        ],
      ),
    );
  }

  Widget _statusCard({
    required String title,
    required String subtitle,
    required String status,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: Text(
          status,
          style: TextStyle(color: color, fontWeight: FontWeight.bold),
        ),
        onTap: onTap,
      ),
    );
  }
}
