import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.deepPurple),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  //test git commit

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 50, fontWeight: FontWeight.normal);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Calendar',
      style: optionStyle,
    ),
    Text(
      'Add Mood',
      style: optionStyle,
    ),
    Text(
      'Trends',
      style: optionStyle,
    ),
  ];

  int count = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      count++;
    });
    //print("button clicked $count times");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VisiMood'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            title: Text('Calendar'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            title: Text('Add Mood'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timeline),
            title: Text('Trends'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
