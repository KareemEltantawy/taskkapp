import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


void showToast({
  required String msg,
  required Color backgroundColor,
}) => Fluttertoast.showToast(
  msg: msg,
  backgroundColor: backgroundColor,
  textColor: Colors.white,
  toastLength: Toast.LENGTH_LONG, // LENGTH_LONG 5s for android
  gravity: ToastGravity.BOTTOM,
  timeInSecForIosWeb: 5,  //5s for Ios,Web
  fontSize: 16.0,
);


Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 3.0,
  required var function,
  required String text,
}) =>
    Container(
      width: width,
      height: 40.0,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
      ),
    );

Widget defaultTextButton({
  required var function,
  required String text,
}) =>
    TextButton(
      onPressed: function,
      child: Text(
        text.toUpperCase(),
      ),
    );

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  var onSubmit,
  var onChange,
  var onTap,
  bool isPassword = false,
  required var validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  var suffixPressed,
  bool isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null ? IconButton(
            onPressed: suffixPressed,
            icon: Icon(suffix)) : null,
        border: OutlineInputBorder(),
      ),
    );






void navigateTo(context, widget) => Navigator.push(context, MaterialPageRoute(
  builder: (context) => widget,
),
);

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
      (route) {
    return false;
  },
);


