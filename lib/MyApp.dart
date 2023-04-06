import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  String name;
  int age;
  MyApp({Key? key, required this.name, required this.age}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    print("Run initState");
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);

    print("Run dispose");
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      print("Run Background");
    } else if (state == AppLifecycleState.resumed) {
      print("Run resumed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "This is a Stateful Widget",
      home: Scaffold(
          appBar: AppBar(title: const Text("This is health app")),
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(DateFormat("dd/MM/yyyy").format(DateTime.now()))
            ],
          ))),
    );
  }
}
