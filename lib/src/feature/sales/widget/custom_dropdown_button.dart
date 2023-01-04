import 'package:flutter/material.dart';

class CustomDropdownButton<T> extends StatelessWidget {
  const CustomDropdownButton(
      {super.key,
      required this.value,
      required this.onChanged,
      required this.items,
      required this.toDropdownMenuItem,
      required this.title,
      this.padding = true,
      required this.toName});
  final T? value;

  final void Function(T?) onChanged;
  final bool padding;
  final List<T> items;
  final DropdownMenuItem<T> Function(T) toDropdownMenuItem;
  final String title;
  final String Function(T?) toName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: padding ? 10 : 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 60,
            child: DropdownButtonFormField<T>(
              items: items.map((e) => toDropdownMenuItem(e)).toList(),
              onChanged: onChanged,
              validator: (value) {
                if (value == null || toName(value).isEmpty) {
                  return "$title tidak boleh kosong";
                }
                return null;
              },
              isExpanded: true,
              decoration: const InputDecoration(
                  errorStyle: TextStyle(
                    fontSize: 12,
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.deepPurpleAccent,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 4)),
              icon: const Icon(Icons.arrow_drop_down),
              iconSize: 24,
              elevation: 16,
            ),
          ),
        ],
      ),
    );
  }
}
