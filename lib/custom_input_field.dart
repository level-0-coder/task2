import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField(
      {super.key,
      required this.label,
      required this.hint,
      required this.textEditingController,
      this.dataType = TextInputType.text,
      this.expand = false});

  final String label, hint;
  final TextEditingController textEditingController;
  final TextInputType dataType;
  final bool expand;
  @override
  Widget build(BuildContext context) {
    return expand
        ? Expanded(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(4),
                      child: Text(
                        label,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                    TextField(
                      keyboardType: dataType,
                      controller: textEditingController,
                      decoration: InputDecoration(
                        hintText: hint,
                        // label: Text('FirstName'),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ]),
            ),
          )
        : Padding(
            padding: EdgeInsets.all(8),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: EdgeInsets.all(4),
                child: Text(
                  label,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              TextField(
                keyboardType: dataType,
                controller: textEditingController,
                decoration: InputDecoration(
                  hintText: hint,
                  // label: Text('FirstName'),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ]),
          );
  }
}
