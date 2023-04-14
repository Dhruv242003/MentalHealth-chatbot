import 'package:flutter/material.dart';
import 'package:frontend/services/firebase_auth_methods.dart';
import 'package:frontend/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.read<FirebaseAuthMethods>().user;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("HOME SCREEN"),
          SizedBox(height: 20,),
          Text(user.uid),
          CustomButton(
            onTap: () {
              context.read<FirebaseAuthMethods>().signOut(context);
            },
            text: 'Sign Out',
          ),
        ],
      ),
    );
  }
}
