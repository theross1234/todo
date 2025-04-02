import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:todo_app_test/const/colors.dart';
import 'package:todo_app_test/data/firestore.dart';
import 'package:todo_app_test/model/notes_model.dart';
import 'package:todo_app_test/screen/edit_screen.dart';

class TaskWidget extends StatefulWidget {
  final NotesModel note;
  const TaskWidget({super.key, required this.note});

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    bool isDone = widget.note.isDone;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: Container(
        width: double.infinity,
        height: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              // image
              image(),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.note.title,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Checkbox(
                            value: isDone,
                            onChanged: (value) {
                              setState(() {
                                isDone = !isDone;
                              });
                              Firestore_Datasource()
                                  .isdone(widget.note.id, isDone);
                            })
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      widget.note.subtitle,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade400),
                    ),
                    Spacer(),
                    edit_time_Button()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget edit_time_Button() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Container(
            width: 90,
            height: 28,
            decoration: BoxDecoration(
              color: c_green,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 3, bottom: 3),
                    child: Image.asset('images/icon_time.png'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.note.time,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditNotScreen(
                            note: widget.note,
                          )));
            },
            child: Container(
              width: 90,
              height: 28,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Image.asset('images/icon_edit.png'),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'edit',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget image() {
    return Container(
      height: 130,
      width: 100,
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage('images/${widget.note.image}.png'),
            fit: BoxFit.cover,
          )),
    );
  }
}
