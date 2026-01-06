import os
import shutil

BASE_DIR = os.getcwd()

# -------------------------
# 1. CLEANUP OLD ANDROID FILES
# -------------------------
DELETE_ITEMS = [
    "app",
    "gradle",
    ".gradle",
    ".idea",
    "build.gradle",
    "build.gradle.kts",
    "settings.gradle",
    "settings.gradle.kts",
    "gradlew",
    "gradlew.bat",
    "local.properties"
]

for item in DELETE_ITEMS:
    path = os.path.join(BASE_DIR, item)
    if os.path.exists(path):
        if os.path.isdir(path):
            shutil.rmtree(path)
            print(f"Deleted folder: {item}")
        else:
            os.remove(path)
            print(f"Deleted file: {item}")

# -------------------------
# 2. CREATE FLUTTER FOLDERS
# -------------------------
folders = [
    "lib/screens",
    "lib/widgets",
    "lib/logic"
]

for folder in folders:
    os.makedirs(folder, exist_ok=True)
    print(f"Created folder: {folder}")

# -------------------------
# 3. CREATE FILES WITH INITIAL CONTENT
# -------------------------

files_content = {
    "lib/main.dart": """import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const FraudDetectionApp());
}

class FraudDetectionApp extends StatelessWidget {
  const FraudDetectionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UPI Fraud Detection System',
      theme: ThemeData(
        primaryColor: const Color(0xFF1A73E8),
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
      ),
      home: const HomeScreen(),
    );
  }
}
""",

    "lib/screens/home_screen.dart": """import 'package:flutter/material.dart';
import '../widgets/action_card.dart';
import 'transaction_screen.dart';
import 'sms_screen.dart';
import 'payment_verification_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UPI Fraud Detection System'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ActionCard(
              title: 'Check Transaction',
              subtitle: 'Analyze transaction for fraud risk',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const TransactionScreen(),
                  ),
                );
              },
            ),
            ActionCard(
              title: 'Check SMS',
              subtitle: 'Detect fake bank messages',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const SmsScreen(),
                  ),
                );
              },
            ),
            ActionCard(
              title: 'Verify Payment',
              subtitle: 'Confirm payment received',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const PaymentVerificationScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
""",

    "lib/screens/transaction_screen.dart": """import 'package:flutter/material.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transaction Fraud Check')),
      body: const Center(
        child: Text('Transaction Fraud Screen'),
      ),
    );
  }
}
""",

    "lib/screens/sms_screen.dart": """import 'package:flutter/material.dart';

class SmsScreen extends StatelessWidget {
  const SmsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SMS Fraud Detection')),
      body: const Center(
        child: Text('SMS Fraud Screen'),
      ),
    );
  }
}
""",

    "lib/screens/payment_verification_screen.dart": """import 'package:flutter/material.dart';

class PaymentVerificationScreen extends StatelessWidget {
  const PaymentVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payment Verification')),
      body: const Center(
        child: Text('Verify Payment Screen'),
      ),
    );
  }
}
""",

    "lib/screens/result_screen.dart": """import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String result;

  const ResultScreen({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fraud Result')),
      body: Center(
        child: Text(
          result,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
""",

    "lib/widgets/action_card.dart": """import 'package:flutter/material.dart';

class ActionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const ActionCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              Text(subtitle, style: TextStyle(fontSize: 13, color: Colors.grey[600])),
            ],
          ),
        ),
      ),
    );
  }
}
""",

    "lib/logic/transaction_logic.dart": "// Transaction fraud logic will be added here\n",
    "lib/logic/sms_logic.dart": "// SMS fraud logic will be added here\n",

    "pubspec.yaml": """name: upi_fds
description: UPI Fraud Detection System MVP
version: 1.0.0

environment:
  sdk: '>=3.0.0 <4.0.0'

dependencies:
  flutter:
    sdk: flutter

flutter:
  uses-material-design: true
""",

    "README.md": "# UPI Fraud Detection System (GOOGLIES)\nFlutter-based MVP for GDG Hackathon\n"
}

for file_path, content in files_content.items():
    with open(file_path, "w", encoding="utf-8") as f:
        f.write(content)
    print(f"Created file: {file_path}")

print("\\n✅ Flutter FDS project setup completed successfully.")
