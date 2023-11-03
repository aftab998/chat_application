import 'package:chat_application/screens/chat/chats.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: home(),
    );
  }
}

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  int _currentINdex = 0;
  @override
  Widget build(BuildContext context) {
    final _page = <Widget>[
      Chats(),
      Chats(),
      Chats(),
      Chats(),
      Chats(),
    ];
    final _bottomNavBarItem = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
          icon: Icon(
            Icons.chat,
            size: 30,
            color: Colors.black,
          ),
          label: 'Chats'),
      const BottomNavigationBarItem(
          icon: Icon(
            Icons.people,
            size: 30,
            color: Colors.black,
          ),
          label: 'Groups'),
      const BottomNavigationBarItem(
          icon: Icon(
            Icons.phone,
            size: 30,
            color: Colors.black,
          ),
          label: 'Calls'),
      const BottomNavigationBarItem(
          icon: Icon(
            Icons.group,
            size: 30,
            color: Colors.black,
          ),
          label: 'Communties'),
      const BottomNavigationBarItem(
          icon: Icon(
            Icons.cell_tower,
            size: 30,
            color: Colors.black,
          ),
          label: 'Status'),
    ];
    assert(_page.length == _bottomNavBarItem.length);

    final bottomNavBar = BottomNavigationBar(
      items: _bottomNavBarItem,
      currentIndex: _currentINdex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          _currentINdex = index;
        });
      },
    );

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.teal,
        shape: CircleBorder(),
      ),
      body: _page[_currentINdex],
      bottomNavigationBar: bottomNavBar,
    );
  }
}
