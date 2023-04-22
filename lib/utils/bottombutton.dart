import 'package:flutter/material.dart';

class BottomButton extends StatefulWidget {
  final VoidCallback onTap;
  final String text;
  final int number;
  final Color containerColor;
  final IconData icondata;

  const BottomButton({
    Key? key,
    required this.onTap,
    required this.text,
    required this.number,
    required this.containerColor,
    required this.icondata,
  }) : super(key: key);

  @override
  State<BottomButton> createState() => _BottomButtonState();
}

class _BottomButtonState extends State<BottomButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          height: 120,
          decoration: BoxDecoration(
            color: widget.containerColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  widget.icondata,
                  color: Colors.white,
                  size: 22.0,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.number.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
