import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTextFormField extends StatefulWidget {
  final String hint;
  final TextInputType? keyboardType;
  final bool ispass;
  final TextEditingController? controller;

  const MyTextFormField( {this.controller,
    super.key,
    required this.hint,
    this.keyboardType,
    this.ispass = false,
  });

  @override
  State<MyTextFormField> createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  bool isobscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller ,
      keyboardType: widget.keyboardType,
      obscureText: isobscure && widget.ispass,
      onTapOutside: (e) => FocusScope.of(context).unfocus(),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
        hintText: widget.hint,
        suffixIcon: widget.ispass
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isobscure = !isobscure;
                  });
                },
                icon: Icon(
                  isobscure ? Icons.visibility_off : Icons.remove_red_eye,
                ),
              )
            : null,
      ),
    );
  }
}
