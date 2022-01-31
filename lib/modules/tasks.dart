import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/layout/cubit/cubit.dart';
import 'package:todo_app/layout/cubit/states.dart';
import 'package:todo_app/shared/component.dart';

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, States>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = BlocProvider.of(context);
          return Scaffold(
              body: ListView.separated(
                  //haid5ol 3la List task w ymsk l index l 2ola 0 w ba3d kda 1
                  itemBuilder: (context, index) =>
                      buildTaskItem(cubit.newtasks[index],context),
                  separatorBuilder: (context, index) => Container(
                        height: 1,
                        color: Colors.grey,
                      ),
                  itemCount: cubit.newtasks.length),

          );

        });
  }
}
