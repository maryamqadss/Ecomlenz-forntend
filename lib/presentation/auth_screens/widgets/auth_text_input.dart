import 'package:flutter/material.dart';

import '../../../style/style.dart';


class AuthTextInput extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final bool isPassword;
  final IconData prefixIcon;
  final String? Function(String?)? validator;

  const AuthTextInput({
    super.key,
    required this.controller,
    this.hintText = 'Enter text',
    this.labelText = 'Label',
    this.isPassword = false,
    this.prefixIcon = Icons.person,
    this.validator,
  });

  @override
  _AuthTextInputState createState() => _AuthTextInputState();
}

class _AuthTextInputState extends State<AuthTextInput> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    Color inputColor = Colors.grey.shade100;
    Color hintColor = Colors.grey;
    Color iconColor = secondary_Color;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: iconColor,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: widget.controller,
          cursorColor: iconColor,
          obscureText: widget.isPassword ? _obscureText : false,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: hintColor,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
            prefixIcon: Icon(
              widget.prefixIcon,
              color: iconColor,
            ),
            filled: true,
            fillColor: inputColor,
            contentPadding: const EdgeInsets.all(14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide.none,
            ),
            suffixIcon: widget.isPassword
                ? IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility : Icons.visibility_off,
                color: iconColor,
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            )
                : null,
          ),
          validator: widget.validator, // Correctly pass validator here
        ),
      ],
    );
  }
}
