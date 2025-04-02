import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:todo_app_test/const/colors.dart';
import 'package:todo_app_test/data/firestore.dart';
import 'package:todo_app_test/screen/add_note_screen.dart';
import 'package:todo_app_test/widget/stream_note.dart';
import 'package:todo_app_test/widget/task_widget.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

bool show = true;

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.logout))],
      ),
      backgroundColor: backgroundColor,
      floatingActionButton: Visibility(
        visible: show,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddNoteScreen()));
          },
          backgroundColor: c_green,
          child: Icon(
            Icons.add,
            size: 30,
          ),
        ),
      ),
      body: SafeArea(
          child: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          if (notification.direction == ScrollDirection.forward) {
            setState(() {
              show = true;
            });
          }
          if (notification.direction == ScrollDirection.reverse) {
            setState(() {
              show = false;
            });
          }
          return true;
        },
        child: Column(
          children: [
            Stream_note(false),
            Text(
              'isDone',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.bold),
            ),
            Stream_note(true),
          ],
        ),
      )),
    );
  }
}
