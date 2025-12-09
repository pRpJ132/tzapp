import 'package:flutter/material.dart';
import 'package:tzapp/view/main_screen.dart';
import '../../widgets/animated_button.dart';
import '../../storage/subscription_storage.dart';

class PaywallScreen extends StatefulWidget {
  const PaywallScreen({super.key});

  @override
  State<PaywallScreen> createState() => _PaywallScreenState();
}

class _PaywallScreenState extends State<PaywallScreen> {
  int selected = 1; // 0 = месяц, 1 = год

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Подписка Premium',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),

            _subCard('Месяц — 299₽', 0),
            const SizedBox(height: 16),
            _subCard('Год — 1490₽ (скидка)', 1),

            const SizedBox(height: 50),
            AnimatedButton(
              text: 'Продолжить',
              onTap: () async {
                await SubscriptionStorage.buySubscription();

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const MainScreen()),
                  (route) => false,
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _subCard(String text, int id) {
    final isActive = id == selected;
    return GestureDetector(
      onTap: () => setState(() => selected = id),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isActive ? Colors.blue : Colors.grey.shade300,
            width: 2,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isActive ? Colors.blue : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}