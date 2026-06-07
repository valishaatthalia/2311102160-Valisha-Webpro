import 'package:flutter/material.dart';
import 'tutorial_11_1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layout Part 1',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: 'Demo Layout Part 1'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final data = const [
    {"tgl": "02/03/2022", "nilai": "150"},
    {"tgl": "01/02/2022", "nilai": "140"},
    {"tgl": "12/01/2022", "nilai": "170"},
    {"tgl": "11/12/2021", "nilai": "110"},
    {"tgl": "10/11/2021", "nilai": "180"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 10,
          ),
          child: Column(
            children: [
              const SizedBox(height: 20),

              const Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome,",
                      style: TextStyle(
                        color: Color(0xFF7367F0),
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "2311102160 - Valisha Atthalia",
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF4839EB),
                      Color(0xFF7367F0),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Column(
                  children: [
                    Text(
                      "Status tes TOEFL Anda:",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "LULUS",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Listening\n80",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "Structure\n80",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "Reading\n90",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Riwayat Tes",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Expanded(
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(data[index]["tgl"]!),
                      subtitle: Text(
                        "Nilai: ${data[index]["nilai"]}",
                      ),
                    );
                  },
                ),
              ),

              InkWell(
                child: const Text(
                  "Go to Tutorial 11-1",
                  style: TextStyle(
                    color: Colors.indigo,
                    fontSize: 24,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const MyApp11_1(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}