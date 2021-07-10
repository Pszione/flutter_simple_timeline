import 'package:flutter/material.dart';
import 'package:simple_timeline/entity/timeline_entity.dart';
import 'package:simple_timeline/presenter/simple_timeline_impl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter simple timeline',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter simple timeline'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(child:  Column(children: [
          SimpleTimeLine(timelineList: [
            TimelineEntity(
                enable: true,
                description: "Lorem Ipsum",
                title: "Lorem Ipsum"),
            TimelineEntity(
                enable: true,
                description: "Lorem Ipsum",
                title: "Lorem Ipsum"),
            TimelineEntity(
                enable: true,
                description: "Lorem Ipsum",
                title: "Lorem Ipsum"),
            TimelineEntity(enable: false, title: "Lorem Ipsum"),
            TimelineEntity(
                enable: false,
                title: "Lorem Ipsum",
                description:
                'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
                disableColor: Colors.red)
          ]),
          SimpleTimeLine(timelineList: [
            TimelineEntity(
                enable: true,
                description: "Lorem Ipsum",
                title: "Lorem Ipsum"),
            TimelineEntity(
                enable: true,
                description: "Lorem Ipsum",
                title: "Lorem Ipsum"),
            TimelineEntity(
                enable: true,
                description: "Lorem Ipsum",
                title: "Lorem Ipsum"),
            TimelineEntity(enable: false, title: "Lorem Ipsum"),
            TimelineEntity(
                enable: false,
                title: "Lorem Ipsum",
                description:
                'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
                disableColor: Colors.red)
          ]),
        ],)
      )),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
