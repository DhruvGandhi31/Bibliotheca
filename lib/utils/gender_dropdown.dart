import 'package:flutter/material.dart';

class GenderPicker extends StatefulWidget {
  final Function(String?)? onGenderSelected;

  const GenderPicker({this.onGenderSelected});

  @override
  _GenderPickerState createState() => _GenderPickerState();
}

class _GenderPickerState extends State<GenderPicker> {
  final TextEditingController _textEditingController =
      TextEditingController(text: 'Gender');

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
            borderSide: BorderSide(color: Colors.white),
          ),
          fillColor: Colors.white,
          filled: true,
          prefixIcon: const Icon(Icons.person),
          hintText: 'Gender',
          hintStyle: const TextStyle(color: Colors.grey),
        ),
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 200,
                child: Column(
                  children: [
                    ListTile(
                      title: const Text('Male'),
                      onTap: () {
                        _textEditingController.text = 'Male';
                        widget.onGenderSelected?.call('Male');
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: const Text('Female'),
                      onTap: () {
                        _textEditingController.text = 'Female';
                        widget.onGenderSelected?.call('Female');
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: const Text('Other'),
                      onTap: () {
                        _textEditingController.text = 'Other';
                        widget.onGenderSelected?.call('Other');
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
