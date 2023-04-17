import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateOfBirthPicker extends StatefulWidget {
  final Function(DateTime?)? onDateSelected;

  const DateOfBirthPicker({this.onDateSelected});

  @override
  _DateOfBirthPickerState createState() => _DateOfBirthPickerState();
}

class _DateOfBirthPickerState extends State<DateOfBirthPicker> {
  late final TextEditingController _textEditingController;
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(text: 'Date of Birth');
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate ?? DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now());

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
      _textEditingController.text = DateFormat.yMd().format(picked);
      widget.onDateSelected?.call(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.875,
      child: TextFormField(
        readOnly: true,
        controller: _textEditingController,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.white,
          filled: true,
          prefixIcon: const Icon(Icons.calendar_today),
          hintText: 'Date of Birth',
          hintStyle: const TextStyle(color: Colors.grey),
        ),
        onTap: () {
          _selectDate(context);
        },
      ),
    );
  }
}
