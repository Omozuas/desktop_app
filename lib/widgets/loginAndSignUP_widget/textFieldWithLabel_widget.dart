import 'package:codegraniteflutter/colorsConstrain/colorsHex.dart';
import 'package:flutter/material.dart';

Widget textFiled(
    {label,
    hintText,
    err,
    controller2,
    suffixIcon2,
    keyboardType4,
    validate,
    onchange,
    keys,
    obscureText = false}) {
  return Form(
    key: keys,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            color: GlobalColors.DarkBorder,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 5),
        TextFormField(
          onChanged: onchange,
          validator: validate,
          controller: controller2,
          keyboardType: keyboardType4,
          obscureText: obscureText,
          decoration: InputDecoration(
              suffixIcon: suffixIcon2,
              errorText: err,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
              hintText: hintText,
              helperStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: GlobalColors.lightBorder),
                  borderRadius: BorderRadius.circular(10)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: GlobalColors.DarkBorder),
                  borderRadius: BorderRadius.circular(10))),
        ),
      ],
    ),
  );
}

Widget largTextFiled(
    {label,
    hintText,
    err,
    controller2,
    suffixIcon2,
    keyboardType4,
    validate,
    onchange,
    keys,
    contentPadding,
    obscureText = false}) {
  return Form(
    key: keys,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            color: GlobalColors.DarkBorder,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 5),
        TextFormField(
          maxLines: 5,
          onChanged: onchange,
          validator: validate,
          controller: controller2,
          keyboardType: keyboardType4,
          obscureText: obscureText,
          decoration: InputDecoration(
              suffixIcon: suffixIcon2,
              errorText: err,
              contentPadding: contentPadding,
              hintText: hintText,
              hintMaxLines: 50,
              helperStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: GlobalColors.lightBorder),
                  borderRadius: BorderRadius.circular(10)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: GlobalColors.DarkBorder),
                  borderRadius: BorderRadius.circular(10))),
        ),
      ],
    ),
  );
}

Widget largTextFiled2(
    {hintText,
    err,
    controller2,
    suffixIcon2,
    keyboardType4,
    validate,
    onchange,
    keys,
    contentPadding,
    obscureText = false}) {
  return Form(
    key: keys,
    child: TextFormField(
      maxLines: 5,
      onChanged: onchange,
      validator: validate,
      controller: controller2,
      keyboardType: keyboardType4,
      obscureText: obscureText,
      decoration: InputDecoration(
          suffixIcon: suffixIcon2,
          errorText: err,
          contentPadding: contentPadding,
          hintText: hintText,
          hintMaxLines: 50,
          helperStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: GlobalColors.lightBorder),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: GlobalColors.DarkBorder),
              borderRadius: BorderRadius.circular(10))),
    ),
  );
}
