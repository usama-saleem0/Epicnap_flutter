import 'package:first_project/controller/auth_module_controller/setpass_screen_controller.dart';
import 'package:first_project/controller/auth_module_controller/welcome_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/antisleep_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/history_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/maindashboard_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/privacy_screen_controller.dart';
import 'package:first_project/screens/custom_widgets/custom_primary_button.dart';
import 'package:first_project/utils/app_colors.dart';
import 'package:first_project/utils/app_constant.dart';
import 'package:first_project/welcome.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth_module_controller/name_screen_controller.dart';
import '../custom_widgets/custom_textfield.dart';

class PrivacyScreen extends GetView<PrivacyScreenController>{

  const PrivacyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSwitched = false;


    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF281f57),
              Color(0xFF161D34),
              Color(0xFF161D34),
              Color(0xFF281f57),
            ],
            stops: [0.0, 0.1, 0.85, 1.0],
          ),
        ),
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.all(0),

              children: [
                SizedBox(height: 20,),
                Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left:20.0),
                        child: Image.asset(
                          'assets/previous.png',
                          width: 25,
                          height: 25,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: 300,
                        padding: const EdgeInsets.only(right: 35.0),
                        child: Center(
                          child: Text(
                            'Terms of Use',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20,),




                Container(
                  padding: const EdgeInsets.only(left:30, right:30, top: 15.0),

                  width: MediaQuery.of(context).size.width - 180,
                  child: Column(
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Introduction',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                            ),

                          ),
                        ],
                      ),
                  SizedBox(height: 10,),
                  RichText(
                  text: TextSpan(
                  text: ' Welcome to Epicnap. These Terms of Use govern your access to and use of our website at www.epicnap.com, our mobile application, and any related services provided by Epicnap. By accessing or using our services, you agree to be bound by these terms and all applicable laws and regulations.',
                  style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  ),
                  )
                  ),
                      // Text(
                      //   'Welcome to Epicnap. These Terms of Use govern your access to and use of our website at www.epicnap.com, our mobile application, and any related services provided by Epicnap. By accessing or using our services, you agree to be bound by these terms and all applicable laws and regulations.',
                      //   style: TextStyle(
                      //     fontSize: 14,
                      //     color: Colors.white,
                      //   ),
                      //   overflow: TextOverflow.ellipsis,  // Show ellipsis (...) if the text overflows
                      //   maxLines: 4,  // Adjust the number of lines to show
                      // ),

                      SizedBox(height: 20,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Services Offered',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                            ),

                          ),
                        ],
                      ),

                      SizedBox(height: 10,),

                      Text(
                        'Epicnap provides a platform aimed at improving sleep habits through educational content, interactive tools, and a community for support. We offer both free services and a premium subscription that grants access to additional content and features to support our project.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,  // Show ellipsis (...) if the text overflows
                        maxLines: 6,  // Adjust the number of lines to show
                      ),

                      SizedBox(height: 20,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'User Accounts',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),

                          ),
                        ],
                      ),

                      SizedBox(height: 10,),

                      Text(
                        'To access certain features of our services, you may need to create an account. You agree to provide accurate information and keep your account details secure. You are responsible for all activities under your account.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,  // Show ellipsis (...) if the text overflows
                        maxLines: 6,  // Adjust the number of lines to show
                      ),

                      SizedBox(height: 20,),

                      SizedBox(height: 20,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Intellectual Property',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),

                          ),
                        ],
                      ),

                      SizedBox(height: 10,),

                      Text(
                        'All content and materials provided on Epicnap, including but not limited to text, graphics, logos, and software, are the property of Epicnap or its content suppliers and protected by copyright and intellectual property laws.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,  // Show ellipsis (...) if the text overflows
                        maxLines: 6,  // Adjust the number of lines to show
                      ),

                      SizedBox(height: 20,),

                      SizedBox(height: 20,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'User Conduct',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),

                          ),
                        ],
                      ),

                      SizedBox(height: 10,),

                      Text(
                  'You agree to use Epicnaps services for lawful purposes only. You will not engage in any conduct that restricts or inhibits anyone else s use or enjoyment of the services.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,  // Show ellipsis (...) if the text overflows
                        maxLines: 6,  // Adjust the number of lines to show
                      ),

                      SizedBox(height: 20,),

                      SizedBox(height: 20,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Disclaimer of Warranties',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),

                          ),
                        ],
                      ),

                      SizedBox(height: 10,),

                      Text(
                        'Epicnap provides its services on an "as is" and "as available" basis. We do not warrant that the services will be uninterrupted, secure, or error-free.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,  // Show ellipsis (...) if the text overflows
                        maxLines: 6,  // Adjust the number of lines to show
                      ),

                      SizedBox(height: 20,),

                      SizedBox(height: 20,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Limitation of Liability',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),

                          ),
                        ],
                      ),

                      SizedBox(height: 10,),

                      Text(
                        'Epicnap or its directors, employees, or agents will not be liable for any direct, indirect, incidental, special, or consequential damages arising from your use of our services.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,  // Show ellipsis (...) if the text overflows
                        maxLines: 6,  // Adjust the number of lines to show
                      ),

                      SizedBox(height: 20,),


                      SizedBox(height: 20,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Governing Law',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),

                          ),
                        ],
                      ),

                      SizedBox(height: 10,),

                      Text(
                        'These terms are governed by the laws of the Netherlands without regard to its conflict of law provisions.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,  // Show ellipsis (...) if the text overflows
                        maxLines: 6,  // Adjust the number of lines to show
                      ),

                      SizedBox(height: 20,),


                      SizedBox(height: 20,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Changes to Terms of Use',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),

                          ),
                        ],
                      ),

                      SizedBox(height: 10,),

                      Text(
                        'Epicnap reserves the right to modify these Terms of Use at any time. We will provide notice of any significant changes through our services or by email.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,  // Show ellipsis (...) if the text overflows
                        maxLines: 6,  // Adjust the number of lines to show
                      ),

                      SizedBox(height: 20,),



                      SizedBox(height: 20,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Contact Information',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),

                          ),
                        ],
                      ),

                      SizedBox(height: 10,),

                      Text(
                        'For any questions or concerns about these Terms of Use, please contact us via email at info@epicnap.com"',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,  // Show ellipsis (...) if the text overflows
                        maxLines: 6,  // Adjust the number of lines to show
                      ),

                      SizedBox(height: 20,),







                    ],
                  ),
                ),

                SizedBox(height: 10,),

                Divider(),

                SizedBox(height: 10,),

                Container(
                  child: Center(
                    child: Text(
                      'Privacy Policy for Epicnap',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),

                ),


                Container(
                  padding: const EdgeInsets.only(left:30, right:30, top: 15.0),

                  width: MediaQuery.of(context).size.width - 180,
                  child: Column(
                    children: [


                      SizedBox(height: 10,),
                      RichText(
                          text: TextSpan(
                            text: 'Epicnap is dedicated to safeguarding the privacy of our users. Our Privacy Policy outlines our practices regarding the collection, use, and protection of personal information for those who use the Epicnap app.',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          )
                      ),
                      // Text(
                      //   'Welcome to Epicnap. These Terms of Use govern your access to and use of our website at www.epicnap.com, our mobile application, and any related services provided by Epicnap. By accessing or using our services, you agree to be bound by these terms and all applicable laws and regulations.',
                      //   style: TextStyle(
                      //     fontSize: 14,
                      //     color: Colors.white,
                      //   ),
                      //   overflow: TextOverflow.ellipsis,  // Show ellipsis (...) if the text overflows
                      //   maxLines: 4,  // Adjust the number of lines to show
                      // ),

                      SizedBox(height: 20,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width:300,
                            child: Text(
                              'Information Collection and Use',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                              overflow: TextOverflow.ellipsis,  // Show ellipsis (...) if the text overflows
                              maxLines: 2,

                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 10,),

                      Text(
                        'We collect information to provide better services to all our users. The types of information we gather include:',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,  // Show ellipsis (...) if the text overflows
                        maxLines: 6,  // Adjust the number of lines to show
                      ),



                      SizedBox(height: 10,),

                      Text(
                        'Personal identification information (such as names and email addresses) when you provide it to us for the purpose of using Epicnaps features or receiving support.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,  // Show ellipsis (...) if the text overflows
                        maxLines: 6,  // Adjust the number of lines to show
                      ),


                      SizedBox(height: 10,),

                      Text(
                        'Usage data, which includes information on how you use the app and services.Information is collected:',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,  // Show ellipsis (...) if the text overflows
                        maxLines: 6,  // Adjust the number of lines to show
                      ),



                      SizedBox(height: 10,),

                      Text(
                        'Directly from you when you voluntarily provide it.Automatically through the app, including usage details and preferences.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,  // Show ellipsis (...) if the text overflows
                        maxLines: 6,  // Adjust the number of lines to show
                      ),

                      SizedBox(height: 20,),



                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Use of Data',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),

                          ),
                        ],
                      ),

                      SizedBox(height: 10,),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'The collected data is used in the following ways:',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                            overflow: TextOverflow.ellipsis,  // Show ellipsis (...) if the text overflows
                            maxLines: 6,  // Adjust the number of lines to show
                          ),
                        ],
                      ),

                      SizedBox(height: 10,),

                      Text(
                        'To operate and maintain the Epicnap app and its features.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,  // Show ellipsis (...) if the text overflows
                        maxLines: 6,  // Adjust the number of lines to show
                      ),

                      SizedBox(height: 10,),

                      Text(
                        'To provide customer support and manage user requests.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,  // Show ellipsis (...) if the text overflows
                        maxLines: 6,  // Adjust the number of lines to show
                      ),

                      SizedBox(height: 10,),

                      Text(
                        'For internal research purposes to enhance the apps functionality. All research data is processed anonymously.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,  // Show ellipsis (...) if the text overflows
                        maxLines: 6,  // Adjust the number of lines to show
                      ),

                      SizedBox(height: 20,),

                      SizedBox(height: 20,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Data Sharing and Disclosure',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),

                          ),
                        ],
                      ),

                      SizedBox(height: 10,),

                      Text(
                        'Epicnap does not share, sell, or lease personal data to third parties. The data we collect is used solely for internal purposes and research, with the following exceptions:',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,  // Show ellipsis (...) if the text overflows
                        maxLines: 6,  // Adjust the number of lines to show
                      ),



                      SizedBox(height: 10,),

                      Text(
                        'When required by law or to respond to legal processes.To protect our users and the public from harm or illegal activities.To enforce our terms and conditions.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,  // Show ellipsis (...) if the text overflows
                        maxLines: 6,  // Adjust the number of lines to show
                      ),

                      SizedBox(height: 20,),


                      SizedBox(height: 20,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Data Security',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),

                          ),
                        ],
                      ),

                      SizedBox(height: 10,),

                      Text(
                        'We are committed to protecting your data from unauthorized access, alteration, disclosure, or destruction. We have implemented appropriate physical, technical, and administrative security measures.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,  // Show ellipsis (...) if the text overflows
                        maxLines: 6,  // Adjust the number of lines to show
                      ),

                      SizedBox(height: 20,),



                      SizedBox(height: 20,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Your Rights',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),

                          ),
                        ],
                      ),

                      SizedBox(height: 10,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'You have the right to:',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                            overflow: TextOverflow.ellipsis,  // Show ellipsis (...) if the text overflows
                            maxLines: 6,  // Adjust the number of lines to show
                          ),
                        ],
                      ),

                      SizedBox(height: 10,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Access the personal information we hold about you.',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                            overflow: TextOverflow.ellipsis,  // Show ellipsis (...) if the text overflows
                            maxLines: 6,  // Adjust the number of lines to show
                          ),
                        ],
                      ),


                      SizedBox(height: 10,),

                      Text(
                        'Request correction of any incorrect or incomplete data.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,  // Show ellipsis (...) if the text overflows
                        maxLines: 6,  // Adjust the number of lines to show
                      ),

                      SizedBox(height: 10,),

                      Text(
                        'Request deletion of your personal data, subject to certain conditions.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,  // Show ellipsis (...) if the text overflows
                        maxLines: 6,  // Adjust the number of lines to show
                      ),

                      SizedBox(height: 10,),

                      Text(
                        'Withdraw consent at any time where we rely on consent to process your personal information.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,  // Show ellipsis (...) if the text overflows
                        maxLines: 6,  // Adjust the number of lines to show
                      ),

                      SizedBox(height: 20,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 300,
                            child: Text(
                              'Changes to This Privacy Policy',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),

                              overflow: TextOverflow.ellipsis,  // Show ellipsis (...) if the text overflows
                              maxLines: 6,

                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 10,),

                      Text(
                        'We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page. You are advised to review this Privacy Policy periodically for any changes.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,  // Show ellipsis (...) if the text overflows
                        maxLines: 6,  // Adjust the number of lines to show
                      ),

                      SizedBox(height: 20,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 300,
                            child: Text(
                              'Contact Us',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),

                              overflow: TextOverflow.ellipsis,  // Show ellipsis (...) if the text overflows
                              maxLines: 6,

                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 10,),

                      Text(
                        'For any questions about this Privacy Policy or our privacy practices, please contact us at info@epicnap.com.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,  // Show ellipsis (...) if the text overflows
                        maxLines: 6,  // Adjust the number of lines to show
                      ),

                      SizedBox(height: 30,),

                      Text(
                        'Email: info@epicnap.com',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,  // Show ellipsis (...) if the text overflows
                        maxLines: 6,  // Adjust the number of lines to show
                      ),

                      SizedBox(height: 10,),

                      Text(
                        'Website: www.epicnap.com"',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,  // Show ellipsis (...) if the text overflows
                        maxLines: 6,  // Adjust the number of lines to show
                      ),

                      SizedBox(height: 30,),









                    ],
                  ),
                ),

        ],
          ),
        ),
      ),
    );
  }



}