import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/layout/cubit/cubit.dart';

Widget buildTaskItem(Map model,context) =>  Padding(
  padding: const EdgeInsets.all(15.0),
  child:Row(
    children: [
       Padding(
         padding: const EdgeInsets.only(left: 10.0),
         child: Text(model['time'],style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
       ),
        Expanded(
          child:Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
              Text(model['title'],
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
            ),
            Text(model['date'], style: TextStyle(fontSize: 17,color: Color.fromARGB(
                116, 0, 0, 0))),
            ]
            ),
          )  ),
      IconButton(
          onPressed: () {
            AppCubit cubit = BlocProvider.of(context);
            cubit.updateData(stat: 'done', id: model['id']);
          },
          icon: Icon(
            Icons.check_box_outlined,
            color: Colors.green,
          )),
      IconButton(
          onPressed: () {
            AppCubit cubit = BlocProvider.of(context);
            cubit.updateData(stat: 'archive', id: model['id']);
          },
          icon: Icon(
            Icons.archive,
            color: Colors.grey,
          ))

    ],
  ),
);