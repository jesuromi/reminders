import 'package:flutter/material.dart';
import 'package:reminders/widgets/dropdown_box.dart';
import 'package:reminders/models/reminder_tag.dart';
import 'package:reminders/widgets/text_box.dart';

import 'models/reminder.dart';

class RegisterReminder extends StatefulWidget {
  const RegisterReminder({Key? key}) : super(key: key);

  @override
  State<RegisterReminder> createState() => _RegisterReminderState();
}

class _RegisterReminderState extends State<RegisterReminder> {
  late TextEditingController controllerTitle;
  late TextEditingController controllerDescription;
  late TextEditingController controllerTag;
  late String tagValue = "";

  //void getTagValue(String currentValue) => tagValue = currentValue;
  @override
  void initState() {
    controllerTitle = TextEditingController();
    controllerDescription = TextEditingController();
    controllerTag = TextEditingController();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar Recordatorio'),
      ),
      body: ListView(
        children: [
          TextBox(controllerTitle, 'Titulo'),
          TextBox(controllerDescription, 'Descripción'),
          DropdownMenu(label: 'Etiqueta',onSelected: (String currentValue) =>tagValue = currentValue,enumOptions:ReminderTag.values),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.purple),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('CANCELAR')),
              const SizedBox(width: 20.0),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.purple),
                  onPressed: () {
                    String title = controllerTitle.text;
                    String description = controllerDescription.text;
                    String tag = tagValue;
                    if (title.isNotEmpty &&
                        description.isNotEmpty &&
                        tag.isNotEmpty) {
                      Navigator.pop(
                          context,
                          Reminder(
                              title: title,
                              description: description,
                              tag: tag));
                    }
                  },
                  child: Text("AGREGAR")),
            ],
          )
        ],
      ),
    );
  }
}
