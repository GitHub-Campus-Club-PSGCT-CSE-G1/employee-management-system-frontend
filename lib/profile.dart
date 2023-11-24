import 'package:flutter/material.dart';
import 'utilities.dart';

class Profile extends StatelessWidget {
  const Profile({super.key, required this.data});

  final String data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(data)));
  }
}
