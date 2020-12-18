import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myfirstapp/constants.dart';
import 'package:myfirstapp/screens/attendanceRecorder.dart';
import 'package:myfirstapp/screens/reports.dart';
import 'package:myfirstapp/widgets/cardSelectors.dart';

class DashBordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DASHBOARD'),
        elevation: 0,
        centerTitle: true,
        backgroundColor: generalColor,
      ),
      drawer: Drawer(
        //Drawer Function
        child: drawer(),
      ),
      backgroundColor: generalColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CardSelectors(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AttendanceRecorder(),
                      ),
                    );
                  },
                  icon: FontAwesomeIcons.mapMarker,
                  label: 'Attendance Recorder',
                ),
                CardSelectors(
                  icon: FontAwesomeIcons.chartBar,
                  label: 'Attendance Summary',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CardSelectors(
                  icon: Icons.map_sharp,
                  label: 'Leaves Application',
                ),
                CardSelectors(
                  icon: FontAwesomeIcons.addressBook,
                  label: 'Reports',
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Reports()));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
//Drawer Funtion
  drawer() {
    return ListView(
      children: [
        DrawerHeader(child: Text('Attendance')),
        DrawerSelectors(
          userProfile: "Profile",
          profileIcon: Icons.person,
        ),
        Divider(),
        DrawerSelectors(userProfile: '',
        profileIcon: Icons.ad_units,),
        Divider(),
        DrawerSelectors(userProfile: '',
        profileIcon: Icons.album,),
        Divider(),

              SizedBox(height: 120,),
        Align(
          alignment: Alignment.center,
          child: Text('v.00.00'))

      ],
    );
  }
}
//Drawer Selectors
class DrawerSelectors extends StatelessWidget {
  final String userProfile;
  final IconData profileIcon;
  DrawerSelectors({this.profileIcon, this.userProfile});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        userProfile,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
      ),
      leading: Icon(profileIcon,size: 35,),
    );
  }
}



