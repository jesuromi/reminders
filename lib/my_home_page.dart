import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:reminders/utils/color_tag.dart';
import 'package:reminders/register_reminder.dart';
import 'package:reminders/models/reminder_tag.dart';

import 'models/reminder.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Reminder> auxReminders = [
    /**Reminder(
        title: 'Recordatorio 1', description: 'Descripcion 1', tag: 'Trabajo'),
    Reminder(
        title: 'Recordatorio 2', description: 'Descripción 2', tag: 'Estudio'),
    Reminder(
        title: 'Recordatorio 3', description: 'Descripción 3', tag: 'Trabajo'),
  **/];

  List<Reminder> reminders = [];

  final List<Enum> enumOptions = ReminderTag.values;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recordatorios'),
      ),
      drawer: Drawer(
        child: ListView.builder(
          itemCount: enumOptions.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                setState(() {
                  reminders = auxReminders.where((search) => search.tag == enumOptions[index].name).toList();
                  Navigator.of(context).pop();
                });
              },
              onLongPress: () {},
              title: Text(enumOptions[index].name),
              leading: const Icon(Icons.add_photo_alternate_outlined),
            );
          },
        ),

      ),
      body: ListView.builder(
        itemCount: reminders.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {},
            onLongPress: () {},
            title: Text(reminders[index].title + " " + reminders[index].tag),
            subtitle: Text(reminders[index].description),
            leading: const Icon(Icons.ad_units),
            trailing: Container(
                padding: EdgeInsets.all(10.0),
                color: colorTag(reminders[index].tag),
                width: 95.0,
                child: Text(reminders[index].tag,style: const TextStyle(color: Colors.white),)),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: () {
          Navigator.push(context,
                  MaterialPageRoute(builder: (_) => RegisterReminder()))
              .then((newReminder) {
            if (newReminder != null) {
              setState(() {
                auxReminders.add(newReminder);
                reminders = List.from(auxReminders);
              });
            }
          });
        },
        tooltip: "Add Reminder",
        child: const Icon(Icons.add),
      ),
    );
  }
}

