import 'package:flutter/material.dart';
import 'package:todo/logic/shared.dart';
import 'package:todo/screens/homepage.dart';

class logIN extends StatefulWidget {
  const logIN({super.key});

  @override
  State<logIN> createState() => _logInState();
}

class _logInState extends State<logIN> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  var cache = CacheHelper();
  var res1;
  var res2;
  @override
  void initState() {
    
    var name_res = cache.getData(key: 'name');
    var email_res = cache.getData(key: 'email');
    var age_res = cache.getData(key: 'age');
    if (name_res != null && email_res != null && age_res != null) {
      res1 = name_res;
      res2 = email_res;
    } else {
      res1 = '';
      res2 = '';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text('Login page'),
      ),
      body: SingleChildScrollView(
        
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.only(top: 50),
          
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(hintText: "Name"),
                  controller: name,
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(hintText: "Email"),
                  controller: email,
                ),
                SizedBox(height: 30),
                Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextButton(
                        onPressed: () {
                          cache.setData(key: 'name', value: name.text);
                          cache.setData(key: 'email', value: email.text);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => homepage()));
                        },
                        child: Text(
                          "Save",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
