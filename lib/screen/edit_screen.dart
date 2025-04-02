import 'package:flutter/material.dart';
import 'package:todo_app_test/const/colors.dart';
import 'package:todo_app_test/data/firestore.dart';
import 'package:todo_app_test/model/notes_model.dart';

class EditNotScreen extends StatefulWidget {
  final NotesModel note;
  const EditNotScreen({super.key, required this.note});

  @override
  State<EditNotScreen> createState() => _EditNotScreenState();
}

class _EditNotScreenState extends State<EditNotScreen> {
  TextEditingController? _titleController;
  TextEditingController? _subTitleController;
  final _focusNode = FocusNode();
  final _focusNode2 = FocusNode();
  int indexx = 0;

  @override
  void initState() {
    _titleController = TextEditingController(text: widget.note.title);
    _subTitleController = TextEditingController(text: widget.note.subtitle);

    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
    super.initState();
    _focusNode2.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _titleController!.dispose();
    _subTitleController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          taskFields(
              _titleController, _focusNode, "task title", Icons.title, 1),
          SizedBox(
            height: 10,
          ),
          taskFields(_subTitleController, _focusNode2, "task title",
              Icons.subtitles, 3),
          SizedBox(
            height: 20,
          ),
          images_Sections(),
          SizedBox(
            height: 20,
          ),
          butoon_section()
        ],
      )),
    );
  }

  Widget butoon_section() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: c_green,
                minimumSize: Size(170, 48),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10), // Rend le bouton rectangulaire
                ),
              ),
              onPressed: () {
                Firestore_Datasource().Update_Note(widget.note.id, indexx,
                    _titleController!.text, _subTitleController!.text);
                Navigator.pop(context);
              },
              child: Text("add task", style: TextStyle(fontSize: 18))),
          SizedBox(
            width: 10,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                minimumSize: Size(170, 48),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10), // Rend le bouton rectangulaire
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("cancel", style: TextStyle(fontSize: 18))),
        ],
      ),
    );
  }

  Widget images_Sections() {
    return Container(
      height: 140,
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                indexx = index;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      width: 2,
                      color: indexx == index ? c_green : Colors.grey)),
              width: 120,
              margin: EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Image.asset("images/$index.png"),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget taskFields(TextEditingController? _passwordController,
      FocusNode _focusNode, String text, IconData icons, int maxlines) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          maxLines: maxlines,
          controller: _passwordController,
          focusNode: _focusNode,
          style: TextStyle(fontSize: 18, color: Colors.black),
          decoration: InputDecoration(
            prefixIcon:
                Icon(icons, color: _focusNode.hasFocus ? c_green : Colors.grey),
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            hintText: text,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey, width: 2.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: c_green, width: 2.0),
            ),
          ),
        ),
      ),
    );
  }
}
