import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wether1_api/screen/wether/provider/wether_provider.dart';
import 'package:wether1_api/screen/wether/view/splsh_screen.dart';
import 'package:wether1_api/screen/wether/view/wether_screen.dart';

void main()
{
  runApp(
    ChangeNotifierProvider(
      create: (context) => WetherProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context) => SplshScreen(),
          '2':(context) => WetherScreen(),


        },
      ),
    )
  );
}