import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:myfirstapp/constants.dart';
import 'package:intl/intl.dart';

class Reports extends StatelessWidget {
  // final dateFormatter = DateFormat('yyyy-MM-dd');
  // DateTime now = DateTime.now();
// String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
  todayDate() {
    var now = new DateTime.now();
    var formatter = new DateFormat('dd-MM-yyyy');
    String formattedTime = DateFormat('kk:mm:a').format(now);
    String formattedDate = formatter.format(now);
    print(formattedTime);
    print(formattedDate);

    return formattedTime;
  }

  String newValue;
  // final int index=0;
  // List we = Writereport();
  int index = 0;
  Reports({this.newValue});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Make a report'),
      body: ListView.builder(
        itemCount: wr.length,
        itemBuilder: (context, index) {
          return Card(
              color: Colors.red,
              child: ListTile(
                title: Text(wr[index]),
                trailing: Text(todayDate()),
              ));
        },
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: generalColor,
        child: Icon(Icons.add),
        onPressed: () {
          todayDate();
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Writereport()));
        },
      ),
      // body: ListView.builder(itemBuilder: null),
    );
  }
}

final List<String> wr = [];
//report writting class

class Writereport extends StatelessWidget {
  String value;

  Writereport({this.value});
  TextEditingController _reportController = TextEditingController();
  TextEditingController _titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Write Report'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: ReportsFields(
                controller: _titleController,
                hintText: 'Report Title',
              ),
            ),
            Container(
                height: 150,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: ReportsFields(
                  controller: _reportController,
                  hintText: 'Body',
                )),
            RaisedButton(
              onPressed: () {
                wr.add(_reportController.text);
                wr.add(_titleController.text);
                value = _reportController.text;
                print(value);

               
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (contex) => Reports(
                              newValue: value,
                            )));
              },
              color: generalColor,
              child: Text(
                'Submit',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
class ReportsFields extends StatelessWidget {
  final String hintText;
  final Function onsubmitted;
  final TextEditingController controller;
  const ReportsFields({this.hintText, this.controller, this.onsubmitted});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: onsubmitted,
      controller: controller,
      maxLines: null,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 15),
      decoration: InputDecoration(hintText: hintText, border: InputBorder.none),
    );
  }
}
