import 'package:flutter/material.dart';

class PictureAnimation extends StatefulWidget {
  const PictureAnimation({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PictureAnimationState createState() => _PictureAnimationState();
}

class _PictureAnimationState extends State<PictureAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Define the tween for vertical movement
    _animation = Tween<double>(
      begin: 1.0, // Start from the bottom (full height)
      end: 0.0, // Move to the top (zero height)
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller when done
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // Positioned widget to animate the image
          Positioned(
            bottom: 0, // Start from the bottom
            left: 0,
            right: 0,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1), // Start from bottom
                end: const Offset(0, 0), // End at the original position
              ).animate(_controller),
              child: Image.asset(
                'assets/images/splash1.png', // Example image
                fit: BoxFit.cover,
                height: 300, // Set height as needed
              ),
            ),
          ),
        ],
      ),
    );
  }
}
