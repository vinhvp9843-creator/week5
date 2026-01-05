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
      home: ForgetPasswordScreen(),
    );
  }
}

/* =======================
   SCREEN 1: FORGET PASSWORD
======================= */
class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Forget Password')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Text(
              'Enter your Email, we will send you a verification code',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Your Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => VerifyCodeScreen(
                      email: emailController.text,
                    ),
                  ),
                );
              },
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}

/* =======================
   SCREEN 2: VERIFY CODE
======================= */
class VerifyCodeScreen extends StatelessWidget {
  final String email;

  const VerifyCodeScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    final TextEditingController codeController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Verify Code')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Text(
              'Verification code was sent to:\n$email',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: codeController,
              decoration: const InputDecoration(
                labelText: 'Verification Code',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ResetPasswordScreen(email: email),
                  ),
                );
              },
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}

/* =======================
   SCREEN 3: RESET PASSWORD
======================= */
class ResetPasswordScreen extends StatelessWidget {
  final String email;

  const ResetPasswordScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Create New Password')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Text(
              'Create new password for:\n$email',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: confirmController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Confirm Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ConfirmScreen(
                      email: email,
                      password: passwordController.text,
                    ),
                  ),
                );
              },
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}

/* =======================
   SCREEN 4: CONFIRM
======================= */
class ConfirmScreen extends StatelessWidget {
  final String email;
  final String password;

  const ConfirmScreen({
    super.key,
    required this.email,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Confirm')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, size: 80, color: Colors.green),
            const SizedBox(height: 20),
            const Text(
              'Password Reset Successful!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Text('Email: $email'),
            Text('New Password: $password'),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: const Text('Finish'),
            ),
          ],
        ),
      ),
    );
  }
}
