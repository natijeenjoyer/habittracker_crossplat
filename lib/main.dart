import 'package:flutter/material.dart';

void main() {
  runApp(const AssignmentFirstApp());
}

class AssignmentFirstApp extends StatelessWidget {
  const AssignmentFirstApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '1st assignment',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
      ),
      home: const MyHomePage(title: 'First Assignment'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _showText = false;
  TextStyle currentStyle = TextStyle(fontSize: 20, color: Colors.black);
  List<Color> colors = [Colors.red, Colors.blue, Colors.green, Colors.orange];
  int currentColorIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Click on of these buttons:'),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _showText = true;
                  currentStyle = TextStyle(fontSize: 20, color: Colors.black);
                });
              },
              child: const Text('Show Text'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _showText = false;
                  currentStyle = TextStyle(fontSize: 20, color: Colors.black);
                });
              },
              child: const Text('Hide Text'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  currentColorIndex = (currentColorIndex + 1) % colors.length;
                  currentStyle = TextStyle(
                    fontSize: 20,
                    color: colors[currentColorIndex],
                  );  
                });
              },
              child: const Text('Change Color'),
            ),
            if (_showText)
              Text(
                'Hello World!',
                style: currentStyle,
              ),
            
          ],
        ),
      ),
    );
  }
}
