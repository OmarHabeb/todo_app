import 'package:flutter/material.dart';
import 'package:todo/logic/shared.dart';
import 'package:todo/logic/sqf.dart';
import 'package:todo/model/model.dart';
import 'package:todo/screens/todode.dart';

class todolist extends StatefulWidget {
  const todolist({super.key});

  @override
  State<todolist> createState() => _todolistState();
}

class _todolistState extends State<todolist> {
  sqf sg = sqf();
  List<Note> notes = [];
  var cache = CacheHelper();
  bool v = false;
  @override
  void initState() {
    var rd = cache.getData(key: 'value');
    if (rd != null) {
      v = rd;
    } else {
      v = false;
    }
    loadnotes();
    super.initState();
  }

  loadnotes() async {
    var resp = await sg.readDate('SELECT * FROM notes');
    setState(() {
      notes = resp.map((map) => Note.fromMap(map)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: v ? Colors.black : Colors.white,
      body: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: notes.length,
          itemBuilder: (context, index) {
            if (notes.isEmpty) {
              return Center(child: Text("no data" ,  style: TextStyle(color:  v?Colors.white:Colors.black),));

            }
            return ListTile(
              title: Text(
                notes[index].title.toString(),
                style: TextStyle(color:  v?Colors.white:Colors.black),
              ),
              subtitle: Text(notes[index].description.toString(),
                  style: TextStyle(color:  v?Colors.white:Colors.black)),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => todode(
                              notes: notes[index],
                            ))).then((v) => loadnotes());
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: v?Colors.white:Colors.black,
          child: Icon(Icons.add , color: v?Colors.black:Colors.white,),
          onPressed: () {
            Navigator.push(
                    context, MaterialPageRoute(builder: (context) => todode()))
                .then((v) => loadnotes());
          }),
    );
  }
}
