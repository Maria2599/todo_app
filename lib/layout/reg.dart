
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Reg extends StatelessWidget {
  const Reg({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: SingleChildScrollView(
                child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Image.asset('images/img.jpg',height: 250,),
                  Text(
                    "SignUp",
                    style: TextStyle(
                        fontSize: 29.0,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Name",
                      border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Email",
                      border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      suffixIcon: Icon(Icons.visibility_off),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextButton(
                    onPressed: () {

                    },
                    child: Text(
                      "   SIGN UP   ",
                      style: TextStyle(
                          fontSize:20,
                          color: Colors.white),
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)))),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Have an account?",
                    style: TextStyle(fontSize: 20),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Go Login",
                        style: TextStyle(fontSize: 20),
                      )),
                ]),
              ),
            ),
          ),

    );
  }
}
