import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}
class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}
class _HomepageState extends State<Homepage> {
  String weight = '';
  String height = '';
  num inputValue = 0;
  num IMT = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Center(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Твой индекс массы тела - $inputValue",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.teal,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        onChanged: (value) {
                          setState(() {
                            weight = value;
                          });
                        },
                        style: TextStyle(color: Colors.teal),
                        cursorColor: Colors.teal,
                        autocorrect: false,
                        keyboardType: TextInputType.number,
                        maxLength: 3,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.pink.withOpacity(.08),
                            labelText: 'Введи свой вес',
                            labelStyle:
                            TextStyle(color: Colors.teal.withOpacity(.8)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.teal),
                                borderRadius: BorderRadius.circular(30).copyWith(
                                    bottomRight: Radius.circular(0),
                                    topLeft: Radius.circular(0))),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.teal),
                                borderRadius: BorderRadius.circular(30).copyWith(
                                    bottomRight: Radius.circular(0),
                                    topLeft: Radius.circular(0)))),
                      ),
                      TextField(
                        onChanged: (value) {
                          setState(() {
                            height = value;
                          });
                        },
                        style: TextStyle(color: Colors.teal),
                        cursorColor: Colors.teal,
                        autocorrect: false,
                        keyboardType: TextInputType.number,
                        maxLength: 3,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.pink.withOpacity(.08),
                            labelText: 'Введи свой рост',
                            labelStyle:
                            TextStyle(color: Colors.teal.withOpacity(.8)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.teal),
                                borderRadius: BorderRadius.circular(30).copyWith(
                                    bottomRight: Radius.circular(0),
                                    topLeft: Radius.circular(0))),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.teal),
                                borderRadius: BorderRadius.circular(30).copyWith(
                                    bottomRight: Radius.circular(0),
                                    topLeft: Radius.circular(0)))),
                      ),
                      TextButton(
                        onPressed: () {
                          double onWeight = double.parse(weight);
                          double onHeight = double.parse(height);
                          onHeight = onHeight/100;
                          double imt = onWeight / (onHeight * onHeight);
                          num IMT = num.parse(imt.toStringAsFixed(2));;
                          print(IMT);
                          setState(() {
                            inputValue = IMT;
                          });
                        },
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.teal)
                        ),
                        child: Text('Определить индекс массы тела',
                            selectionColor: Colors.pink.withOpacity(.8)),
                      ),
                    ],
                  ))),
        ));
  }
}