import 'package:flutter/material.dart';
import 'package:todo/logic/shared.dart';
import 'package:todo/logic/sqf.dart';
import 'package:todo/model/model.dart';

class todode extends StatefulWidget {
  final Note? notes;
  const todode({super.key, this.notes});

  @override
  State<todode> createState() => _tododeState();
}

class _tododeState extends State<todode> {
  var cache = CacheHelper();
  sqf sq = sqf();
  TextEditingController title = TextEditingController();
  TextEditingController subtitle = TextEditingController();
  TextEditingController description = TextEditingController();

  bool v = false;
  @override
  void initState() {
    var rd = cache.getData(key: 'value');
    if (rd != null) {
      v = rd;
    } else {
      v = false;
    }
    if (widget.notes != null) {
      title.text = widget.notes!.title ?? '';
      subtitle.text = widget.notes!.subtitle ?? '';
      description.text = widget.notes!.description ?? '';
    }

    super.initState();
  }

  savenotes() async {
    if (title.text.isNotEmpty &&
        subtitle.text.isNotEmpty &&
        description.text.isNotEmpty) {
      if (widget.notes == null) {
        await sq.insertData(
            "INSERT INTO notes (title,subtitle,description) VALUES('${title.text}','${subtitle.text}','${description.text}')");
      } else {
        await sq.updateData(
            "UPDATE notes SET title = '${title.text}',subtitle='${subtitle.text}',description='${description.text}' WHERE id = ${widget.notes!.id}");
      }
      Navigator.pop(context);
    }
  }

  deletenotes() async {
    if (widget.notes != null) {
      await sq.deleteData("DELETE FROM notes WHERE id = ${widget.notes!.id}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: v?Colors.black:Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                  style: TextStyle(color:  v?Colors.white:Colors.black),
                decoration: InputDecoration(
                  labelText: 'Enter Title',
                  labelStyle: TextStyle(color: v?Colors.white:Colors.black)
                ),
                controller: title,
              ),
              TextField(
                style: TextStyle(color:  v?Colors.white:Colors.black),
                decoration: InputDecoration(
                
                     labelStyle: TextStyle(color: v?Colors.white:Colors.black),
                  labelText: 'Enter Subtitle',
                ),
                controller: subtitle,
              ),
              TextField(
                  style: TextStyle(color:  v?Colors.white:Colors.black),
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: v?Colors.white:Colors.black),
                  labelText: 'Enter Decoration',
                ),
                controller: description,
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(onPressed: savenotes, child: Text("submet"))
            ],
          ),
        ),
      ),
    );
  }
}
