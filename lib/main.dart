import 'package:flutter/material.dart';
import 'package:flutter2/yourYear.dart';

import './calendar.dart';
import './addMood.dart';
import './trends.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VisiMood',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: MyHomePage(title: 'VisiMood Home Page'),
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

  final _pageOptions = [CalendarPage(), AddMood(), Trends(), YourYear()];

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
            icon: Icon(Icons.add),
            title: Text('Add Mood'),
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
