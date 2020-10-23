import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:isetechclub/widgets/teamWidget.dart';

class TeamScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: ListView(
        children: [
          TeamWidget(label: 'Core Team',child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Container(
                      width: 150.0,
                      height: 150.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover, image: NetworkImage('https://avatars3.githubusercontent.com/u/40989391?s=460&u=3d8294720a7b1e086d0ca4d276060b3e5eb1adee&v=4')),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text('Md. Akram Kazmi',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Container(
                      width: 150.0,
                      height: 150.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover, image: NetworkImage('https://avatars3.githubusercontent.com/u/28218435?s=400&amp;u=ffb9101bbbcb7871980f9a98186342ec2742d62a')),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text('Niranjan Hegde',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),),
                  ],
                ),
              ),
            ],
          ),),
          SizedBox(height: 30,),
          TeamWidget(label: 'Development Team',child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Container(
                          width: 150.0,
                          height: 150.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover, image: NetworkImage('https://avatars1.githubusercontent.com/u/69085818?s=460&u=a1345469f63ed7a0bf06716b852b0b60b64ae0f1&v=4')),
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text('Ashutosh',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Container(
                          width: 150.0,
                          height: 150.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover, image: NetworkImage('https://avatars1.githubusercontent.com/u/55646472?s=400&u=14f72c26eb7087a160e0415a30f183001067c92a&v=4')),
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text('Pranav N',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Container(
                          width: 150.0,
                          height: 150.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover, image: NetworkImage('https://avatars2.githubusercontent.com/u/72809868?s=400&u=510f2f375b361075ef4074df20195c406e87b51f&v=4')),
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text('MAHADEVI N C',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),),
          SizedBox(height: 30,),
          TeamWidget(label: 'Marketing Team',child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Container(
                      width: 150.0,
                      height: 150.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover, image: NetworkImage('https://media-exp1.licdn.com/dms/image/C4E03AQFOY_Tze8VQYw/profile-displayphoto-shrink_200_200/0?e=1608163200&v=beta&t=dOMZDFbpE2RB29LzmUlCB3W07ciO5poXXWr3H7P3dxA')),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text('Vivek Singh Kushwaha',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),),
                  ],
                ),
              ),
            ],
          ),),
        ],
      ),
    );
  }
}
