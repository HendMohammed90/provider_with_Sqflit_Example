import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tasks_provider_sqflit/db/aqldb.dart';
import 'package:tasks_provider_sqflit/models/task_model.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  var taskData = TextEditingController();
  var taskTime = TextEditingController();
  var taskDate = TextEditingController();
  var formKey = GlobalKey<FormState>();
  SqlDatabase databaseInstance = SqlDatabase();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                ///Do Some Thing
              },
              icon: const Icon(Icons.save),
            )
          ],
        ),
        body: Center(
          child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 100,
                horizontal: 30,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const Text(
                      'Add Your Task',
                      style: TextStyle(
                        color: Colors.lightBlueAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      // validator: (String? val) {
                      //   if (val!.isEmpty) {
                      //     return 'Write your task';
                      //   }
                      //   return val;
                      // },
                      // textDirection: localized.TextDirection.ltr,
                      controller: taskData,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'What We Should Do',
                        suffixIcon: Icon(Icons.task),
                      ),
                      onChanged: (val) {
                        taskData.text = val;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      // validator: (String? val) {
                      //   if (val!.isEmpty) {
                      //     return 'Choose your time';
                      //   }
                      //   return val;
                      // },
                      keyboardType: TextInputType.datetime,
                      controller: taskTime,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: '00:00:00',
                        suffixIcon: Icon(Icons.lock_clock_sharp),
                      ),
                      onChanged: (val) {
                        taskTime.text = val;
                      },
                      onTap: () {
                        print('Time tapped');
                        showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        ).then((value) {
                          print(
                            value?.format(context),
                          );
                          taskTime.text = value!.format(context);
                        });
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      // validator: (String? val) {
                      //   if (val!.isEmpty) {
                      //     return 'Choose your date';
                      //   }
                      //   return val;
                      // },
                      keyboardType: TextInputType.datetime,
                      controller: taskDate,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: 'Choose your date',
                        suffixIcon: Icon(Icons.date_range),
                      ),
                      onChanged: (val) {
                        taskDate.text = val;
                      },
                      onTap: () {
                        // print('Date tapped');
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.parse('1990-01-01'),
                          lastDate: DateTime.parse('2022-11-30'),
                        ).then(
                          (value) {
                            print(
                              DateFormat.yMMM().format(value!),
                            );
                            taskDate.text = DateFormat.yMMM().format(value);
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.lightBlueAccent,
                        minimumSize: const Size.fromHeight(50), // NEW
                      ),
                      onPressed: () async {
                        // print(newTaskData);
                        // pushTaskItem(newTaskData);
                        // Provider.of<Tasklest>(context, listen: false)
                        //     .addTask(newTaskData);
                        // Navigator.of(context).pop();
                        // if (formKey.currentState!.validate()) {
                        // SqlDate.insertData(
                        //     date: timeData.value,
                        //     title: textData.value,
                        //     time: timeData.value);
                        // Provider.of<Tasklest>(context, listen: false)
                        //     .addTask(textData.value, timeData.value, timeData.value);
                        // print(taskData.text);
                        // print(taskTime.text);
                        // print(taskDate.text);
                        int result = await databaseInstance.insertData(
                            title: taskData.value,
                            date: taskDate.value,
                            time: taskTime.value);
                        print('result is ${result}');
                        // List<Task> responce = await databaseInstance.readData();
                        // print('Tasks are : ${responce}');
                        // Navigator.of(context).pop();
                        // SqlDate.getSingleData();
                        // }
                      },
                      child: const Text(
                        'Add',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));

    ;
  }
}
