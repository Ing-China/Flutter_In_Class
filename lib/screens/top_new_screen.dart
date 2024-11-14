import 'package:flutter/material.dart';

class TopNewScreen extends StatefulWidget {
  const TopNewScreen({super.key});

  @override
  State<TopNewScreen> createState() => _TopNewScreenState();
}

class _TopNewScreenState extends State<TopNewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TOP NEW'),
      ),
    );
  }
}
