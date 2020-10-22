import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:isetechclub/widgets/textField.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _nameControl = TextEditingController();
  final _phoneControl = TextEditingController();
  final _msgControl = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _nameControl.dispose();
    _phoneControl.dispose();
    _msgControl.dispose();
    super.dispose();
  }

  sendMail() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'istcsce@gmail.com',
      query: 'subject=Query Request from ${_nameControl.text} with contact number ${_phoneControl.text}&body=${_msgControl.text}',
    );
    String  url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print( 'Could not launch $url');
    }

  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff251293),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:40, left: 20.0),
                  child: Text('CONTACT US', style: TextStyle(color: Colors.black45,fontWeight: FontWeight.bold,fontSize: 30),),
                ),
                TextFieldWidget(label: 'Enter Name',controllerName: _nameControl,textInputType: TextInputType.name,),
                TextFieldWidget(label: 'Enter Phone No',controllerName: _phoneControl,textInputType: TextInputType.phone,),
                TextFieldWidget(label: 'Type your message',maxLines: 6,controllerName: _msgControl,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RaisedButton(
                      padding: EdgeInsets.all(20),
                      child: Text('Contact us',style: TextStyle(color: Colors.white),),
                      color: Color(0xffFA949D),
                        onPressed: () {
                            sendMail();
                    }),
                    RaisedButton(
                        padding: EdgeInsets.all(20),
                        child: Text('Reset Form',style: TextStyle(color: Colors.white),),
                        color: Color(0xffFA949D),
                        onPressed: () {
                          _nameControl.clear();
                          _msgControl.clear();
                          _phoneControl.clear();
                        }),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


