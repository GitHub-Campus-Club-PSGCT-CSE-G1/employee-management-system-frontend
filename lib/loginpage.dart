import 'package:flutter/material.dart';
import 'utilities.dart';
import 'profile.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              "Sign in",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: font()),
            )),
        LabelledTextField(label: "Email"),
        LabelledTextField(label: "Password"),
        ElevatedButton(
          child: const Text('Login'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return FutureBuilder(
                    future: loadCustomer(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator(); // Show a loader while waiting
                      } else {
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          print(snapshot.data);
                          return Profile(data: snapshot.data.toString());
                        }
                      }
                    });
              }),
            );
          },
        ),
      ],
    )));
  }
}
