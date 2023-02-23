import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home_page extends StatefulWidget {
  const Home_page({Key? key}) : super(key: key);

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  TextEditingController emailControler = TextEditingController();
  TextEditingController passControler = TextEditingController();

  void saveText(String text) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("text", text);
  }

  void readText() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? savedValue = pref.getString("text");
    if (savedValue != null) {
      emailControler.text = savedValue;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home_Screen"),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.grey,
        child: Column(
          children: [
            TextFormField(
              onChanged: (value) {
                saveText(value);
              },
              controller: emailControler,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Email"),
            ),
            //passsword
            TextFormField(
              onChanged: (value) {
                saveText(value);
              },
              controller: passControler,
              obscureText: true,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Password"),
            ),
          ],
        ),
      ),
    );
  }
}
