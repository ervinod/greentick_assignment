import 'package:flutter/material.dart';
import 'package:greentick_assignment/presentation/screens/recommendation_screen.dart';
import 'package:greentick_assignment/providers/recommendation_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RecommendationProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: RecommendationScreen(),
      ),
    );
  }
}
