import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import 'login_page.dart';
import '../../widgets/custom_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
            Image.asset('assets/images/tempus_logo.png', height: 100),
            const SizedBox(height: 24),
            const Text(
              'Create Your Tempus Account',
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
              text: loading ? 'Signing up...' : 'Sign Up',
              onPressed: () async {
                setState(() => loading = true);
                try {
                  await Provider.of<AuthProvider>(context, listen: false)
                      .signUp(emailController.text, passwordController.text);
                  if (mounted) {
                    Navigator.pop(context); // Return to LoginPage after success
                  }
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Sign-up failed: ${e.toString()}')),
                  );
                } finally {
                  if (mounted) {
                    setState(() => loading = false);
                  }
                }
              },
            ),
            const SizedBox(height: 12),
            TextButton(
              child: const Text('Already have an account? Log in'),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}