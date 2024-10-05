import 'package:flutter/material.dart';
import 'package:flutterassign1/widgets/bottomNavBar.dart';
import 'package:flutterassign1/widgets/appbar.dart';
import 'package:flutterassign1/widgets/network.dart';

void main() {
  return runApp(
    MaterialApp(
      title: "assignment",
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.blue,
            secondary: Colors.grey,
          ),
          fontFamily: 'Roboto',
          textTheme: const TextTheme(
            headlineSmall: TextStyle(fontSize: 20, color: Colors.blue),
            headlineMedium: TextStyle(fontSize: 24, color: Colors.blue),
            headlineLarge: TextStyle(fontSize: 30, color: Colors.black),
          )),
      home: const HomePage(),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(),
      ),
      body: NetworkLayer(),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
