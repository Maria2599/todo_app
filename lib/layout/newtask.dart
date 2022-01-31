import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';

var titlecontroller = TextEditingController();
var timecontroller = TextEditingController();
var datecontroller = TextEditingController();

class NewTask extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NewTaskState();
}

class NewTaskState extends State<NewTask> {
  bool showform = false;
  var formKey = GlobalKey<FormState>();
  var Scaffoldkey = GlobalKey<ScaffoldState>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AppCubit()..createDatabase(),
        child: BlocConsumer<AppCubit, States>(
            listener: (BuildContext context, state) {
              if(state is insertDatabaseState){
                Navigator.pop(context);
              }
            },
            builder: (BuildContext context, Object? state) {
              AppCubit cubit = BlocProvider.of(context);
              return Scaffold(
                key: Scaffoldkey,
                body: cubit.Screens[cubit.Index],

                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    if (showform) {
                      if (formKey.currentState!.validate()) {
                        cubit.insert(
                            title: titlecontroller.text,
                            time: timecontroller.text,
                            date: datecontroller.text);
                        showform = false;
                        setState(() {});
                      }
                    } else {
                      Scaffoldkey.currentState!.showBottomSheet((context) =>
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Form(
                              key: formKey,
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Title must found';
                                        }
                                        return null;
                                      },
                                      keyboardType: TextInputType.text,
                                      controller: titlecontroller,
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.title),
                                        labelText: "Title",
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Time must found';
                                        }
                                        return null;
                                      },
                                      keyboardType: TextInputType.datetime,
                                      controller: timecontroller,
                                      decoration: InputDecoration(
                                        prefixIcon:
                                            Icon(Icons.watch_later_outlined),
                                        labelText: "Time",
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Date must found';
                                        }
                                        return null;
                                      },
                                      keyboardType: TextInputType.datetime,
                                      controller: datecontroller,
                                      decoration: InputDecoration(
                                        prefixIcon:
                                            Icon(Icons.calendar_today_outlined),
                                        labelText: "Date",
                                      ),
                                    ),
                                  ]),
                            ),
                          ));
                      showform = true;
                      setState(() {});
                    }
                  },
                  child: showform ? Icon(Icons.add) : Icon(Icons.edit),
                ),
                bottomNavigationBar: BottomNavigationBar(
                  currentIndex: AppCubit.get(context).Index,
                  onTap: (index) => AppCubit.get(context).changeIndex(index),
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.task), label: 'Task'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.done), label: 'Done'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.archive), label: 'Archive'),
                  ],
                ),

              );
            }));
  }
}
