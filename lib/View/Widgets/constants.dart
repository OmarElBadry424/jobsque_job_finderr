import 'package:flutter/material.dart';

final scaffoldKey= GlobalKey<ScaffoldState>();
final formKey= GlobalKey<FormState>();

var nameController= TextEditingController();
String? userId="";

TextEditingController usernameController=TextEditingController();
TextEditingController emailController=TextEditingController();
TextEditingController phoneController=TextEditingController();
