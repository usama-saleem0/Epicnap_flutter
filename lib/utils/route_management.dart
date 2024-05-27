
import 'package:first_project/screens/auth_module/create_password_screen.dart';
import 'package:first_project/screens/auth_module/gender_screen.dart';
import 'package:first_project/screens/auth_module/introduction_screen.dart';
import 'package:first_project/screens/auth_module/name_screen.dart';
import 'package:first_project/screens/auth_module/newlogin_screen.dart';
import 'package:first_project/screens/auth_module/otp_screen.dart';
import 'package:first_project/screens/auth_module/setpass_screen.dart';
import 'package:first_project/screens/auth_module/splash_screen.dart';
import 'package:first_project/screens/auth_module/thank_screen.dart';
import 'package:first_project/screens/auth_module/welcome_screen.dart';
import 'package:first_project/screens/home_module/account_setting_screen.dart';
import 'package:first_project/screens/home_module/addnotification_screen.dart';
import 'package:first_project/screens/home_module/alarm_screen.dart';
import 'package:first_project/screens/home_module/analysis_screen.dart';
import 'package:first_project/screens/home_module/antisleep.dart';
import 'package:first_project/screens/home_module/bedtime_screen.dart';
import 'package:first_project/screens/home_module/breathing_screen.dart';
import 'package:first_project/screens/home_module/category_setting_screen.dart';
import 'package:first_project/screens/home_module/chat_screen.dart';
import 'package:first_project/screens/home_module/course_screen.dart';
import 'package:first_project/screens/home_module/dashboard_screen.dart';
import 'package:first_project/screens/home_module/exercise_screen.dart';
import 'package:first_project/screens/home_module/faq_screen.dart';
import 'package:first_project/screens/home_module/history_screen.dart';
import 'package:first_project/screens/home_module/influencer_dashboard_screen.dart';
import 'package:first_project/screens/home_module/influencer_home_screen.dart';
import 'package:first_project/screens/home_module/influencer_screen.dart';
import 'package:first_project/screens/home_module/library_screen.dart';
import 'package:first_project/screens/home_module/maindashboard_screen.dart';
import 'package:first_project/screens/home_module/music_screen.dart';
import 'package:first_project/screens/home_module/notification_screen.dart';
import 'package:first_project/screens/home_module/payment_add_screen.dart';
import 'package:first_project/screens/home_module/payment_screen.dart';
import 'package:first_project/screens/home_module/payment_setting_screen.dart';
import 'package:first_project/screens/home_module/paypalscreen.dart';
import 'package:first_project/screens/home_module/prehistory_screen.dart';
import 'package:first_project/screens/home_module/privacy_screen.dart';
import 'package:first_project/screens/home_module/profile_screen.dart';
import 'package:first_project/screens/home_module/research_screen.dart';
import 'package:first_project/screens/home_module/setalarm_screen.dart';
import 'package:first_project/screens/home_module/settings_screen.dart';
import 'package:first_project/screens/home_module/single_course_screen.dart';
import 'package:first_project/screens/home_module/single_influencer_screen.dart';
import 'package:first_project/screens/home_module/sound_screen.dart';
import 'package:first_project/screens/home_module/support_screen.dart';
import 'package:first_project/screens/home_module/tracking_screen.dart';
import 'package:first_project/utils/app_constant.dart';
import 'package:first_project/utils/screen_bindings.dart';
import 'package:get/get.dart';

import '../model/user_model.dart';
import '../screens/auth_module/accept_screen.dart';
import '../screens/auth_module/age_screen.dart';
import '../screens/auth_module/email_screen.dart';
import '../screens/auth_module/forget_screen.dart';
import '../screens/auth_module/login_screen.dart';
import '../screens/auth_module/register_screen.dart';
import '../screens/home_module/home.dart';
import '../screens/home_module/meditation_screen.dart';

