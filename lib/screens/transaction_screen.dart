import 'package:flutter/material.dart';
import 'result_screen.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  final TextEditingController amountController = TextEditingController();
  String selectedPayeeType = 'Known';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction Fraud Check'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Transaction Amount',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Enter amount',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            const Text(
              'Payee Type',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              initialValue: selectedPayeeType,
              items: const [
                DropdownMenuItem(value: 'Known', child: Text('Known Payee')),
                DropdownMenuItem(value: 'Unknown', child: Text('Unknown Payee')),
              ],
              onChanged: (value) {
                setState(() {
                  selectedPayeeType = value!;
                });
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final amount = int.tryParse(amountController.text) ?? 0;

                  String result;
                  if (amount > 10000 && selectedPayeeType == 'Unknown') {
                    result = 'High Risk Fraud Detected';
                  } else if (amount > 5000) {
                    result = 'Suspicious Transaction';
                  } else {
                    result = 'Transaction Appears Safe';
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ResultScreen(result: result),
                    ),
                  );
                },
                child: const Text('Analyze Transaction'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
