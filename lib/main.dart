import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_meet/Visitor/Visitor%20Verification%20Steps/booked_appointment_qrcode.dart';
import 'package:smart_meet/models/appointment_request_model.dart';
import 'package:smart_meet/providers/visitor_provider.dart';
import 'package:smart_meet/screens/call_screen.dart';
import 'package:smart_meet/screens/image_picker_test.dart';
import 'package:smart_meet/widgets/appointment_request.dart';
import 'Employee/employee_screens/appointment_requests_screen.dart';
import 'Employee/employee_screens/emp_sign_in_screen.dart';
import 'Employee/employee_screens/emp_sign_up_screen.dart';
import 'Visitor/Appointment/appointment_sent_screen.dart';
import 'Visitor/Appointment/request_appoinment_screen.dart';
import 'Visitor/Appointment/reserve_spot_employee_screen.dart';
import 'Visitor/Appointment/search_employee_screen.dart';
import 'Visitor/Appointment/search_result_screen - Copy.dart';
import 'Visitor/Appointment/search_result_screen.dart';
import 'Visitor/Visitor Authentication/visitor_sign_in_screen.dart';
import 'Visitor/Visitor Authentication/visitor_sign_up_screen.dart';
import 'Visitor/Visitor Verification Steps/facial_recognition_step2.dart';
import 'Visitor/Visitor Verification Steps/mask_detection_step4.dart';
import 'Visitor/Visitor Verification Steps/qr_code_step1.dart';
import 'Visitor/Visitor Verification Steps/temperature_detector_step3.dart';
import 'screens/chat_screen.dart';
import 'screens/chating_screen.dart';
import 'screens/edit_profile_screen.dart';
import 'screens/map_screen.dart';
import 'screens/enter_email_screen.dart';
import 'screens/login_as_screen.dart';
import 'screens/new_password_screen.dart';
import 'screens/onboarding_screens.dart';
import 'screens/otp_screen.dart';
import 'screens/password_changed_successfully.dart';
import 'screens/show_image.dart';
import 'screens/splash_screen.dart';
import 'screens/sign_up_as_screen.dart';
import 'Visitor/visitor_home_screen.dart';
import 'Employee/employee_screens/employee_profile_screen.dart';
import 'screens/test_api.dart';
import 'package:provider/provider.dart';
import 'screens/test_image_picker.dart';
import 'widgets/image_picker_bottom.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoggedIn = false;

  Future<void> getVisitingFlag() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool alreadyVisited = preferences.getBool('alreadyVisited') ?? false;
    setState(() {
      isLoggedIn = alreadyVisited;
    });

    print('isLoggedIn=$isLoggedIn');
    //return alreadyVisited;
  }

  @override
  void initState() {
    super.initState();
    getVisitingFlag();

    ///whatever you want to run on page build
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Visitors(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: ShowImage(),
        home: VisitorSignUpScreen(),
        // initialRoute: VisitorHomeScreen.id,
        routes: {
          AppointmentRequestsScreen.id: (context) =>
              AppointmentRequestsScreen(),
          AppointmentSentScreen.id: (context) => AppointmentSentScreen(),
          BookedAppointmentQRCode.id: (context) => BookedAppointmentQRCode(),
          BookedAppointmentsScreen.id: (context) => BookedAppointmentsScreen(),
          ChatingScreen.id: (context) => ChatingScreen(),
          ChatScreen.id: (context) => ChatScreen(),
          CustomSplashScreen.id: (context) => CustomSplashScreen(),
          EditProfileScreen.id: (context) => EditProfileScreen(),
          EmployeeSignInScreen.id: (context) => EmployeeSignInScreen(),
          EmployeeSignUpScreen.id: (context) => EmployeeSignUpScreen(),
          EmployeeHomeScreen.id: (context) => EmployeeHomeScreen(),
          EmployeeSearchResultScreen.id: (context) =>
              EmployeeSearchResultScreen(),
          EmployeeSearchBar.id: (context) => EmployeeSearchBar(),
          EmployeeSearchResultScreen.id: (context) =>
              EmployeeSearchResultScreen(),
          EnterEmailScreen.id: (context) => EnterEmailScreen(),
          FacialRecognitionStep2.id: (context) => FacialRecognitionStep2(),
          LoginAsScreen.id: (context) => LoginAsScreen(),
          MapScreen.id: (context) => MapScreen(),
          MaskDetectionStep4.id: (context) => MaskDetectionStep4(),
          OnBoardingScreens.id: (context) => OnBoardingScreens(),
          PhoneCallScreen.id: (context) => PhoneCallScreen(),
          RequestAppointmentScreen.id: (context) => RequestAppointmentScreen(),
          ReserveEmployeeSpotScreen.id: (context) =>
              ReserveEmployeeSpotScreen(),
          ScanQRCodeStep1.id: (context) => ScanQRCodeStep1(),
          SignUpAsScreen.id: (context) => SignUpAsScreen(),
          PasswordChanged.id: (context) => PasswordChanged(),
          TemperatureDetectionStep3.id: (context) =>
              TemperatureDetectionStep3(),
          VisitorHomeScreen.id: (context) => VisitorHomeScreen(),
          VisitorSignInScreen.id: (context) => VisitorSignInScreen(),
          VisitorSignUpScreen.id: (context) => VisitorSignUpScreen(),
        },
      ),
    );
  }
}
