import 'package:flutter/material.dart';
import 'package:flutter2/yourYear.dart';

import './calendar.dart';
import './trends.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VisiMood',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: MyHomePage(title: 'VisiMood Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final _pageOptions = [CalendarPage(), Trends(), YourYear()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VisiMood'),
        elevation: 0.0,
      ),
      body: _pageOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            title: Text('Calendar'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timeline),
            title: Text('Trends'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Your Year'),
            activeIcon: Icon(Icons.cake)
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        backgroundColor: Colors.white70,
        onTap: _onItemTapped,
        elevation: 0.0,
      ),
    );
  }
}
