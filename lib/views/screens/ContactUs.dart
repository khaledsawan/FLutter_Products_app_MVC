import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Contact Us'.tr,
        home: Scaffold(
          backgroundColor: Color(0xFF0A0E21),
          appBar: AppBar(
              backgroundColor: Color(0xFF111631),
              automaticallyImplyLeading: true,
              title: Title(
                title: 'Title',
                color: Colors.black,
                child: Container(
                  child: Text(
                    'Contact Us'.tr,
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      color: Color(0xDA00BBFF),
                    ),
                  ),
                ),
              ),
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                //onPressed:() => Navigator.pop(context, false),
                onPressed: () => Navigator.pop(context),
              )),
          body: GestureDetector(
            onTap: (){launch("tel:+963967184204");},
            child: Container(
              child: Center(
                child: Text(
                  'Phone :  +963 967184204'.tr,
                  style: TextStyle(
                    fontSize: 25,
                    fontStyle: FontStyle.italic,
                    color: Color(0xDA00BBFF),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