class RouteGenerator {
  static List<GetPage> getPages() {

    return [
      GetPage(
        name: AppConstant.kWelcomeScreen,
        page: () => const WelcomeScreen(),
        binding: ScreenBindings(),
      ),

      GetPage(
        name: AppConstant.kSplashScreen,
        page: () => const SplashScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: AppConstant.kLoginScreen,
        page: () => const LoginScreen(),
        binding: ScreenBindings(),
      ),


      GetPage(
        name: AppConstant.kRegisterScreen,
        page: () => const RegisterScreen(),
        binding: ScreenBindings(),
      ),

      GetPage(
        name: AppConstant.kForgetScreen,
        page: () => const ForgetScreen(),
        binding: ScreenBindings(),
      ),

      GetPage(
        name: AppConstant.kHomeScreen,
        page: () => const HomeScreen(),
        binding: ScreenBindings(),
      ),


      GetPage(
        name: AppConstant.kSingleInfluencerScreen,
        page: () => const SingleInfluencerScreen(),
        binding: ScreenBindings(),
      ),

      GetPage(
        name: AppConstant.kSingleCourseScreen,
        page: () => const SingleCourseScreen(),
        binding: ScreenBindings(),
      ),

      GetPage(
        name: AppConstant.kDashboardScreen,
        page: () => const DashboardScreen(),
        binding: ScreenBindings(),
      ),


      GetPage(
        name: AppConstant.kCourseScreen,
        page: () => const CourseScreen(),
        binding: ScreenBindings(),
      ),

      GetPage(
        name: AppConstant.kInfluencerScreen,
        page: () => const InfluencerScreen(),
        binding: ScreenBindings(),
      ),


      GetPage(
        name: AppConstant.kInfluencerDashboardScreen,
        page: () => const InfluencerDashboardScreen(),
        binding: ScreenBindings(),
      ),

      GetPage(
        name: AppConstant.kInfluencerHomeScreen,
        page: () => const InfluencerHomeScreen(),
        binding: ScreenBindings(),
      ),




      GetPage(
        name: AppConstant.kPaymentScreen,
        page: () => const PaymentScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: AppConstant.kSupportScreen,
        page: () => const SupportScreen(),
        binding: ScreenBindings(),
      ),

      GetPage(
        name: AppConstant.kAccountSetting,
        page: () => const AccountSettingScreen(),
        binding: ScreenBindings(),
      ),


      GetPage(
        name: AppConstant.kChatScreen,
        page: () => const ChatScreen(),
        binding: ScreenBindings(),
      ),

      GetPage(
        name: AppConstant.kOtpScreen,
        page: () => const OtpScreen(),
        binding: ScreenBindings(),
      ),


      GetPage(
        name: AppConstant.kCreatePasswordScreen,
        page: () => const CreatePasswordScreen(),
        binding: ScreenBindings(),
      ),


      GetPage(
        name: AppConstant.kPaymentSettingScreen,
        page: () => const PaymentSettingScreen(),
        binding: ScreenBindings(),
      ),

      GetPage(
        name: AppConstant.kCategorySettingScreen,
        page: () => const CategorySettingScreen(),
        binding: ScreenBindings(),
      ),

      GetPage(
        name: AppConstant.kPaymentAddScreen,
        page: () => const PaymentAddScreen(),
        binding: ScreenBindings(),
      ),

      // new app


      GetPage(
        name: AppConstant.kAcceptScreen,
        page: () => const AcceptScreen(),
        binding: ScreenBindings(),
      ),



      GetPage(
        name: AppConstant.kNameScreen,
        page: () => const NameScreen(),
        binding: ScreenBindings(),
      ),

      GetPage(
        name: AppConstant.kAgeScreen,
        page: () => const AgeScreen(),
        binding: ScreenBindings(),
      ),

      GetPage(
        name: AppConstant.kEmailScreen,
        page: () => const EmailScreen(),
        binding: ScreenBindings(),
      ),


      GetPage(
        name: AppConstant.kSetPassScreen,
        page: () => const SetPassScreen(),
        binding: ScreenBindings(),
      ),


      GetPage(
        name: AppConstant.kNewLoginScreen,
        page: () => const NewloginScreen(),
        binding: ScreenBindings(),
      ),



      GetPage(
        name: AppConstant.kMainDashboardScreen,
        page: () => const MainDashboradScreen(),
        binding: ScreenBindings(),
      ),

      GetPage(
        name: AppConstant.kHistoryScreen,
        page: () => const HistoryScreen(),
        binding: ScreenBindings(),
      ),

      GetPage(
        name: AppConstant.kAntisleepScreen,
        page: () => const AntisleepScreen(),
        binding: ScreenBindings(),
      ),

      GetPage(
        name: AppConstant.kAnalysisScreen,
        page: () => const AnalysisScreen(),
        binding: ScreenBindings(),
      ),

      GetPage(
        name: AppConstant.kProfileScreen,
        page: () => const ProfileScreen(),
        binding: ScreenBindings(),
      ),

      GetPage(
        name: AppConstant.kBedtimeScreen,
        page: () => const BedTimeScreen(),
        binding: ScreenBindings(),
      ),

      GetPage(
        name: AppConstant.kTrackingScreen,
        page: () => const TrackingScreen(),
        binding: ScreenBindings(),
      ),

      GetPage(
        name: AppConstant.kAlarmScreen,
        page: () => const AlarmScreen(),
        binding: ScreenBindings(),
      ),

      // GetPage(
      //   name: AppConstant.kAlarmScreen,
      //   page: () => AlarmScreen(userModel: UserModel(), alarms: []), // Provide a default value for alarms
      //   binding: ScreenBindings(),
      // ),

      GetPage(
        name: AppConstant.kSetAlarmScreen,
        page: () => const SetAlarmScreen(),
        binding: ScreenBindings(),
      ),

      GetPage(
        name: AppConstant.kPrivacyScreen,
        page: () => const PrivacyScreen(),
        binding: ScreenBindings(),
      ),

      GetPage(
        name: AppConstant.kFaqScreen,
        page: () => const FaqScreen(),
        binding: ScreenBindings(),
      ),

      GetPage(
        name: AppConstant.kSettingsScreen,
        page: () => const SettingsScreen(),
        binding: ScreenBindings(),
      ),

      GetPage(
        name: AppConstant.kIntroductionScreen,
        page: () => const IntroductionScreen(),
        binding: ScreenBindings(),
      ),


      GetPage(
        name: AppConstant.kThankScreen,
        page: () => const ThankScreen(),
        binding: ScreenBindings(),
      ),


      GetPage(
        name: AppConstant.kBreathingScreen,
        page: () => const BreathingScreen(),
        binding: ScreenBindings(),
      ),

      GetPage(
        name: AppConstant.kExerciseScreen,
        page: () => const ExerciseScreen(),
        binding: ScreenBindings(),
      ),

      GetPage(
        name: AppConstant.kMUSICScreen,
        page: () => const MusicScreen(),
        binding: ScreenBindings(),
      ),


      GetPage(
        name: AppConstant.kLibraryScreen,
        page: () => const LibraryScreen(),
        binding: ScreenBindings(),
      ),


      GetPage(
        name: AppConstant.kGenderScreen,
        page: () => const GenderScreen(),
        binding: ScreenBindings(),
      ),


      GetPage(
        name: AppConstant.kMeditateScreen,
        page: () => const MeditateScreen(),
        binding: ScreenBindings(),
      ),


      GetPage(
        name: AppConstant.kSoundScreen,
        page: () => const SoundScreen(),
        binding: ScreenBindings(),
      ),



      GetPage(
        name: AppConstant.kNotificationScreen,
        page: () => const NotificationScreen(),
        binding: ScreenBindings(),
      ),


      GetPage(
        name: AppConstant.kResearchScreen,
        page: () => const ResearchScreen(),
        binding: ScreenBindings(),
      ),


      GetPage(
        name: AppConstant.kPrehistoryScreen,
        page: () => const PrehistoryScreen(),
        binding: ScreenBindings(),
      ),


      GetPage(
        name: AppConstant.kAddNotificationScreen,
        page: () => const AddNotificationScreen(),
        binding: ScreenBindings(),
      ),








    ];
  }


}
