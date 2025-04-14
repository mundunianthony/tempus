import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import 'signup_page.dart';
import '../../widgets/custom_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange.shade50,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 100),
            Image.asset('assets/images/tempus_logo.png', height: 100), // 👈 your logo
            const SizedBox(height: 24),
            const Text(
              'Welcome to Tempus',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 24),
            CustomButton(
              text: loading ? 'Logging in...' : 'Login',
              onPressed: () async {
                setState(() => loading = true);
                await Provider.of<AuthProvider>(context, listen: false)
                    .signIn(emailController.text, passwordController.text);
                setState(() => loading = false);
              },
            ),
            const SizedBox(height: 12),
            TextButton(
              child: const Text("Don't have an account? Sign up"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SignUpPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
