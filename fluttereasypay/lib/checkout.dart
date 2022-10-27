import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttereasypay/success.dart';
import 'package:paywithpayazaflutter/sdk/paywithpayaza.dart';



class Checkout extends StatefulWidget{
  late final VoidCallback onPressed;

  @override
  checkout createState() => checkout();
}

class checkout extends State<Checkout>{

  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController merchantKeyController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  String connectionMode = "";
  String res = "";

  callback(response){
    setState(() {
      res = response;
    });
  }

  @override void initState() {
    super.initState();
    print("Hello, we came back!!!");
  }


  @override
  Widget build(BuildContext context) {
    List<bool> _selections = List.generate(2, (_) => false);

    print("Checkout response is: "+ res.toString());

    if(res.toString().isEmpty){

    }else{
      final body = json.decode(res);
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)
      => Success(response: body.toString())));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Payaza flutter'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              Text("Testing flutter sdk"),
              SizedBox(height: 15, width: double.infinity,),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
              SizedBox(height: 5, width: double.infinity,),
              TextField(
                controller: firstNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'First name',
                ),
              ),
              SizedBox(height: 5, width: double.infinity,),
              TextField(
                controller: lastNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'last name',
                ),
              ),
              SizedBox(height: 5, width: double.infinity,),
              TextField(
                controller: phoneController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Phone',
                ),
              ),
              SizedBox(height: 5, width: double.infinity,),
              TextField(
                controller: merchantKeyController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Merchant key',
                ),
              ),
              SizedBox(height: 5, width: double.infinity,),
              ToggleButtons(
                children: [
                  Icon(Icons.offline_bolt_outlined),
                  Icon(Icons.offline_bolt)
                ],
                isSelected: _selections,
                selectedColor: Colors.blue[900],
                fillColor: Colors.blue[500],
                renderBorder: false,
                onPressed: (int index){
                  setState(() {
                    _selections[index] = !_selections[index];

                    if (index==0 && _selections[index]){
                      connectionMode = "Test";
                    }else{
                      connectionMode = "Live";
                    }

                  });
                },
              ),
              SizedBox(height: 5, width: double.infinity,),
              TextField(
                controller: amountController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Checkout amount',
                ),
              ),
              SizedBox(height: 15, width: double.infinity,),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SendRequest(
                        connectionMode : connectionMode,
                        merchantKey : merchantKeyController.text,
                        checkOutAmount : int.parse(amountController.text),
                        Phone : phoneController.text,
                        firstName : firstNameController.text,
                        lastName : lastNameController.text,
                        email : emailController.text,
                        CallbackPage: "/success",
                        CheckoutPage: "/checkout",
                    )));
                  },
                  child: Text("Pay with payaza")
              )
            ],
          ),
        ),
      )
    );

  }

}