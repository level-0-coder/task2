import 'package:flutter/material.dart';

class CustomProfileField extends StatelessWidget {
  const CustomProfileField({
    super.key, required this.label, required this.value,
  });

  final String label, value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(8)),
            height: 50,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                value,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  overflow: TextOverflow.ellipsis
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
