import 'package:flutter/material.dart';

class SmsProtectionScreen extends StatelessWidget {
  const SmsProtectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SMS Fraud Protection')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Recent Transactional Messages',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            _smsCard(
              sender: 'HDFCBK',
              message: '₹5,000 credited via UPI',
              status: 'Safe',
              color: Colors.green,
            ),
            _smsCard(
              sender: '+91XXXXXXX',
              message: 'Payment received. Click to verify immediately.',
              status: 'Fraud',
              color: Colors.red,
            ),
            _smsCard(
              sender: 'AXISBK',
              message: '₹1,200 debited for UPI transaction',
              status: 'Suspicious',
              color: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }

  Widget _smsCard({
    required String sender,
    required String message,
    required String status,
    required Color color,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(sender, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(message),
        trailing: Text(
          status,
          style: TextStyle(color: color, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
