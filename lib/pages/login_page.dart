import 'package:flutter/material.dart';
import 'package:techstore_flutter/utils/routes.dart';


class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/login_image.png",
              fit: BoxFit.cover,
              ),
            const SizedBox(height: 20.0,),
            const Text(
              "Sign in",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0,),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: Column(children: [
                  TextFormField(
                    decoration: const InputDecoration(
                    hintText: "Enter username",
                    labelText: "Username",
                    ),
                  ),

                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                    hintText: "Enter password",
                    labelText: "Password",
                    ),
                  ),
                  const SizedBox(height: 20.0,),

                  ElevatedButton(
                    child: Text("Login"),
                    style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                    onPressed: (){
                      Navigator.pushNamed(context, MyRoutes.homeRoute);
                    },
                  )
                ],
              )
            ),
          ], 
        )
      )
    );
  }
}