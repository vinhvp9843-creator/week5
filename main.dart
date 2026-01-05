import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/* =======================
   APP ROOT
======================= */
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'UTH SmartTasks',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}

/* =======================
   MODEL (OOP)
======================= */
class OnboardingModel {
  final String title;
  final String description;
  final IconData icon;

  OnboardingModel({
    required this.title,
    required this.description,
    required this.icon,
  });
}

/* =======================
   ONBOARDING SCREEN
======================= */
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<OnboardingModel> pages = [
    OnboardingModel(
      title: 'Easy Time Management',
      description:
      'With management based on priority and daily tasks, it will give you convenience.',
      icon: Icons.access_time,
    ),
    OnboardingModel(
      title: 'Increase Work Effectiveness',
      description:
      'Time management and determination of more important tasks.',
      icon: Icons.bar_chart,
    ),
    OnboardingModel(
      title: 'Reminder Notification',
      description:
      'Get reminders so you don’t forget to keep your assignments.',
      icon: Icons.notifications,
    ),
  ];

  void _nextPage() {
    if (_currentIndex < pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: pages.length,
        onPageChanged: (index) {
          setState(() => _currentIndex = index);
        },
        itemBuilder: (context, index) {
          final page = pages[index];
          return Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(page.icon, size: 120, color: Colors.blue),
                const SizedBox(height: 30),
                Text(
                  page.title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15),
                Text(
                  page.description,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: _nextPage,
                  child: Text(
                    index == pages.length - 1
                        ? 'Get Started'
                        : 'Next',
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
