import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';


class SocialMediaWidget extends StatelessWidget {

  final IconData faIcon;
  final Color color;
  final String link;

  const SocialMediaWidget({Key key, this.faIcon, this.color, this.link}) : super(key: key);

  _launchURL() async {
    String url = link;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: IconButton(
        icon: FaIcon(
          faIcon,
          color: color,
          size: 32,
        ),
        onPressed: () {
            _launchURL();
        },
      ),
    );
  }




}