import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/colors/colors.dart';
import '../../../widgets/icon_than_text/icon_than_text.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: width,
                  height: height * 0.35,
                  margin: EdgeInsets.fromLTRB(50, 50, 50, 30),
                  // padding: EdgeInsets.all(100),
                  decoration: BoxDecoration(
                      color: AppColors.backGruond,
                      image:  DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            'images/assets/how we are.png',
                          ))),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: Icon_Than_Text(
                    icon: Icons.person_outline,
                    color: AppColors.blue,
                    text: 'khaled sawan',
                  ),
                ),
                GestureDetector(
                  onTap: ()
                  {
                    final Uri emailLaunchUri = Uri(
                      scheme: 'mailto',
                      path: 'khaled963sawan@gmail.com',
                      query: encodeQueryParameters(<String, String>{
                        'subject': 'just test don\'t forget to change'
                      }),
                    );

                    launch(emailLaunchUri.toString());
                  },
                  child: Container(
                    margin: EdgeInsets.all(20),
                    child: Icon_Than_Text(
                        icon: Icons.email_outlined,
                        color: AppColors.blue,
                        text: 'khaled963sawan@gmail.com'
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: ()
                  {
                    launch("tel:+963967184204");
                  },
                  child: Container(
                    margin: EdgeInsets.all(20),
                    child: Icon_Than_Text(
                        icon: Icons.phone_outlined,
                        color: AppColors.blue,
                        text: '+963 967184204'
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){

                  },
                  child: Container(
                    margin: EdgeInsets.all(20),
                    child: Icon_Than_Text(
                        icon: Icons.location_on_outlined,
                        color: AppColors.blue,
                        text: 'Syria => Damascus '
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
