import 'package:flutter/material.dart';
import 'package:todo_app/layout/reg.dart';
import 'package:todo_app/layout/welcome.dart';

var formKey = GlobalKey<FormState>();
var email = TextEditingController();
var pass = TextEditingController();
class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Image.asset('images/img.jpg',height: 250,  width: 250,),
                        Text(
                          "LOG IN",
                          style: TextStyle(
                              fontSize: 29.0,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                          controller: email,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Email is empty';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: "Email",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: pass,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Email is empty';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Password",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            suffixIcon: Icon(Icons.visibility_off),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Don't Have an account?",
                          style: TextStyle(fontSize: 15),
                        ),
                        TextButton(
                          child: Text(
                            "Go SignUP",
                            style: TextStyle(fontSize: 17),
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const Reg()));
                          },
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              print(email.text);
                              print(pass.text);
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const Welcome()));
                            }},
                          child: Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 22,
                                backgroundColor: Colors.blue,
                                color: Colors.white),
                          ),

                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ]),
                ),
              ),
            ),
          ),
        );
  }
}
