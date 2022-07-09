import 'package:flutter/material.dart';
import '../../../utils/colors/colors.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    _makingPhoneCall() async {
      var url = Uri.parse("tel:(+963) 967184204");
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    _sendingMails() async {
      var url = Uri.parse("mailto:khaled963sawan@gmail.com@email.com");
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Could not launch $url';
      }
    }
    _openntelegram() async {
      var url = Uri.parse("https://t.me/Al_Hornet");
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.mainColor,
          title: const Center(
              child: Text(
            'Who we are',
            style: TextStyle(fontSize: 24),
          )),
        ),
        body: Container(
          margin: const EdgeInsets.only(left: 30, right: 30),
          padding: EdgeInsets.only(bottom: 5),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.05,
                ),
                Center(
                  child: SizedBox(
                      width: width - 17,
                      height: height * 0.22,
                      child: Image.asset('assets/image/team.png')),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                GestureDetector(
                  onTap: () {
                    _sendingMails();
                  },
                  child: IconThanText(
                      icon: Icons.alternate_email_outlined,
                      text: 'khaled963sawan@gmail.com',
                      color: AppColors.mainColor,
                    textColor: Colors.blue,
                  ),
                ),
                Divider(
                  color: AppColors.textColor,
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                GestureDetector(
                  onTap: () {
                    _makingPhoneCall();
                  },
                  child: IconThanText(
                      icon: Icons.phone_android_outlined,
                      text: '0967184204',
                      color: AppColors.mainColor,
                    textColor: Colors.blue,),
                ),
                Divider(
                  color: AppColors.textColor,
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                GestureDetector(
                  onTap: () {
                    _openntelegram();  },
                  child: IconThanText(
                      icon: Icons.telegram_outlined,
                      text: 'https://t.me/Al_Hornet',
                      color: AppColors.mainColor,
                    textColor: Colors.blue,),
                ),
                Divider(
                  color: AppColors.textColor,
                ),
                SizedBox(
                  height: height * 0.05,
                ),
              ],
            ),
          ),
        ));
  }
}

