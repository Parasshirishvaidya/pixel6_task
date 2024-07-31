import 'package:flutter/material.dart';
import 'package:pixle_task/Screens/widgets/employee_List.dart';
import 'package:pixle_task/provider/provider.dart';
import 'package:provider/provider.dart';

import 'Screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context)=> ProviderManager(),
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        home:HomeScreen()
      ),
    );
  }
}
