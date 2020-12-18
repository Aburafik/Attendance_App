import 'package:flutter/material.dart';
import 'package:myfirstapp/constants.dart';
// import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:table_calendar/table_calendar.dart';

class AttendanceRecorder extends StatefulWidget {
  @override
  _AttendanceRecorderState createState() => _AttendanceRecorderState();
}

class _AttendanceRecorderState extends State<AttendanceRecorder> {
  CalendarController _calendarController;

  List _markers = [];

  @override
  void initState() {
    _calendarController = CalendarController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: generalColor,
        title: Text('Attendance History'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Card(
              elevation: 10,
              child: TableCalendar(
                builders: CalendarBuilders(
                    markersBuilder: (context, date, events, holiday) {
                  final children = [];
                  if(events.isEmpty){
                    children.add(Positioned(
                      bottom: 1,
                      child:_buildEventsMarkerNum(date) ));
                                        }
                                      }),
                      
                                      //startDay: ,
                                      //availableGestures: ,
                                      //daysOfWeekStyle: DaysOfWeekStyle(),
                                      calendarStyle: CalendarStyle(
                                        selectedColor: Colors.yellow,
                                        todayColor: Colors.red,
                                      ),
                                      headerStyle: HeaderStyle(
                                        centerHeaderTitle: true,
                                        formatButtonVisible: false,
                                        // titleTextBuilder:(date, locale) => DateFormat.yM(locale).format(date),
                                      ),
                                      calendarController: _calendarController,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RaisedButton(
                                      onPressed: () {},
                                      color: Colors.yellow,
                                      child: Text('Clock In'),
                                    ),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    RaisedButton(
                                      onPressed: () {},
                                      color: Colors.red,
                                      child: Text('Clock out'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }
                      
                        _buildEventsMarkerNum(date) {
                      
                        }
}
