import 'package:flutter/material.dart';
import 'package:movie_app/viewmodel/main_viewmodel.dart';
import 'view/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MainViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // color: Colors.black,
      debugShowCheckedModeBanner: false,
       home: HomePage(),
     
    );
  }
}
