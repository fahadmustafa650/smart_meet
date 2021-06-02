import 'package:flutter/material.dart';
import 'package:smart_meet/models/appointment_request_model.dart';
import 'package:smart_meet/screens/call_screen.dart';
import 'package:smart_meet/widgets/appointment_request.dart';
import 'Employee/employee_screens/appointment_requests_screen.dart';
import 'Employee/employee_screens/emp_sign_in_screen.dart';
import 'Employee/employee_screens/emp_sign_up_screen.dart';
import 'Visitor/Appointment/appointment_sent_screen.dart';
import 'Visitor/Appointment/request_appoinment_screen.dart';
import 'Visitor/Appointment/reserve_spot_employee_screen.dart';
import 'Visitor/Appointment/search_employee_screen.dart';
import 'Visitor/Appointment/search_result_screen.dart';
import 'Visitor/Visitor Authentication/visitor_sign_in_screen.dart';
import 'Visitor/Visitor Authentication/visitor_sign_up_screen.dart';
import 'Visitor/Visitor Verification Steps/facial_recognition_step3.dart';
import 'Visitor/Visitor Verification Steps/mask_detection_step4.dart';
import 'Visitor/Visitor Verification Steps/qr_code_step1.dart';
import 'Visitor/Visitor Verification Steps/temperature_detector_step2.dart';
import 'screens/chat_screen.dart';
import 'screens/chating_screen.dart';
import 'screens/contact_us.dart';
import 'screens/edit_profile_screen.dart';
import 'screens/map_screen.dart';
import 'screens/forget_password_screen.dart';
import 'screens/login_as_screen.dart';
import 'screens/new_password_screen.dart';
import 'screens/onboarding_screens.dart';
import 'screens/otp_screen.dart';
import 'screens/password_changed_successfully.dart';
import 'screens/splash_screen.dart';
import 'screens/sign_up_as_screen.dart';
import 'Visitor/visitor_profile_screen.dart';
import 'Employee/employee_screens/employee_profile_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: CustomSplashScreen.id,
      debugShowCheckedModeBanner: false,
      routes: {
        AppointmentRequestsScreen.id: (context) => AppointmentRequestsScreen(),
        AppointmentSentScreen.id: (context) => AppointmentSentScreen(),
        ChatingScreen.id: (context) => ChatingScreen(),
        ChatScreen.id: (context) => ChatScreen(),
        ContactUs.id: (context) => ContactUs(),
        CustomSplashScreen.id: (context) => CustomSplashScreen(),
        EmployeeProfileScreen.id: (context) => EmployeeProfileScreen(),
        EmployeeSearchBar.id: (context) => EmployeeSearchBar(),
        EmployeeSearchResultScreen.id: (context) =>
            EmployeeSearchResultScreen(),
        EmployeeSignInScreen.id: (context) => EmployeeSignInScreen(),
        EmployeeSignUpScreen.id: (context) => EmployeeSignUpScreen(),
        EditProfileScreen.id: (context) => EditProfileScreen(),
        FacialRecognitionStep3.id: (context) => FacialRecognitionStep3(),
        ForgetPasswordScreen.id: (context) => ForgetPasswordScreen(),
        LoginAsScreen.id: (context) => LoginAsScreen(),
        MapScreen.id: (context) => MapScreen(),
        MaskDetectionStep4.id: (context) => MaskDetectionStep4(),
        NewPasswordScreen.id: (context) => NewPasswordScreen(),
        OnBoardingScreens.id: (context) => OnBoardingScreens(),
        OtpScreen.id: (context) => OtpScreen(),
        PhoneCallScreen.id: (context) => PhoneCallScreen(),
        RequestAppointmentScreen.id: (context) => RequestAppointmentScreen(),
        ReserveEmployeeSpotScreen.id: (context) => ReserveEmployeeSpotScreen(),
        ScanQRCodeStep1.id: (context) => ScanQRCodeStep1(),
        SignUpAsScreen.id: (context) => SignUpAsScreen(),
        PasswordChanged.id: (context) => PasswordChanged(),
        TemperatureDetectionStep2.id: (context) => TemperatureDetectionStep2(),
        VisitorProfileScreen.id: (context) => VisitorProfileScreen(),
        VisitorSignInScreen.id: (context) => VisitorSignInScreen(),
        VisitorSignUpScreen.id: (context) => VisitorSignUpScreen(),
      },
    );
  }
}
