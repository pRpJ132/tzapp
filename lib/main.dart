import 'package:flutter/material.dart';
import 'package:tzapp/view/main_screen.dart';
import 'package:tzapp/view/onboarding_screen.dart';
import 'storage/subscription_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final isSubscribed = await SubscriptionStorage.isSubscribed();
  runApp(MyApp(isSubscribed: isSubscribed));
}

class MyApp extends StatelessWidget {
  final bool isSubscribed;
  const MyApp({super.key, required this.isSubscribed});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isSubscribed ? const MainScreen() : const OnboardingScreen(),
    );
  }
}