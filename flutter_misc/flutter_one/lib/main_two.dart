import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class Ball {
  Ball(this.position, this.velocity);
  Offset position;
  Offset velocity;
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  final List<Ball> balls = [];
  late Ticker _ticker;

  @override
  void initState() {
    super.initState();
    _ticker = Ticker(_update)..start();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  void _addBall() {
    final position = Offset(0.0, 0.0);
    final velocity = Offset(
        Random().nextDouble() * 4.0 - 2.0, Random().nextDouble() * 4.0 - 2.0);
    balls.add(Ball(position, velocity));
  }

  void _update(Duration duration) {
    setState(() {
      for (var ball in balls) {
        ball.position = ball.position + ball.velocity;
        if (ball.position.dx <= 0 ||
            ball.position.dx >= MediaQuery.of(context).size.width) {
          ball.velocity = Offset(-ball.velocity.dx, ball.velocity.dy);
        }
        if (ball.position.dy <= 0 ||
            ball.position.dy >= MediaQuery.of(context).size.height) {
          ball.velocity = Offset(ball.velocity.dx, -ball.velocity.dy);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          for (var ball in balls)
            Positioned(
              left: ball.position.dx,
              top: ball.position.dy,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
              ),
            )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addBall,
        tooltip: 'Add Ball',
        child: const Icon(Icons.add),
      ),
    );
  }
}
