import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'checkout.dart';

class Success extends StatelessWidget {
  final String response;
  const Success(
      {
        Key? key,
        required this.response
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(response.toString()),
            ElevatedButton(onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Checkout()));
              print("Clicked clicked");
            },
                child: Text("Go Back"))
          ],
        ),
      ),
    );
  }
}
