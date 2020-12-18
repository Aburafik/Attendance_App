import 'package:flutter/material.dart';



class CardSelectors extends StatelessWidget {
  final String label;
  final IconData icon;
  final Function onTap;
  CardSelectors({this.icon, this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: 10,
          child: Container(
            padding: EdgeInsets.all(30),
            height: 160,
            width: 135,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    size: 30,
                    color: Colors.red,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    label,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
