import 'package:flutter/material.dart';
import 'package:vibe_buzz1/homescreen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
                'https://is1-ssl.mzstatic.com/image/thumb/Purple211/v4/86/c6/7e/86c67e46-028b-c829-0b99-a4b8a8ab7ded/AppIcon-0-0-1x_U007epad-0-0-85-220.png/512x512bb.jpg',
                height: 180),
            const SizedBox(height: 20),
            const Text('Welcome to Vibe Buzz',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.tealAccent)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()));
              },
              child: const Text('Get Started'),
            )
          ],
        ),
      ),
    );
  }
}
