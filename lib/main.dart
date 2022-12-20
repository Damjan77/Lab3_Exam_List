import 'package:flutter/material.dart';
import 'package:lab3_exams_193222/models/list_exam.dart';
import 'package:lab3_exams_193222/widgets/NewExam.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Flutter Hello World',
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // A widget which will be started on application startup
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ListExam> exams = [
    ListExam(id: "D0", subject: "Strukturno programiranje", dataAndTime: "12.10.2022"),
    ListExam(id: "D1", subject: "Bazi na podatoci", dataAndTime: "10.10.2022"),
    ListExam(id: "D2", subject: "Napredno programiranje", dataAndTime: "11.10.2022"),
  ];

  void _addItemFunction(BuildContext ct) {
    showModalBottomSheet(
        context: ct,
        builder: (_) {
          return GestureDetector(
              onTap: () {},
              child: NewExam(_addNewExamToList),
              behavior: HitTestBehavior.opaque);
        });
  }

  void _addNewExamToList(ListExam item) {
    setState(() {
      exams.add(item);
    });
  }

  void _deleteExam(String id) {
    setState(() {
      exams.removeWhere((elem) => elem.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // The title text which will be shown on the action bar
        title: Text("Lab3_193222"),
        actions: <Widget>[
          IconButton(
            onPressed: () => _addItemFunction(context),
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: Center(
        child: exams.isEmpty
            ? Text("No exams!")
            : ListView.builder(
          itemBuilder: (ctx, index) {
            return Card(
              elevation: 3,
              margin: EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 10,
              ),
              child: ListTile(
                title: Text(exams[index].subject),
                subtitle: Text("${exams[index].dataAndTime}"),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => _deleteExam(exams[index].id),
                ),
              ),
            );
          },
          itemCount: exams.length,
        ),
      ),
    );
  }
}
