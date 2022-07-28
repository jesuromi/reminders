import 'package:flutter/material.dart';
import 'package:reminders/models/reminder_tag.dart';

class DropdownMenu extends StatefulWidget {
  final String label;
  final void Function(String) onSelected;
  final List<Enum> enumOptions;

  const DropdownMenu(
      {required this.label,
      required this.onSelected,
      required this.enumOptions,
      Key? key})
      : super(key: key);

  @override
  State<DropdownMenu> createState() => _DropdownMenuState();
}

class _DropdownMenuState extends State<DropdownMenu> {
  String dropdownValue = "Trabajo";

  @override
  Widget build(BuildContext context) {
    widget.onSelected(dropdownValue);
    List<String> options = [];
    widget.enumOptions.forEach((element) {options.add(element.name); });

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Text(widget.label),
          const SizedBox(width: 8.0),
          DropdownButton<String>(
            value: dropdownValue,
            icon: const Icon(Icons.arrow_circle_down_sharp),
            elevation: 16,
            hint: Text(widget.label),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
                widget.onSelected(dropdownValue);
              });
            },
            items: options
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
