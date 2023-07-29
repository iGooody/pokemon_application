// ignore_for_file: prefer_const_constructors
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        dividerColor: Colors.black,
        listTileTheme: ListTileThemeData(iconColor: Colors.black),
        textTheme: TextTheme(
            bodyMedium: const TextStyle(
              fontFamily: "Times New Roman",
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
            labelSmall: TextStyle(
              color: Colors.black.withOpacity(0.8),
              fontFamily: "Arial",
              fontWeight: FontWeight.w700,
              fontSize: 14,
            )),
      ),
      home: const MyHomePage(title: 'Pokemon App'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Center(
            child: Text(widget.title),
          )),
      body: ListView.separated(
        itemCount: 20,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (contex, i) => ListTile(
          leading: SvgPicture.asset(
            'assets/svg/pokeball_icon.svg',
            height: 40,
            width: 40,
          ),
          title: Text(
            ' ${i + 1}. Pokemon',
          ),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
