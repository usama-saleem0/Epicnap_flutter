import 'package:first_project/controller/auth_module_controller/analysis_screen_controller.dart';
import 'package:first_project/controller/auth_module_controller/create_password_screen_controller.dart';
import 'package:first_project/controller/auth_module_controller/gender_screen_controller.dart';
import 'package:first_project/controller/auth_module_controller/introduction_screen_controller.dart';
import 'package:first_project/controller/auth_module_controller/login_screen_controller.dart';
import 'package:first_project/controller/auth_module_controller/newlogin_screen_controller.dart';
import 'package:first_project/controller/auth_module_controller/otp_screen_controller.dart';
import 'package:first_project/controller/auth_module_controller/setpass_screen_controller.dart';
import 'package:first_project/controller/auth_module_controller/splash_screen_controller.dart';
import 'package:first_project/controller/auth_module_controller/thank_screen_controller.dart';
import 'package:first_project/controller/auth_module_controller/welcome_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/account_settings_controller.dart';
import 'package:first_project/controller/home_module_controller/add_notification_controller.dart';
import 'package:first_project/controller/home_module_controller/alarm_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/antisleep_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/bedtime_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/breathing_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/category_setting_controller.dart';
import 'package:first_project/controller/home_module_controller/chat_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/course_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/dashboard_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/exercise_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/faq_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/history_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/influencer_dashoard_controller.dart';
import 'package:first_project/controller/home_module_controller/influencer_home_controller.dart';
import 'package:first_project/controller/home_module_controller/influencer_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/library_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/maindashboard_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/music_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/notification_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/payment_add_controller.dart';
import 'package:first_project/controller/home_module_controller/payment_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/payment_setting_controller.dart';
import 'package:first_project/controller/home_module_controller/prehistory_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/privacy_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/profile_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/research_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/setalarm_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/settings_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/single_course_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/sound_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/support_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/tracking_screen_controller.dart';
import 'package:first_project/screens/home_module/category_setting_screen.dart';
import 'package:first_project/screens/home_module/single_influencer_screen.dart';
import 'package:get/get.dart';

import '../controller/auth_module_controller/accept_screen_controller.dart';
import '../controller/auth_module_controller/age_screen_controller.dart';
import '../controller/auth_module_controller/email_screen_controller.dart';
import '../controller/auth_module_controller/forget_screen_controller.dart';
import '../controller/auth_module_controller/name_screen_controller.dart';
import '../controller/auth_module_controller/register_screen_controller.dart';
import '../controller/home_module_controller/home_screen.dart';
import '../controller/home_module_controller/meditation_screen_controller.dart';
import '../controller/home_module_controller/single_influencer_screen_controller.dart';


class ScreenBindings extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => WelcomeScreenController());
   Get.lazyPut(() => LoginScreenController());
   Get.lazyPut(() => RegisterScreenController());
   Get.lazyPut(() => ForgetScreenController());

   Get.lazyPut(() => HomeScreenController());
   Get.lazyPut(() => SingleInfluencerScreenController());
   Get.lazyPut(() => SingleCourseScreenController());
   Get.lazyPut(() => DashboardScreenController());
   Get.lazyPut(() => CourseScreenController());
   Get.lazyPut(() => InfluencerScreenController());
   Get.lazyPut(() => InfluencerDashboardScreenController());
   Get.lazyPut(() => InfluencerHomeController());

   Get.lazyPut(() => PaymentScreenController());
   Get.lazyPut(() => SupportScreenController());
   Get.lazyPut(() => AccountSettingController());
   Get.lazyPut(() => ChatScreenController());
   Get.lazyPut(() => OtpScreenController());
   Get.lazyPut(() => CreatePasswordScreenController());
   Get.lazyPut(() => PaymentSettingController());
   Get.lazyPut(() => CategorySettingController());
   Get.lazyPut(() => PaymentAddController());



   Get.lazyPut(() => AcceptScreenController());
   Get.lazyPut(() => NameScreenController());
   Get.lazyPut(() => AgeScreenController());
   Get.lazyPut(() => EmailScreenController());
   Get.lazyPut(() => SetPassScreenController());
   Get.lazyPut(() => NewloginScreenController());
   Get.lazyPut(() => MainDashboardScreenController());
   Get.lazyPut(() => HistoryScreenController());
   Get.lazyPut(() => AntisleepScreenController());
   Get.lazyPut(() => AnalysisScreenController());
   Get.lazyPut(() => ProfileScreenController());
   Get.lazyPut(() => BedTimeScreenController());
   Get.lazyPut(() => TrackingScreenController());
   Get.lazyPut(() => AlarmScreenController());
   Get.lazyPut(() => SetAlarmScreenController());
   Get.lazyPut(() => PrivacyScreenController());
   Get.lazyPut(() => FaqScreenController());
   Get.lazyPut(() => SettingsScreenController());
   Get.lazyPut(() => IntroductionScreenController());
   Get.lazyPut(() => ThankScreenController());
   Get.lazyPut(() => SplashScreenController());
   Get.lazyPut(() => BreathingScreenController());
   Get.lazyPut(() => ExerciseScreenController());
   Get.lazyPut(() => MusicScreenController());
   Get.lazyPut(() => LibraryScreenController());
   Get.lazyPut(() => MaditateScreenController());
   Get.lazyPut(() => SoundScreenController());
   Get.lazyPut(() => NotificationScreenController());
   Get.lazyPut(() => ResearchScreenController());
   Get.lazyPut(() => PrehistoryScreenController());
   Get.lazyPut(() => AddNotificationController());


  }
}