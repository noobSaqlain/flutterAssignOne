import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 233, 238, 243),
      title: Text(
        "Jobs",
        style: Theme.of(context).textTheme.headlineLarge,
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 28.0),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
            iconSize: 30,
          ),
        )
      ],
    );
  }
}
