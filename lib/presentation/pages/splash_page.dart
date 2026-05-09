import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/di/injection.dart';
import '../../data/services/splash_service.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();

    startApp();
  }

  Future<void> startApp() async {

    final splashService = sl<SplashService>();

    await splashService.startDelay();

    if (mounted) {
      context.go('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [

            Text(
              'UTD Store - Muhammad',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10),

            Text(
              'NIM: 20123092',
              style: TextStyle(fontSize: 18),
            ),

            SizedBox(height: 20),

            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}