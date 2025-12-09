import 'package:flutter/material.dart';
import 'package:tzapp/view/paywall_screen.dart';
import 'package:tzapp/widgets/animated_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with TickerProviderStateMixin {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (i) {
              setState(() => _currentPage = i);
            },
            children: [
              _buildPage(
                title: 'Добро пожаловать!',
                text: 'Перелистывай экран, чтобы продолжить',
              ),
              _buildPage(
                title: 'Начнём?',
                text: 'Нажмите кнопку, чтобы открыть Paywall',
                showButton: true,
              ),
            ],
          ),

          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(2, (index) {
                final isActive = index == _currentPage;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  width: isActive ? 22 : 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: isActive
                        ? Colors.blueAccent
                        : Colors.blueAccent.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPage({
    required String title,
    required String text,
    bool showButton = false,
  }) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedOpacity(
            duration: const Duration(milliseconds: 600),
            opacity: 1,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 20),

          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18),
          ),

          if (showButton) ...[
            const SizedBox(height: 50),
            AnimatedButton(
              text: 'Продолжить',
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const PaywallScreen()),
              ),
            )
          ]
        ],
      ),
    );
  }
}