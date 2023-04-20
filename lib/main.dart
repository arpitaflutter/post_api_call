import 'package:flutter/material.dart';
import 'package:post_api_call/screens/data/view/data_screen.dart';
import 'package:post_api_call/screens/home/provider/homeProvider.dart';
import 'package:post_api_call/screens/home/view/add_data.dart';
import 'package:provider/provider.dart';

void main()
{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => homeProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context) =>home_screen(),
          'data':(context) =>data_screen(),
        },
      ),
    ),
  );
}