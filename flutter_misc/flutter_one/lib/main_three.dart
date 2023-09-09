// Importing required Flutter and Material packages.
import 'package:flutter/material.dart';

// The main function is the starting point for the Flutter app.
void main() => runApp(MyApp());

// MyApp is the root widget of the application.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // MaterialApp provides a number of basic app-related behaviors.
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue, // The primary color of the app.
      ),
      home: MyHomePage(), // The main screen of the app.
    );
  }
}

// MyHomePage is a StatefulWidget, meaning its state can change over time.
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// _MyHomePageState holds the mutable state for MyHomePage.
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0; // A private variable to hold the counter value.

  // A method to increase the counter value.
  void _incrementCounter() {
    // setState tells the framework to rebuild the widget.
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold provides a basic layout structure.
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            // Display the counter value.
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
              onPressed: () {
                // Display a snackbar when the button is pressed.
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Hello from Flutter!')),
                );
              },
              child: Text('Show Snackbar'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter, // Call the increment method.
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
