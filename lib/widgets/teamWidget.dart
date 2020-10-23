import 'package:flutter/material.dart';

class TeamWidget extends StatelessWidget {

  final String label;
  final Widget child;

  const TeamWidget({this.label, this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,style: TextStyle(color:Colors.white,fontSize: 28,fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(18),
            ),
            child: child,
          ),
        ]);
  }
}
