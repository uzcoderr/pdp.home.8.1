import 'package:flutter/material.dart';
import 'package:untitled2/service/ApiService.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _counter = 0;

  String s = "a";

  String resName = '';
  String resLogin = '';
  String avatarImg = '';

  void _apiGetOneUser(){
    ApiService.GET(ApiService.USER).then((value) => {
      setState(() {
        resName = value!.name.toString();
        resLogin = value.login.toString();
        avatarImg = value.avatarUrl.toString();
      })
    });
  }

  @override
  void initState() {
    _apiGetOneUser();
    super.initState();
  }

  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: name,
                  onChanged: (_){
                    ApiService.NAME = name.text;
                  },
                ),
              ),
              ElevatedButton(
                  onPressed: (){
                    _apiGetOneUser();
                  },
                  child: const Text('Search')
              )
            ],
          ),
          Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text('Name :'),
                      Text(resName)
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Username :'),
                      Text(resLogin)
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Avatar Image :'),
                      Expanded(child: Image(image: NetworkImage(avatarImg),))
                    ],
                  ),
                ],
              )
          )
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
