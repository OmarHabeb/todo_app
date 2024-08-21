import 'package:flutter/material.dart';
import 'package:todo/logic/shared.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  var cache = CacheHelper();
  var name;
  var email;
  bool v = false;
  @override
  void initState() {
      var rd = cache.getData(key: 'value');
    if (rd != null) {
      v = rd;
    } else {
      v = false;
    }
    var name_res = cache.getData(key: 'name');
    var email_res = cache.getData(key: 'email');
    if (name_res != null && email_res != null) {
      name = name_res;
      email = email_res;
    } else {
      name = '';
      email = '';
    }
    super.initState();
  }

  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: v?Colors.black:Colors.white,
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Name :$name",
              style: TextStyle(color:v?Colors.white:Colors.black, fontSize: 25),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "E-mail :$email ",
              style: TextStyle(color: v?Colors.white:Colors.black, fontSize: 25),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "Theme : ",
                  style: TextStyle(
                    color: v?Colors.white:Colors.black,
                    fontSize: 25
                  ),
                ),
                Switch(value: v, onChanged: (value) {
                  setState(() {
                  v = value;
              cache.setData(key: 'value', value: v);

                  });
                },)
              ],
            ),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "LogOut",
                  style: TextStyle(color: Colors.red, fontSize: 25),
                ))
          ],
        ),
      ),
    );
  }
}
