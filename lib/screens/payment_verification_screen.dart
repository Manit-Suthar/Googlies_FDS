import 'package:flutter/material.dart';

class PaymentProtectionScreen extends StatelessWidget {
  const PaymentProtectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UPI Payment Verification')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _infoCard(),
            const SizedBox(height: 20),

            _resultCard(
              title: 'Payment Not Credited',
              description:
                  'No credit detected in receiver UPI app.\nAnnouncement blocked.',
              color: Colors.red,
            ),
            const SizedBox(height: 16),

            _resultCard(
              title: 'Payment Received on UPI App',
              description:
                  '₹500 credited successfully.\nAnnouncement allowed.',
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          'Payment announcements are triggered only after '
          'credit is verified in the receiver’s UPI app.',
        ),
      ),
    );
  }

  Widget _resultCard({
    required String title,
    required String description,
    required Color color,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color),
        color: color.withOpacity(0.1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: color)),
          const SizedBox(height: 6),
          Text(description),
        ],
      ),
    );
  }
}
