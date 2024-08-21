import 'package:flutter/material.dart';
import 'package:todo/logic/shared.dart';
import 'package:todo/screens/profile.dart';
import 'package:todo/screens/todolist.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  List<Widget> listw = [todolist(), profile()];
  int num = 0;
  bool? v;
    void initState() {
    var rd = cache.getData(key: 'value');
    if (rd != null) {
      v = rd;
    } else {
      v = false;
    }
    super.initState();
  }
  var cache = CacheHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.grey[300],
       
          selectedItemColor: Colors.black,
          unselectedItemColor:Colors.grey,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            num = value;
            setState(() {
              num = value;
            });
          },
          currentIndex: num,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Home")
          ]),
      body: Container(child: listw.elementAt(num)),
    );
  }
}
