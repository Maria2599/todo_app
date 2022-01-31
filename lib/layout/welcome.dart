import 'package:flutter/material.dart';

import 'menu.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
               Padding(
                 padding: const EdgeInsets.only(bottom: 50.0,top: 50.0),
                 child: SafeArea(
                        child: Text(
                      "Hello",
                      style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    )),
               ),
      Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: (BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50))),
                color: Colors.blueAccent,

              ),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:[
                    Text("What to do",style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold,color: Colors.white)),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        "What to do is a simple app Start your task and Check when finished",style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    Spacer(),
                    Center(
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>  Menu()));
                          },
                          child: Text("Get Started",style: TextStyle(fontSize: 20),),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.black26),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))))),
                    )
                  ]),
              ),
            ),
          ),
      ),

    ]),
        );
  }
}
