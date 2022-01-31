import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';
import 'newtask.dart';

GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

class Menu extends StatelessWidget {
  int Index = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, States>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) => Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                if (!scaffoldKey.currentState!.isDrawerOpen) {
                  //check if drawer is closed
                  scaffoldKey.currentState!.openDrawer(); //open drawer
                }
              },
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 70.0),
            child: Center(
                child: Text("Start your TODO List",
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(96, 134, 37, 37)))),
          ),
          drawer: Drawer(
            child: ListView(children: [
              DrawerHeader(
                //header of drawer
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Image.asset('images/img.jpg', fit: BoxFit.cover,),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text("Name"),
              ),
              ListTile(
                leading: Icon(Icons.email),
                title: Text("Email"),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
              ),
              ListTile(
                  leading: Icon(Icons.task),
                  title: Text('New task'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => NewTask()));
                  }),
              ListTile(
                leading: Icon(Icons.check),
                title: Text('Done'),
              ),
              ListTile(
                leading: Icon(Icons.archive),
                title: Text('Archived'),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
