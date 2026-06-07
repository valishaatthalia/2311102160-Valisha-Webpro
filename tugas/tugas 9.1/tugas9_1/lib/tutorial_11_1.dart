import 'package:flutter/material.dart';
import 'main.dart';
import 'tutorial_11_2.dart';

class MyApp11_1 extends StatelessWidget {
  const MyApp11_1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Tutorial11Page(),
    );
  }
}

class Tutorial11Page extends StatefulWidget {
  const Tutorial11Page({super.key});

  @override
  State<Tutorial11Page> createState() =>
      _Tutorial11PageState();
}

class _Tutorial11PageState
    extends State<Tutorial11Page> {
  int selected = 0;

  final PageController pc =
      PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pc,
        onPageChanged: (index) {
          setState(() {
            selected = index;
          });
        },
        children: [
          Center(
            child: InkWell(
              child: const Text(
                'Go to Home Page',
                style: TextStyle(fontSize: 30),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const MyApp(),
                  ),
                );
              },
            ),
          ),
          const MyApp11_2(),
          const Center(
            child: Text(
              'Profile Page',
              style: TextStyle(fontSize: 30),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selected,
        onTap: (index) {
          setState(() {
            selected = index;
          });

          pc.animateToPage(
            index,
            duration:
                const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.email),
            label: 'Email',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}