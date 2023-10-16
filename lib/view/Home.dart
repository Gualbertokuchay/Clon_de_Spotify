import 'package:flutter/material.dart';
import 'package:spotify/view/Registro.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    Future.delayed(const Duration(seconds: 3), () {
      _controller.forward().then((_) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const Registro(),
          ),
        );
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Opacity(
              opacity: _animation.value,
              child: child,
            );
          },
          child: Image.asset(
            'assets/spotify.png',
            width: 150,
            height: 150,
          ),
        ),
      ),
    );
  }
}
