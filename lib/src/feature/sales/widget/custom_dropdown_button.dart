// ignore_for_file: public_member_api_docs, sort_constructors_first
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
              value: value,
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

class OnPressedField extends StatelessWidget {
  const OnPressedField({
    Key? key,
    this.padding = true,
    required this.title,
    this.onPressed,
    required this.value,
  }) : super(key: key);
  final bool padding;
  final String title;
  final String value;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      validator: (data) {
        if (value.isEmpty) {
          return "$title tidak boleh kosong";
        }
        return null;
      },
      builder: (validate) {
        return Padding(
          padding: EdgeInsets.only(bottom: padding ? 10 : 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              TextButton(
                onPressed: onPressed,
                style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    shape: const RoundedRectangleBorder(
                        side: BorderSide(
                      color: Colors.black,
                    ))),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(value),
                ),
              ),
              if (validate.errorText != null ||
                  (validate.errorText?.isNotEmpty ?? false))
                Text(
                  validate.errorText ?? "",
                  style: const TextStyle(
                    color: Colors.red,
                  ),
                )
            ],
          ),
        );
      },
    );
  }
}
