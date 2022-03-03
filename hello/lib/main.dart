import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  bool flag = false;

  _click() async {
    setState(() {
      flag = !flag;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [Icon(Icons.create), Text("First title")],
        ),
      ),
      drawer: const Drawer(
        child: const Center(
          child: const Text("Drawer"),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedOpacity(
              opacity: flag ? 0.1 : 1.0,
              duration: Duration(seconds: 3),
              child: Text(
                "fadeout text",
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            AnimatedSize(
              duration: Duration(seconds: 3),
              vsync: this,
              child: SizedBox(
                width: flag ? 50 : 200,
                height: flag ? 50 : 200,
                child: Container(color: Colors.purple),
              ),
            ),
            AnimatedAlign(
              alignment: flag ? Alignment.topLeft : Alignment.bottomRight,
              duration: Duration(seconds: 3),
              child: SizedBox(
                width: 50,
                height: 50,
                child: Container(color: Colors.green),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _click,
            child: Icon(Icons.add),
          )
        ],
      ),
    );
  }
}

class StatelesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stateles Page"),
      ),
      body: const Text("Stateles pattern"),
    );
  }
}
