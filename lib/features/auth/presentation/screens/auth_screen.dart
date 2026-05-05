import 'package:flavory/core/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: .center,
            children: [
              Container(
                height: 100,
                width: 100,
                child: Image.asset('assets/icons/food.png'),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                textAlign: .center,
                "Recipes for every taste. \nWith Flavorly",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: .bold,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  context.push(AppConstants.routeSignup);
                },
                child: Text("Sign up"),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 150),
                  backgroundColor: const Color.fromARGB(255, 148, 255, 116),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  context.push(AppConstants.routeSignin);
                },
                child: Text("Sign in"),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 150),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.green,
                  side: BorderSide(color: Colors.green),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
