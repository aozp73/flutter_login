import 'package:flutter/material.dart';
import 'package:flutter_login/components/my_input_decoration.dart';

class CustomTextFormField extends StatelessWidget {
  final title;
  final bool isObscure; // 시그니처 제외하곤 타입 다 명시적으로 지정

  const CustomTextFormField(this.title, {this.isObscure = false, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title),
        TextFormField(
          validator: (value) => value!.isEmpty ? "Please enter some text" : null,
          // onChanged: (text){
          //   print(text);
          // },
            obscureText: isObscure,
            decoration: MyInputDecoration("Enter $title"), // ${n+2}
        ),
      ],
    );
  }
}
