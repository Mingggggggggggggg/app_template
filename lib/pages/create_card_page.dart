import 'package:flutter/material.dart';

class CreateCardPage extends StatefulWidget {
  const CreateCardPage({super.key});

  @override
  State<CreateCardPage> createState() => _CreateCardPageState();
}

class _CreateCardPageState extends State<CreateCardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Create Card")));
  }
}
