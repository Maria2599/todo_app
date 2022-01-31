import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/layout/cubit/states.dart';
import 'package:todo_app/modules/archived.dart';
import 'package:todo_app/modules/done.dart';
import 'package:todo_app/modules/tasks.dart';

class AppCubit extends Cubit<States> {
  AppCubit() : super(appInitStates());
  static AppCubit get(context) => BlocProvider.of(context);

  int Index = 0;
  Database? database;
  List<Widget> Screens = [TaskScreen(), DoneScreen(), ArchivedScreen()];

  void changeIndex(int index) {
    Index = index;
    emit(changeIndexNow());
  }

  List<Map> taskat = [];
  List<Map> newtasks = [];
  List<Map> donetasks = [];
  List<Map> archivetasks = [];


  void createDatabase() {
    openDatabase('NewTodo.db', version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db
          .execute(
              'CREATE TABLE Test (id INTEGER PRIMARY KEY,title TEXT, time TEXT, date TEXT,stat TEXT)');
          //then btkon badl async w await

    }, onOpen: (database) {
      print("database is opened");
      getData(database);
    }).then((value) => {
    emit(createDatabaseState()),
    print("created"),
    database=value
        // getData(taskat),
    }).catchError((error) {
      print(error.toString());
    });
  }

  //3shan ma3rfsh hat5ls amta
  Future insert({
    required String title,
    required String time,
    required String date,
  })  async{
   await  database!.transaction((txn) async{
      txn.rawInsert(
              'INSERT INTO Test( title, time, date, stat) VALUES("$title", "$time", "$date","new")')
          .then((value) => {
                emit(insertDatabaseState()),
                print("Insert"),
        getData(database)
          })
          .catchError((error) {
        print("insertion error");
      });
    });
  }

  void getData(database)  {
    newtasks=[];
    donetasks=[];
    archivetasks=[];
     database.rawQuery('SELECT * FROM Test').then((value){
       taskat=value;
       for (var item in taskat) {
         if (item["stat"] == "new") {
           newtasks.add(item);
         }else if (item['stat']=="done") {
           donetasks.add(item) ;
         } else {
           archivetasks.add(item) ;
         }
       }
       print(newtasks);
       print(donetasks);
       print(archivetasks);
       print(taskat.toString());
     });

      deleteDatabase('firstapp.db');
  }

  void updateData({required String stat, required int id}) async {
    await database!.rawUpdate(
        'UPDATE Test SET stat = ? WHERE id = ?',
        [stat, id]).then((value) => {emit(updateDataState())});
    getData(database);
  }

  void deleteData({required int id}) async {
    await database!.rawDelete('DELETE FROM Test WHERE id = ?',
        [id]).then((value) => {getData(database),emit(deleteDataState())});
  }
}
