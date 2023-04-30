import 'package:flutter/material.dart';

import '../../constants/appcolor.dart';

class CustomTextFormField extends StatelessWidget {
  String hintText;
  String? Function(String?)? validator;
  void Function(String)? onChange;
  TextInputType? fieldType;
  TextEditingController? textController;
  CustomTextFormField(
      {super.key,
      required this.hintText,
      this.textController,
      this.onChange,
      this.validator,
      this.fieldType});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
      // padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      // width: double.infinity,
      // height: 40,
      // decoration: BoxDecoration(
      //   border: Border.all(
      //     color: AppColor.borderColor,
      //   ),
      // color: const Color(0xffffffff),
      // borderRadius: BorderRadius.circular(10),
      // ),
      child: TextFormField(
        keyboardType: fieldType,
        validator: validator,
        onChanged: onChange,
        controller: textController,
        decoration: InputDecoration(
          fillColor: const Color(0xffffffff),
          filled: true,
          contentPadding: const EdgeInsets.only(left: 10),
          // border: InputBorder.none,
          hintText: '$hintText',
          hintStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            color: AppColor.hintTextColor,
          ),
        ),
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          height: 1,
          // color: AppColor.hintTextColor,
        ),
      ),
    );
  }
}
