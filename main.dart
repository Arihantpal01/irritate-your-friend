import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:telephony/telephony.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final telephony = Telephony.instance;
  TextEditingController mobilenum = TextEditingController();
  TextEditingController message = TextEditingController();
  TextEditingController nummessage = TextEditingController();
  var i = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text('lets irritate your friend'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 10,
                  ),
                  child: TextField(
                    controller: mobilenum,
                    decoration: InputDecoration(
                      hintText: 'mobile number',
                    ),
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 10,
                  ),
                  child: TextField(
                    controller: nummessage,
                    decoration: InputDecoration(
                      hintText: 'number of times',
                    ),
                    keyboardType: TextInputType.number,
                    maxLength: 2,
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 10,
                    ),
                    child: TextField(
                      controller: message,
                      expands: true,
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: 'content',
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    setState(() {
                      i = int.parse(nummessage.text);
                    });

                    for (int k = 1; k <= i; k++) {
                      telephony.sendSms(
                        to: mobilenum.text,
                        message: message.text,
                      );
                    }
                  },
                  child: Text(
                    'send',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
