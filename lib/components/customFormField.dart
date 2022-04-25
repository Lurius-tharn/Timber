import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField(
      {Key? key,
      required this.hintText,
      required this.errorText,
      this.validator})
      : super(key: key);
  final String errorText;
  final String hintText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
      children: [
        Text(hintText,
            style: const TextStyle(
              overflow: TextOverflow.ellipsis,
            )),
        Expanded(
          flex: 1,
          child: TextFormField(
            validator: validator,
            decoration: InputDecoration(
                hintText: hintText,
                contentPadding: const EdgeInsets.symmetric(horizontal: 10.0)),
          ),
        )
      ],
    ));
  }
}
